#ifndef INCLUDE_UNIT_LOOP_INFO_H
#define INCLUDE_UNIT_LOOP_INFO_H
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include <map>
#include <set>
#include <vector>
#include <iostream>

using namespace llvm;

namespace cs426 {
/// An object holding information about the (natural) loops in an LLVM
/// function. At minimum this will need to identify the loops, may hold
/// additional information you find useful for your LICM pass
class UnitLoopInfo {
public:
  struct Loop {
    BasicBlock *header;                 // The header of the loop
    BasicBlock *preheader;              // The preheader of the loop
    std::set<BasicBlock *> blocks;      // All blocks that belong to the loop
    std::set<BasicBlock *> exitBlocks;  // blocks that exit the loop
  };

private:
  // Map from header blocks to their corresponding Loop info
  std::map<BasicBlock *, Loop> Loops;

public:
  // Add a loop to the UnitLoopInfo
  void addLoop(BasicBlock *header, const std::set<BasicBlock *> &blocks,
               DominatorTree &DT);

  // Get all loops
  const std::map<BasicBlock *, Loop> &getLoops() const;

  // Get a specific loop given a header
  const Loop *getLoopForHeader(BasicBlock *header);

  void printLoops(std::ostream* ct);

};

/// Loop Identification Analysis Pass. Produces a UnitLoopInfo object which
/// should contain any information about the loops in the function which is
/// needed for your implementation of LICM
class UnitLoopAnalysis : public AnalysisInfoMixin<UnitLoopAnalysis> {
  friend AnalysisInfoMixin<UnitLoopAnalysis>;
  static AnalysisKey Key;

public:
  typedef UnitLoopInfo Result;

  UnitLoopInfo run(Function &F, FunctionAnalysisManager &AM);
private:
  void dfs(BasicBlock* current, std::set<BasicBlock *> & loopBlocks, BasicBlock* header);
  void collectLoopBlocks(BasicBlock *header, BasicBlock *tail,
                         std::set<BasicBlock *> &loopBlocks);
  
};
} // namespace
#endif // INCLUDE_UNIT_LOOP_INFO_H
