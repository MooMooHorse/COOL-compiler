#ifndef INCLUDE_UNIT_CSE_H
#define INCLUDE_UNIT_CSE_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/InstructionSimplify.h"
#include "llvm/IR/PatternMatch.h"
#include "llvm/IR/ValueHandle.h"


#include <tuple>
#include <vector>
#include <algorithm>

using namespace llvm;

namespace cs426 {

/// Common Subexpression Elimination Optimization Pass
struct UnitCSE : PassInfoMixin<UnitCSE> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
  bool isSafeToCSE(Instruction *I, Function &F, AliasAnalysis &AA);
  void dfs(DomTreeNode *Node, std::vector<BasicBlock *> &Order);
  bool hasAliasInLoop(Instruction *MemInst, Function &F, AliasAnalysis &AA);
};

} // namespace cs426

#endif // INCLUDE_UNIT_CSE_H
