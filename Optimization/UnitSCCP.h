#pragma once

#include "llvm/IR/PassManager.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/Constant.h"
#include <set>

namespace llvm {
class Function;
class Value;
class Instruction;
class BasicBlock;
class BranchInst;
class Constant;
class Type;
} // namespace llvm

namespace cs426 {

class LatticeValue {
public:
  enum StateType { Undefined, Constant, Overdefined };
  StateType State;
  llvm::Constant *ConstantVal;

  LatticeValue() : State(Undefined), ConstantVal(nullptr) {}
  bool isUndefined() const { return State == Undefined; }
  bool isConstant() const { return State == Constant; }
  bool isOverdefined() const { return State == Overdefined; }

  void setUndefined() { State = Undefined; ConstantVal = nullptr; }
  void setConstant(llvm::Constant *C) { State = Constant; ConstantVal = C; }
  void setOverdefined() { State = Overdefined; ConstantVal = nullptr; }
};

class UnitSCCP : public llvm::PassInfoMixin<UnitSCCP> {
  using EdgePair = std::pair<llvm::BasicBlock *, llvm::BasicBlock *>;
  using ValInstPair = std::pair<llvm::Value *, llvm::Instruction *>;

  unsigned NumInstRemoved = 0;
  unsigned NumBlocksUnreachable = 0;
  unsigned NumInstReplaced = 0;

public:
  llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM);

private:
  void initializeLattice(llvm::DenseMap<llvm::Value *, LatticeValue> &Lattice,
                         llvm::SmallVectorImpl<EdgePair> &CFGWorkList,
                         llvm::Function &F);

  void evaluateAllPhisInBlock(llvm::BasicBlock *Src, llvm::BasicBlock *Dst,
                              llvm::SmallVectorImpl<ValInstPair> &SSAWorkList);

  void evaluateConditional(llvm::BranchInst *BI, 
                           llvm::DenseMap<llvm::Value *, LatticeValue> &Lattice,
                           llvm::SmallVectorImpl<EdgePair> &CFGWorkList,
                           llvm::DenseMap<llvm::BasicBlock*, bool> &BlockExecutable);

  void evaluateAssign(llvm::Instruction *I,
                      llvm::DenseMap<llvm::Value *, LatticeValue> &Lattice,
                      llvm::SmallVectorImpl<ValInstPair> &SSAWorkList);

  LatticeValue computeInstructionValue(llvm::Instruction *I,
                                       llvm::DenseMap<llvm::Value *, LatticeValue> &Lattice);

  void replaceConstants(llvm::Function &F, llvm::DenseMap<llvm::Value *, LatticeValue> &Lattice);
  void removeUnreachableBlocks(llvm::Function &F);

  static llvm::Constant *evaluateBinaryOp(unsigned Op, llvm::Constant *C1, llvm::Constant *C2);
  static llvm::Constant *evaluateCastOp(unsigned Op, llvm::Constant *C, const llvm::Type *Ty);
  static llvm::Constant *evaluateCmpOp(unsigned Op, llvm::Constant *C1, llvm::Constant *C2, bool IsFcmp);
};

} // namespace cs426
