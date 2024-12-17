/**
 * @file UnitCSE.cpp
 * Comments are powered by doxygen & Github Copilot
 */
#include "llvm/Support/raw_ostream.h"
#include <map>

#include "UnitCSE.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"

using namespace llvm;
using namespace cs426;

#define DEBUG_TYPE "UnitCSE"


STATISTIC(NumRemoved, "Number of instructions removed");

/// @brief Print the instructions in a basic block to a raw_ostream.
/// @param block  The basic block to print.
/// @param ct  The raw_ostream to print to.
static void dbg_printBasicBlockInstructions(const BasicBlock *block, raw_ostream &ct) {
    if (!block) return; // Check for null pointers

    ct << "    Block: ";
    if (block->getName().empty()) {
        ct << "(unnamed block)";
    } else {
        ct << block->getName().str();
    }
    ct << "\n";

    // Print instructions in the block
    ct << "      Instructions:\n";
    for (const auto &inst : *block) {
        std::string instStr;
        llvm::raw_string_ostream rso(instStr);
        inst.print(rso); // Print the instruction to the string
        ct << "        " << rso.str() << "\n";
    }
}

// Example: y = x + a; Here x + a is an expression.
typedef struct Expression {
    unsigned Opcode;
    Type *Ty;
    SmallVector<Value*, 4> Operands;

    // For commutative ops, order operands to achieve canonical form.
    // For other ops, keep order as-is.
    bool isCommutative(unsigned opcode) const {
        switch (opcode) {
        case Instruction::Add:
        case Instruction::Mul:
        case Instruction::And:
        case Instruction::Or:
        case Instruction::Xor:
        case Instruction::FAdd:
        case Instruction::FMul:
            return true;
        default:
            return false;
        }
    }
    /// @brief Create an Expression from an instruction.
    /// @param I The instruction to create the expression from.
    /// @return  The created expression.
    static Expression fromInstruction(Instruction *I) {
        Expression E;
        E.Opcode = I->getOpcode();
        E.Ty = I->getType();
        dbgs() << *I << "\n";
        for (Use &U : I->operands()) { // problematic casting Use (bool) to static unsigned
            dbgs() << "Operand: " << *U << "\n";
            E.Operands.push_back(U.get());
        }
        return E;
    }

    void canonicalize() { // x = y + z; a = z + y;
        if (isCommutative(Opcode) && Operands.size() == 2) {
            if (Operands[1] < Operands[0])
                std::swap(Operands[0], Operands[1]);
        }
    }

    bool operator==(const Expression &Other) const {
        if (Opcode != Other.Opcode || Ty != Other.Ty)
            return false;
        if (Operands.size() != Other.Operands.size())
            return false;
        for (unsigned i = 0; i < Operands.size(); i++) {
            if (Operands[i] != Other.Operands[i])
                return false;
        }
        return true;
    }

    bool operator<(const Expression &Other) const {
        if (Opcode != Other.Opcode)
            return Opcode < Other.Opcode;
        if (Ty != Other.Ty)
            return Ty < Other.Ty;
        if (Operands.size() != Other.Operands.size())
            return Operands.size() < Other.Operands.size();
        for (unsigned i = 0; i < Operands.size(); i++) {
            if (Operands[i] != Other.Operands[i])
                return Operands[i] < Other.Operands[i];
        }
        return false;
    }

} Expression;


/// @brief Check if an instruction has an alias in the loop.
/// @param MemInst  The memory instruction to check.
/// @param F  The function containing the instruction.
/// @param AA  The alias analysis to use.
/// @return  True if the instruction has an alias in the loop, false otherwise.
bool UnitCSE::hasAliasInLoop(Instruction *MemInst, Function &F, AliasAnalysis &AA) {
    auto MemLoc1 = MemoryLocation::getOrNone(MemInst);
    
    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            if (&I == MemInst)
                continue;
            // dbgs() << "alias: " << I << "\n";
            if (I.mayReadOrWriteMemory()) {
                // Check aliasing
                // dbgs() << "against" << I << "\n";
                // If this is a call or invoke instruction, handle via ModRef analysis
                if (auto *CB = dyn_cast<CallBase>(&I)) {
                    // If we don't know MemInst's memory location, be conservative and query the call
                    if (!MemLoc1.hasValue()) {
                        return true;
                    } else {
                        ModRefInfo MRI = AA.getModRefInfo(CB, *MemLoc1);
                        // If the call modifies or even reads this particular memory, consider it aliasing
                        if (MRI != ModRefInfo::NoModRef)
                            return true;
                    }

                }

                // Safely get memory location for the instruction
                
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

// We don't want to CSE instructions with side effects like volatile loads, stores or calls.
bool UnitCSE::isSafeToCSE(Instruction *I, Function &F, AliasAnalysis &AA) {

    if (I->mayHaveSideEffects()) 
        return false;

    // We generally skip PHI nodes, terminators, volatile loads/stores, and
    // certain other instructions that doesn't have 2 operands.
    if (I->isTerminator() || isa<PHINode>(I) || isa<UnaryInstruction>(I))
        return false;


    // Check volatile memory operations
    if (auto *Ld = dyn_cast<LoadInst>(I))
        if (Ld->isVolatile() || hasAliasInLoop(I, F, AA))
            return false;
    if (auto *St = dyn_cast<StoreInst>(I))
        if (St->isVolatile() || hasAliasInLoop(I, F, AA))
            return false;

    // Check calls with side effects
    if (auto *CI = dyn_cast<CallBase>(I)) {
        if (!CI->onlyReadsMemory())
            return false;
    }

    return true;
}


/// @brief Perform a depth-first traversal of the dominator tree.
/// @param Node  The current node in the traversal.
/// @param Order  The vector to store the traversal order.
void UnitCSE::dfs(DomTreeNode *Node, std::vector<BasicBlock *> &Order) {
    if (!Node)
      return;
    
    BasicBlock *BB = Node->getBlock();
    Order.push_back(BB);

    for (auto *ChildNode : Node->children()) {
      dfs(ChildNode, Order);
    }
}

/// @brief Run the CSE optimization pass on the given function.
/// @param F  The function to optimize.
/// @param FAM  The function analysis manager to use.
/// @return  A PreservedAnalyses object that specifies which analyses are preserved.
PreservedAnalyses UnitCSE::run(Function &F, FunctionAnalysisManager &FAM) {
    dbgs() << "UnitCSE running on " << F.getName() << "\n";

    DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
    // AA might be useful if we do more complicated memory-based CSE.
    // But simple CSE might not need it.
    AliasAnalysis &AA = FAM.getResult<AAManager>(F);

    bool Changed = false;

    DT.recalculate(F);
    DomTreeNode *Root = DT.getRootNode();
    std::vector<BasicBlock *> traversalOrder;
    // Perform DFS traversal
    dfs(Root, traversalOrder);


    for(auto &BB : F) dbg_printBasicBlockInstructions(&BB, dbgs());

    std::map<Expression, Instruction*> CSEMap;

    SimplifyQuery SQ = SimplifyQuery(F.getParent()->getDataLayout());

    dbgs() << "Starting CSE\n";

    std::set<Instruction*> ToRemove;

    // Walk instructions in a forward order
    for(auto* BB : traversalOrder) {
        dbg_printBasicBlockInstructions(BB, dbgs());
        for (Instruction &I : *BB) {
            
            // dbgs() << "Checking if safe to CSE: " << &I << "\n";
            // Skip instructions that we can’t CSE
            if (!isSafeToCSE(&I, F, AA))
                continue;

            dbgs() << "Processing: " << I << "\n";

            // Build an expression from I
            Expression E = Expression::fromInstruction(&I);
            E.canonicalize();

            auto Found = CSEMap.find(E); // 
            if (Found != CSEMap.end()) {
                Instruction *Existing = Found->second;
                if (DT.dominates(Existing, &I)) { // x = a + b; z = x;
                    // We can replace I with Existing
                    // dbgs() << "Replacing: " << I << " with " << *Existing << "\n";
                    I.replaceAllUsesWith(Existing);
                    Changed = true;
                    ToRemove.insert(&I);
                    continue;
                }
            }

            CSEMap[E] = &I;
        }
    }
    for (auto *Inst : ToRemove) {
        dbgs() << "Removing: " << *Inst << "\n";
            NumRemoved++;
        Inst->eraseFromParent();
    }

    dbgs() << "Instructions Removed:" << NumRemoved << "\n";

    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}
