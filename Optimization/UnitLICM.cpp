// Usage: make optmize-licm
/**
 * Almost all comments are generated by GitHub Copilot
 */
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"

#include "UnitLICM.h"

#define DEBUG_TYPE "UnitLICM"
// Define any statistics here

using namespace llvm;
using namespace cs426;

#include <set>

// This statistic excludes the memory operations included in the above two categories and should also exclude casting instructions and getelementptr instructions (these are excluded since these instructions may not have any performance impact).

STATISTIC(NumCompHoisted,"Number of computational instructions hoisted out of loop"); 
STATISTIC(NumHoistedLoads, "Number of load insts hoisted or sunk");
STATISTIC(NumHoistedStore, "Number of store insts hoisted or sunk");


static void dbg_printBasicBlockInstructions(const BasicBlock *block, std::ostream *ct) {
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

/// @brief Main function for running the LICM optimization
/// @param F  The function to optimize
/// @param FAM  Function analysis manager
/// @return  Preserved analyses (if any)
PreservedAnalyses UnitLICM::run(Function &F, FunctionAnalysisManager &FAM) {
    // Get the necessary analyses
    UnitLoopInfo &ULI = FAM.getResult<UnitLoopAnalysis>(F);
    DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
    AliasAnalysis &AA = FAM.getResult<AAManager>(F);

    dbgs() << "UnitLICM running on " << F.getName() << "\n";

    bool Changed = false;

    // Iterate over all loops in the function
    for (const auto &LoopEntry : ULI.getLoops()) {
        const UnitLoopInfo::Loop &Loop = LoopEntry.second;
        Changed |= hoistLoopInvariantCode(Loop, DT, AA);
    }
    // for(auto &BB : F) dbg_printBasicBlockInstructions(&BB, &std::cerr);
    // ULI.printLoops(&std::cerr);

    // print statistics
    dbgs() << "Hoisted loads: " << NumHoistedLoads << "\n";
    dbgs() << "Hoisted stores: " << NumHoistedStore << "\n";
    dbgs() << "Hoisted computational instructions: " << NumCompHoisted << "\n";

    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}



/// @brief  Hoist loop-invariant code out of the loop
/// @param Loop  The loop to hoist code from
/// @param DT  Dominator tree of the function
/// @param AA  Alias analysis object
/// @return  True if any code was hoisted
bool UnitLICM::hoistLoopInvariantCode(const UnitLoopInfo::Loop &Loop, DominatorTree &DT, AliasAnalysis &AA) {
    bool Changed = false;

    // Get the preheader block
    BasicBlock *Preheader = Loop.preheader;

    if (!Preheader) {
        // Cannot perform LICM without a preheader
        return false;
    }

    // Set of instructions that we have already considered
    std::set<Instruction*> Processed;

    bool LocalChanged = false;

    do {
        
        // dbgs() << "-------------------!\n";
        LocalChanged = false;
        std::set <Instruction*> toMove;

        // For each block in the loop
        for (BasicBlock *BB : Loop.blocks) {
            // For each instruction in the block
            for (Instruction &I : *BB) {
                // Skip if already processed
                if (Processed.count(&I))
                    continue;
                // dbgs() << "Instruction st: " << I << "\n";
                // isLoopInvariantInst(&I, Loop, AA);
                // dbgs() << "Pass1\n";
                // If instruction is loop-invariant and safe to hoist
                if (isLoopInvariantInst(&I, Loop, AA) && canHoistInst(&I, Loop, DT)) {
                    // Move the instruction to the preheader, before the terminator
                    toMove.insert(&I);
                    Processed.insert(&I);
                    Changed = true;
                    LocalChanged = true;
                }
                // dbg_printBasicBlockInstructions(Preheader, &std::cerr);
                // if(isHoistableInstruction(&I))
                //     toMove.insert(&I);
                // Mark as processed
                // dbgs() << "Instruction ed: " << I << "\n";
                // dbgs() << isLoopInvariantInst(&I, Loop, AA) << "\n";
                // dbgs() << canHoistInst(&I, Loop, DT) << "\n";
                // dbgs() << "Next move" << *(Preheader->getTerminator()) << "\n";

                
            }
        }

        // dbgs() << "-------------------\n";

        for(auto I : toMove) {
            // dbgs() << "Moving: " << *I << "\n";
            I->moveBefore(Preheader->getTerminator());
            
            // Update statistics
            if (isa<LoadInst>(I)) {
                NumHoistedLoads++;
            } else if (isa<StoreInst>(I)) {
                NumHoistedStore++;
            } else if(!(isa<GetElementPtrInst>(I) || isa<CastInst>(I))) {
                NumCompHoisted++;
            }
        }
    } while (LocalChanged);

    // dbgs() << dbg_threshold << "\n";

    return Changed;
}


/// @brief  Check if the instruction is loop-invariant
/// @param I  The instruction to check
/// @param Loop  The loop to check
/// @param AA  Alias analysis object
/// @return  True if the instruction is loop-invariant
bool UnitLICM::isLoopInvariantInst(Instruction *I, const UnitLoopInfo::Loop &Loop, AliasAnalysis &AA) {
    // Only handle specific instruction types
    if (!isHoistableInstruction(I))
        return false;

    // Check if all operands are loop-invariant
    for (Value *Op : I->operands()) {
        if (Instruction *OpInst = dyn_cast<Instruction>(Op)) {
            if (OpInst && Loop.blocks.count(OpInst->getParent()))
                return false; // Operand computed inside the loop
        }
    }

    // Additional checks for memory operations
    if (LoadInst *LI = dyn_cast<LoadInst>(I)) {
        // Ensure the loaded address is loop-invariant
        if (!isLoopInvariant(LI->getPointerOperand(), Loop))
            return false;
        // dbgs() << "Pass1\n";
        // Check for conflicting stores in the loop
        if (hasAliasInLoop(LI, Loop, AA))
            return false;
        // dbgs() << "Pass2\n";

    } else if (StoreInst *SI = dyn_cast<StoreInst>(I)) {
        // Ensure the stored address and value are loop-invariant
        if (!isLoopInvariant(SI->getPointerOperand(), Loop) ||
            !isLoopInvariant(SI->getValueOperand(), Loop))
            return false;

        // Check for conflicting memory accesses in the loop
        if (hasAliasInLoop(SI, Loop, AA))
            return false;
    }

    return true;
}


/// @brief Check if the instruction is hoistable
/// @param I  The instruction to check
/// @return  True if the instruction is hoistable
bool UnitLICM::isHoistableInstruction(Instruction *I) {

    // Handle allowed instruction types
    if (isa<UnaryInstruction>(I) || isa<BinaryOperator>(I) ||
        isa<CmpInst>(I) || isa<SelectInst>(I) ||
        isa<GetElementPtrInst>(I) || isa<CastInst>(I) ||
        isa<LoadInst>(I) || isa<StoreInst>(I)) {
        return true;
    }

    return false;
}

/// @brief  Check if the value is loop-invariant
/// @param V  The value to check
/// @param Loop  The loop to check
/// @return  True if the value is loop-invariant
bool UnitLICM::isLoopInvariant(Value *V, const UnitLoopInfo::Loop &Loop) {

    // dbgs() << "Value: " << *V << "\n";
    if (Instruction *I = dyn_cast<Instruction>(V)) {
        return !Loop.blocks.count(I->getParent());
    }
    // Constants and function arguments are loop-invariant
    return true;
}

/// @brief Check if the memory operation has an alias in the loop
/// @param MemInst  The memory operation
/// @param Loop   The loop to check
/// @param AA   Alias analysis object
/// @return  True if the memory operation has an alias in the loop
bool UnitLICM::hasAliasInLoop(Instruction *MemInst, const UnitLoopInfo::Loop &Loop, AliasAnalysis &AA) {
    for (BasicBlock *BB : Loop.blocks) {
        for (Instruction &I : *BB) {
            if (&I == MemInst)
                continue;
            // dbgs() << "alias: " << I << "\n";
            if (I.mayReadOrWriteMemory()) {
                // Check aliasing
                // dbgs() << "against" << I << "\n";
                
                // Safely get memory location for the instruction
                auto MemLoc1 = MemoryLocation::getOrNone(MemInst);
                auto MemLoc2 = MemoryLocation::getOrNone(&I);

                // Ensure both memory locations are valid before checking alias
                if (MemLoc1 && MemLoc2) {
                    AliasResult AR = AA.alias(*MemLoc1, *MemLoc2);
                    // dbgs() << "alias->: " << I << "\n";

                    if (AR != AliasResult::NoAlias) {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

/// @brief Check if the instruction can be hoisted
/// @param I  The instruction to check
/// @param Loop  The loop to check
/// @param DT  Dominator tree of the function
/// @return  True if the instruction can be hoisted
bool UnitLICM::canHoistInst(Instruction *I, const UnitLoopInfo::Loop &Loop, DominatorTree &DT) {
    // For instructions with side effects, ensure they dominate all exits
    if (I->mayHaveSideEffects()) {
        if (!dominatesAllExits(I, Loop, DT))
            return false;
    }
    return true;
}

/// @brief  Check if the instruction dominates all loop exits
/// @param I  The instruction to check
/// @param Loop  The loop to check
/// @param DT  Dominator tree of the function
/// @return   True if the instruction dominates all loop exits
bool UnitLICM::dominatesAllExits(Instruction *I, const UnitLoopInfo::Loop &Loop, DominatorTree &DT) {
    if (!I->mayHaveSideEffects())
        return true; // No side effects, can hoist

    for (BasicBlock *ExitBB : Loop.exitBlocks) {
        if (!DT.dominates(I, ExitBB))
            return false;
    }
    return true;
}