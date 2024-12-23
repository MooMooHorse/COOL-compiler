// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-sccp"
#include "UnitSCCP.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/IR/PatternMatch.h"
#include "llvm/IR/ConstantFold.h"
#include "llvm/IR/InstrTypes.h"
#include <system_error>
#include <iostream>

using namespace llvm;
using namespace cs426;

#define WORKLIST_LENGTH 64

static void printBasicBlockInstructions(const BasicBlock *block, std::ostream *ct) {
    if (!block || !ct) return; // Check for null pointers

    *ct << "    Block: ";
    if (block->getName().empty()) {
        *ct << "(unnamed block)";
    } else {
        *ct << block->getName().str();
    }
    *ct << "\n";

    // Print instructions in the block
    *ct << "      Instructions:\n";
    for (const auto &inst : *block) {
        std::string instStr;
        llvm::raw_string_ostream rso(instStr);
        inst.print(rso); // Print the instruction to the string
        *ct << "        " << rso.str() << "\n";
    }
}

PreservedAnalyses UnitSCCP::run(Function &F, FunctionAnalysisManager &FAM) {
  dbgs() << "Running SCCP on function: " << F.getName() << "\n";

  DenseMap<Value *, LatticeValue> Lattice;
  SmallVector<EdgePair, WORKLIST_LENGTH> CFGWorkList;
  SmallVector<ValInstPair, WORKLIST_LENGTH> SSAWorkList;
  std::set<EdgePair> Visited;
  DenseMap<BasicBlock*, bool> BlockExecutable;

  initializeLattice(Lattice, CFGWorkList, F);

  // LLM Copilot assisted block
  // Mark the entry block as executable
  BasicBlock *Entry = &F.getEntryBlock();
  BlockExecutable[Entry] = true;

  // Add all instructions of the entry block into the SSAWorkList
  for (auto &I : *Entry) {
    SSAWorkList.push_back({&I, &I});
  }

  // DEBUG
  for(auto &BB : F) {
    printBasicBlockInstructions(&BB, &std::cerr);
  }

  bool Changed = true;
  while (Changed) {
    Changed = false;

    while (!CFGWorkList.empty()) {
      auto Edge = CFGWorkList.pop_back_val();
      BasicBlock *Src = Edge.first;
      BasicBlock *Dst = Edge.second;

      if (!BlockExecutable.lookup(Src))
        continue;

      if (Visited.find(Edge) == Visited.end()) {
        Visited.insert(Edge);
        if (!BlockExecutable.lookup(Dst)) {
          BlockExecutable[Dst] = true;
          for (auto &I : *Dst)
            SSAWorkList.push_back({&I, &I});
        }
        evaluateAllPhisInBlock(Src, Dst, SSAWorkList);
      }
    }

    while (!SSAWorkList.empty()) {
      auto SSAEdge = SSAWorkList.pop_back_val();
      Instruction *Inst = SSAEdge.second;
      if (!BlockExecutable.lookup(Inst->getParent()))
        continue;

      if (auto *BI = dyn_cast<BranchInst>(Inst)) {
        evaluateConditional(BI, Lattice, CFGWorkList, BlockExecutable);
      } else {
        LatticeValue OldVal = Lattice[Inst];
        evaluateAssign(Inst, Lattice, SSAWorkList);
        LatticeValue NewVal = Lattice[Inst];
        if ((OldVal.State != NewVal.State) ||
            (OldVal.ConstantVal != NewVal.ConstantVal)) {
          Changed = true;
        }
      }
    }
  }

  // Now we have a stable lattice. Let's do final replacements and cleanup.
  replaceConstants(F, Lattice);
  removeUnreachableBlocks(F);

  // DEBUG
  for(auto &BB : F) {
    printBasicBlockInstructions(&BB, &std::cout);
  }

  dbgs() << "SCCP Statistics:\n"
         << "Instructions removed: " << NumInstRemoved << "\n"
         << "Basic blocks made unreachable: " << NumBlocksUnreachable << "\n"
         << "Instructions replaced with constants: " << NumInstReplaced << "\n";

  return PreservedAnalyses::none();
}

void UnitSCCP::initializeLattice(DenseMap<Value *, LatticeValue> &Lattice,
                                 SmallVectorImpl<EdgePair> &W,
                                 Function &F) {
  // Set all instructions and arguments to Undefined initially, constants to Constant
  for (auto &BB : F) {
    for (auto &I : BB) {
      if (isa<Constant>(&I)) {
        Lattice[&I].setConstant(cast<Constant>(&I));
      } else {
        Lattice[&I].setUndefined();
      }
    }
  }

  for (auto &Arg : F.args()) {
    if (!Lattice.count(&Arg))
      Lattice[&Arg].setUndefined();
  }

  BasicBlock *Entry = &F.getEntryBlock();
  for (auto *Succ : successors(Entry)) {
    W.push_back({Entry, Succ});
  }
}

void UnitSCCP::evaluateAllPhisInBlock(BasicBlock *Src, BasicBlock *Dst,
                                      SmallVectorImpl<ValInstPair> &SSAWorkList) {
  for (auto &I : *Dst) {
    if (auto *PHI = dyn_cast<PHINode>(&I)) {
      int Idx = PHI->getBasicBlockIndex(Src);
      if (Idx >= 0) {
        Value *Incoming = PHI->getIncomingValue((unsigned)Idx);
        SSAWorkList.push_back({Incoming, PHI});
      }
    }
  }
}

void UnitSCCP::evaluateConditional(BranchInst *BI, DenseMap<Value *, LatticeValue> &Lattice,
                                  SmallVectorImpl<EdgePair> &CFGWorkList,
                                  DenseMap<BasicBlock*, bool> &BlockExecutable) {
  if (BI->isConditional()) {
    LatticeValue CV = Lattice[BI->getCondition()];
    if (CV.isConstant()) {
      if (auto *CInt = dyn_cast<ConstantInt>(CV.ConstantVal)) {
        bool Taken = CInt->isOne();
        CFGWorkList.push_back({BI->getParent(), BI->getSuccessor(Taken ? 0 : 1)});
      } else {
        for (unsigned i = 0; i < BI->getNumSuccessors(); ++i)
          CFGWorkList.push_back({BI->getParent(), BI->getSuccessor(i)});
      }
    } else if (CV.isOverdefined()) {
      for (unsigned i = 0; i < BI->getNumSuccessors(); ++i)
        CFGWorkList.push_back({BI->getParent(), BI->getSuccessor(i)});
    } else {
      for (unsigned i = 0; i < BI->getNumSuccessors(); ++i)
        CFGWorkList.push_back({BI->getParent(), BI->getSuccessor(i)});
    }
  } else {
    for (unsigned i = 0; i < BI->getNumSuccessors(); ++i)
      CFGWorkList.push_back({BI->getParent(), BI->getSuccessor(i)});
  }
}

void UnitSCCP::evaluateAssign(Instruction *I,
                             DenseMap<Value *, LatticeValue> &Lattice,
                             SmallVectorImpl<ValInstPair> &SSAWorkList) {
  LatticeValue NewVal = computeInstructionValue(I, Lattice);
  LatticeValue &OldVal = Lattice[I];

  if ((OldVal.State != NewVal.State) || (OldVal.ConstantVal != NewVal.ConstantVal)) {
    OldVal = NewVal;
    // Update users
    for (auto *U : I->users()) {
      if (auto *UI = dyn_cast<Instruction>(U)) {
        SSAWorkList.push_back({I, UI});
      }
    }
  }
}

LatticeValue UnitSCCP::computeInstructionValue(Instruction *I, DenseMap<Value *, LatticeValue> &Lattice) {
  LatticeValue Result;
  Result.setOverdefined(); // Default case

  auto GetLV = [&](Value *V) -> LatticeValue {
    auto It = Lattice.find(V);
    if (It != Lattice.end())
      return It->second;

    // If not found in Lattice, check if it's a constant
    if (auto *C = dyn_cast<Constant>(V)) {
      LatticeValue LV;
      LV.setConstant(const_cast<Constant*>(C));
      return LV;
    }

    // Default to undefined
    LatticeValue LV;
    LV.setUndefined();
    return LV;
  };

  if (auto *PHI = dyn_cast<PHINode>(I)) {
    bool Overdef = false;
    bool AnyConst = false;
    bool AnyUndef = false;
    Constant *CommonC = nullptr;

    for (unsigned i = 0, e = PHI->getNumIncomingValues(); i < e; i++) {
      Value *Incoming = PHI->getIncomingValue(i);
      LatticeValue IV = GetLV(Incoming);
      if (IV.isOverdefined()) {
        Overdef = true;
        break;
      } else if (IV.isConstant()) {
        if (!AnyConst) {
          AnyConst = true;
          CommonC = IV.ConstantVal;
        } else if (CommonC != IV.ConstantVal) {
          Overdef = true;
          break;
        }
      } else {
        AnyUndef = true;
      }
    }

    if (Overdef) {
      Result.setOverdefined();
    } else if (AnyConst && !AnyUndef) {
      Result.setConstant(CommonC);
    } else {
      Result.setUndefined();
    }
    return Result;
  }

  if (auto *BO = dyn_cast<BinaryOperator>(I)) {
    LatticeValue LA = GetLV(BO->getOperand(0));
    LatticeValue LB = GetLV(BO->getOperand(1));
    if (LA.isConstant() && LB.isConstant()) {
      if (Constant *C = evaluateBinaryOp(BO->getOpcode(), LA.ConstantVal, LB.ConstantVal))
        Result.setConstant(C);
      else
        Result.setOverdefined();
    } else if (LA.isOverdefined() || LB.isOverdefined()) {
      Result.setOverdefined();
    } else {
      Result.setUndefined();
    }
    return Result;
  }

  if (auto *CI = dyn_cast<CastInst>(I)) {
    LatticeValue SrcVal = GetLV(CI->getOperand(0));
    if (SrcVal.isConstant()) {
      if (Constant *C = evaluateCastOp(CI->getOpcode(), SrcVal.ConstantVal, CI->getType()))
        Result.setConstant(C);
      else
        Result.setOverdefined();
    } else if (SrcVal.isOverdefined()) {
      Result.setOverdefined();
    } else {
      Result.setUndefined();
    }
    return Result;
  }

  if (auto *Cmp = dyn_cast<CmpInst>(I)) {
    LatticeValue LHS = GetLV(Cmp->getOperand(0));
    LatticeValue RHS = GetLV(Cmp->getOperand(1));
    bool IsFcmp = isa<FCmpInst>(Cmp);
    if (LHS.isConstant() && RHS.isConstant()) {
      if (Constant *C = evaluateCmpOp(Cmp->getPredicate(), LHS.ConstantVal, RHS.ConstantVal, IsFcmp))
        Result.setConstant(C);
      else
        Result.setOverdefined();
    } else if (LHS.isOverdefined() || RHS.isOverdefined()) {
      Result.setOverdefined();
    } else {
      Result.setUndefined();
    }
    return Result;
  }

  if (auto *Sel = dyn_cast<SelectInst>(I)) {
    LatticeValue CondVal = GetLV(Sel->getCondition());
    LatticeValue TrueVal = GetLV(Sel->getTrueValue());
    LatticeValue FalseVal = GetLV(Sel->getFalseValue());

    if (CondVal.isConstant()) {
      if (auto *CInt = dyn_cast<ConstantInt>(CondVal.ConstantVal)) {
        bool Taken = CInt->isOne();
        LatticeValue Chosen = Taken ? TrueVal : FalseVal;
        if (Chosen.isConstant())
          Result.setConstant(Chosen.ConstantVal);
        else if (Chosen.isOverdefined())
          Result.setOverdefined();
        else
          Result.setUndefined();
        return Result;
      }
    }

    // If condition not constant, merge TrueVal and FalseVal
    if (TrueVal.isOverdefined() || FalseVal.isOverdefined()) {
      Result.setOverdefined();
    } else if (TrueVal.isConstant() && FalseVal.isConstant()) {
      if (TrueVal.ConstantVal == FalseVal.ConstantVal) {
        Result.setConstant(TrueVal.ConstantVal);
      } else {
        Result.setOverdefined();
      }
    } else if (TrueVal.isUndefined() && FalseVal.isUndefined()) {
      Result.setUndefined();
    } else {
      Result.setOverdefined();
    }

    return Result;
  }

  if (isa<BitCastInst>(I)) {
    LatticeValue OpVal = GetLV(I->getOperand(0));
    return OpVal;
  }

  // For all other instructions we mark overdefined
  Result.setOverdefined();
  return Result;
}


// Replace all uses of instructions with constants
void UnitSCCP::replaceConstants(Function &F, DenseMap<Value *, LatticeValue> &Lattice) {
  SmallVector<Instruction *, 16> ToRemove;
  for (auto &BB : F) {
    if (auto *BI = dyn_cast<BranchInst>(BB.getTerminator())) {
      if (BI->isConditional()) {
        LatticeValue CV = Lattice[BI->getCondition()];
        if (CV.isConstant()) {
          if (auto *CInt = dyn_cast<ConstantInt>(CV.ConstantVal)) {
            bool Taken = CInt->isOne();
            IRBuilder<> Builder(BI);
            // Builder.CreateBr(BI->getSuccessor(Taken ? 0 : 1)); // removing branches
            // BI->eraseFromParent();
            // NumInstRemoved++;

            BasicBlock *RemovedSucc = BI->getSuccessor(Taken ? 1 : 0);
            for (auto &I : *RemovedSucc) {
              if (auto *PHI = dyn_cast<PHINode>(&I)) {
                PHI->removeIncomingValue(BI->getParent(), true);
              }
            }
            Builder.CreateBr(BI->getSuccessor(Taken ? 0 : 1));
            BI->eraseFromParent();
            NumInstRemoved++;

          }
        }
      }
    }

    for (auto &I : BB) {
      if (I.getType()->isVoidTy()) {
        continue;
      }
      LatticeValue LV = Lattice[&I];
      if (LV.isConstant() && !I.use_empty()) {
        I.replaceAllUsesWith(LV.ConstantVal);
        ToRemove.push_back(&I);
        NumInstRemoved++;
        NumInstReplaced++;
      }
    }
  }
  // Remove all unused constant instructions that were replaced
  for (auto *Inst : ToRemove) {
    Inst->eraseFromParent();
  }
}

// Prune all unreachable blocks
void UnitSCCP::removeUnreachableBlocks(Function &F) {
  SmallVector<BasicBlock*,16> Unreachable;
  for (auto &BB : F) {
    if (&BB == &F.getEntryBlock()){ 
      continue;
    }
    if (pred_empty(&BB)) {
      Unreachable.push_back(&BB);
    }
  }

  for (auto *BB : Unreachable) {
    for (auto *Succ : successors(BB)) {
      for (auto &I : *Succ) {
        if(auto *PHI = dyn_cast<PHINode>(&I)) {
          PHI->removeIncomingValue(BB, true);
        }
      }
    }
    // BB->dropAllReferences(); // Seg faulted due to bad refs in PHI nodes from pruned blocks
  }
  
  for (auto *BB : Unreachable) {
    BB->dropAllReferences();
  }

  for (auto *BB : Unreachable) {
    BB->eraseFromParent();
    NumBlocksUnreachable++;
  }
}

Constant *UnitSCCP::evaluateBinaryOp(unsigned Op, Constant *C1, Constant *C2) {
  if (!C1 || !C2) { 
    return nullptr;
  }
  return ConstantExpr::get((Instruction::BinaryOps)Op, C1, C2);
}

Constant *UnitSCCP::evaluateCastOp(unsigned Op, Constant *C, const Type *Ty) {
  if (!C) {
    return nullptr;
  }
  return ConstantExpr::getCast((Instruction::CastOps)Op, C, const_cast<Type *>(Ty));
}

Constant *UnitSCCP::evaluateCmpOp(unsigned Op, Constant *C1, Constant *C2, bool IsFcmp) {
  if (!C1 || !C2) { 
    return nullptr;
  }
  return ConstantExpr::getCompare((CmpInst::Predicate)Op, C1, C2);
}
