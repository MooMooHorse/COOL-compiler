#ifndef INCLUDE_UNIT_CSE_H
#define INCLUDE_UNIT_CSE_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/AliasAnalysis.h"

using namespace llvm;

namespace cs426 {

/// Common Subexpression Elimination Optimization Pass
struct UnitCSE : PassInfoMixin<UnitCSE> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);

};

} // namespace cs426

#endif // INCLUDE_UNIT_CSE_H
