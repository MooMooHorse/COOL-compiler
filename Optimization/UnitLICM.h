#ifndef INCLUDE_UNIT_LICM_H
#define INCLUDE_UNIT_LICM_H
#include "UnitLoopInfo.h"

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/AliasAnalysis.h"


using namespace llvm;

namespace cs426 {
/// Loop Invariant Code Motion Optimization Pass
struct UnitLICM : PassInfoMixin<UnitLICM> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
  bool hoistLoopInvariantCode(const UnitLoopInfo::Loop &Loop, DominatorTree &DT, AliasAnalysis &AA);
  bool isLoopInvariantInst(Instruction *I, const UnitLoopInfo::Loop &Loop, AliasAnalysis &AA);
  bool isHoistableInstruction(Instruction *I);
  bool isLoopInvariant(Value *V, const UnitLoopInfo::Loop &Loop);
  bool hasAliasInLoop(Instruction *MemInst, const UnitLoopInfo::Loop &Loop, AliasAnalysis &AA);
  bool canHoistInst(Instruction *I, const UnitLoopInfo::Loop &Loop, DominatorTree &DT);
  bool dominatesAllExits(Instruction *I, const UnitLoopInfo::Loop &Loop, DominatorTree &DT);
};
} // namespace

#endif // INCLUDE_UNIT_LICM_H
