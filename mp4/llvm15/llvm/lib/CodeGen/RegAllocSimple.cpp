//===----------------------------------------------------------------------===//
//
/// A register allocator simplified from RegAllocFast.cpp
//
//===----------------------------------------------------------------------===//

/**
 * The code is helped generated by Github Copilot. 
 */

#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegAllocRegistry.h"
#include "llvm/CodeGen/RegisterClassInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"



#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/SlotIndexes.h"

#include <map>
#include <set>

using namespace llvm;

#define DEBUG_TYPE "regalloc"

STATISTIC(NumStores, "Number of stores added");
STATISTIC(NumLoads, "Number of loads added");

namespace {

     
    /// This is class where you will implement your register allocator in
    class RegAllocSimple : public MachineFunctionPass {
    public:
        static char ID;
        RegAllocSimple() : MachineFunctionPass(ID) {}

    private:
        /// Some information that might be useful for register allocation
        /// They are initialized in runOnMachineFunction
        MachineFrameInfo *MFI;
        MachineRegisterInfo *MRI;
        const TargetRegisterInfo *TRI;
        const TargetInstrInfo *TII;
        RegisterClassInfo RegClassInfo;

        // TODO: maintain information about live registers
        struct VirtRegInfo {
            MCPhysReg PhysReg; // Assigned physical register
            bool Dirty; // Indicates if the virtual register was defined (modified)
        };
        std::map<Register, VirtRegInfo> LiveVirtRegs;
        std::map<Register, int> SpillMap;
        std::set<Register> AssignedRegs;

    public:
        StringRef getPassName() const override { return "Simple Register Allocator"; }

        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.setPreservesCFG();
            // At -O1/-O2, llc fails to schedule some required passes if this pass
            // does not preserve these anlyses; these are preserved by recomputing
            // them at the end of runOnFunction(), you can safely ignore these
            AU.addRequired<LiveIntervals>();
            AU.addPreserved<LiveIntervals>();
            AU.addRequired<SlotIndexes>();
            AU.addPreserved<SlotIndexes>();
            MachineFunctionPass::getAnalysisUsage(AU);
        }

        /// Ask the Machine IR verifier to check some simple properties
        /// Enabled with the -verify-machineinstrs flag in llc
        MachineFunctionProperties getRequiredProperties() const override {
            return MachineFunctionProperties().set(
                MachineFunctionProperties::Property::NoPHIs);
        }

        MachineFunctionProperties getSetProperties() const override {
            return MachineFunctionProperties().set(
                MachineFunctionProperties::Property::NoVRegs);
        }

        MachineFunctionProperties getClearedProperties() const override {
            return MachineFunctionProperties().set(
                MachineFunctionProperties::Property::IsSSA);
        }

        private:
        void setMachineOperandToPhysReg(MachineOperand &MO, Register PhysReg) {
            unsigned SubRegIdx = MO.getSubReg();
            if (SubRegIdx != 0) {
                PhysReg = TRI->getSubReg(PhysReg, SubRegIdx);
                MO.setSubReg(0);
            }
            MO.setReg(PhysReg);
            if (MO.isKill()) {
                MO.setIsKill(false);
            } else if (MO.isDead()) {
                MO.setIsDead(false);
            }
            MO.setIsRenamable();
        }

        void spillReg(Register VirtReg, MachineBasicBlock &MBB, MachineBasicBlock::iterator InsertPos, bool kill) {
            // Get the virtual register information
            VirtRegInfo &VRI = LiveVirtRegs[VirtReg];


            // Only spill if the virtual register is dirty
            if (VRI.Dirty) {
                dbgs() << "Spilling virtual register " << VirtReg << " (physreg " << VRI.PhysReg << ")\n";
                // Get or create a stack slot for the virtual register
                int FrameIndex;
                const TargetRegisterClass *RC = MRI->getRegClass(VirtReg);
                FrameIndex = MFI->CreateSpillStackObject(TRI->getSpillSize(*RC), TRI->getSpillAlign(*RC));
                SpillMap[VirtReg] = FrameIndex;
                // dbgs() << "Spilling to stack slot " << FrameIndex << "\n";
                TII->storeRegToStackSlot(MBB, InsertPos, VRI.PhysReg, kill,
                                        FrameIndex, MRI->getRegClass(VirtReg), TRI);

                NumStores++;
            }
        }

           

        void reloadReg(MachineOperand &MO, Register VirtReg, bool is_use, MCPhysReg &AssignedPhysReg ) {
            if (is_use && SpillMap.count(VirtReg)) {
                // Insert load instruction to reload the virtual register
                int FrameIndex = SpillMap[VirtReg];
                MachineBasicBlock &MBB = *(MO.getParent()->getParent());
                MachineInstr &MI = *MO.getParent();
                MachineBasicBlock::iterator InsertPos = MI.getIterator();
                TII->loadRegFromStackSlot(MBB, InsertPos, AssignedPhysReg, FrameIndex, MRI->getRegClass(VirtReg), TRI);

                // Increment the number of loads
                NumLoads++;
            }
        }

        void funcCallSaveRef(MachineInstr &MI) {
            std::set<Register> RegsToSpill;
            bool is_parameter = false;
            if(!MI.isCall())
                return;

            for (MachineOperand &MO : MI.operands()) {
                if(MO.isReg() && MO.getReg().isPhysical()) {
                    is_parameter = true;
                }
            }

            for (MachineOperand &MO : MI.operands()) {
                // dbgs() << "Operand: " << MO << "\n";
                if (MO.isRegMask()) {
                    const uint32_t *RegMask = MO.getRegMask();

                    // Spill live virtual registers whose physical registers are clobbered
                    for (auto &Entry : LiveVirtRegs) {
                        Register VirtReg = Entry.first;
                        MCPhysReg PhysReg = Entry.second.PhysReg;

                        if (MachineOperand::clobbersPhysReg(RegMask, PhysReg)) {
                            // dbgs() << "Spilling live virtual register " << VirtReg << " due to clobber\n";
                            RegsToSpill.insert(VirtReg);
                        }
                    }
                }
            }
            for (Register VirtReg : RegsToSpill) {
                // dbgs() << "Spilling live virtual register " << VirtReg << "\n";
                spillReg(VirtReg, *MI.getParent(), MI.getIterator(), !is_parameter);
                // Remove the spilled virtual register from LiveVirtRegs
                LiveVirtRegs.erase(VirtReg);
            }
        }

        MCPhysReg findNextAvailablePhysReg(const TargetRegisterClass *RC, ArrayRef<MCPhysReg> &AllocationOrder, MachineOperand &MO) {

            std::set<MCPhysReg> UsedPhysRegs;
            MCPhysReg AssignedPhysReg = 0;

            // Set to keep track of used physical registers
            for (const auto &Entry : LiveVirtRegs) {
                UsedPhysRegs.insert(Entry.second.PhysReg);
            }

            UsedPhysRegs.insert(this->AssignedRegs.begin(), this->AssignedRegs.end());

            // Get the preferred allocation order for the register class
            for (MCPhysReg PhysReg : AllocationOrder) {
                if (MRI->isReserved(PhysReg))
                    continue;

                if (UsedPhysRegs.count(PhysReg))
                    continue;

                bool Overlaps = false;
                for (MCPhysReg UsedReg : UsedPhysRegs) {
                    if (TRI->regsOverlap(PhysReg, UsedReg)) {
                        Overlaps = true;
                        break;
                    }
                }
                if (Overlaps)
                    continue;

                // Found an available physical register
                AssignedPhysReg = PhysReg;
                break;
            }

            // If no physical register is available, spill a live virtual register
            if (AssignedPhysReg == 0) {
                // Spill a virtual register to free up a physical register
                bool Spilled = false;
                for (MCPhysReg PhysReg : AllocationOrder) {
                    if (MRI->isReserved(PhysReg))
                        continue;

                    // Check if the physical register is currently assigned
                    Register VRegToSpill = 0;
                    for (const auto &Entry : LiveVirtRegs) {
                        if (Entry.second.PhysReg == PhysReg) {
                            VRegToSpill = Entry.first;
                            break;
                        }
                    }

                    if (VRegToSpill != 0) {
                        spillReg(VRegToSpill, *MO.getParent()->getParent(), MO.getParent()->getIterator(), false);
                        LiveVirtRegs.erase(VRegToSpill);
                        AssignedPhysReg = PhysReg;
                        Spilled = true;
                        break;
                    }
                }

                if (!Spilled) {
                    // If no live virtual register can be spilled, report an error
                    errs() << "Ran out of registers during allocation!\n";
                    abort();
                }
            }

            return AssignedPhysReg;
        }

        /// Allocate physical register for virtual register operand
        void allocateOperand(MachineOperand &MO, Register VirtReg, bool is_use) {
            // Check if the virtual register is already allocated
            if (LiveVirtRegs.count(VirtReg)) {
                MCPhysReg PhysReg = LiveVirtRegs[VirtReg].PhysReg;
                setMachineOperandToPhysReg(MO, PhysReg);
                return;
            }
            const TargetRegisterClass *RC = MRI->getRegClass(VirtReg);
            ArrayRef<MCPhysReg> AllocationOrder = RegClassInfo.getOrder(RC);
            MCPhysReg AssignedPhysReg = findNextAvailablePhysReg(RC, AllocationOrder, MO);
            reloadReg(MO, VirtReg, is_use, AssignedPhysReg);
            setMachineOperandToPhysReg(MO, AssignedPhysReg);
            VirtRegInfo VRI;
            VRI.PhysReg = AssignedPhysReg;
            VRI.Dirty = !is_use; // Mark as dirty if this is a def
            LiveVirtRegs[VirtReg] = VRI;
        }


        void allocateInstruction(MachineInstr &MI) {

            // First, allocate use operands
            for (MachineOperand &MO : MI.operands()) {
                if (MO.isReg() && MO.isUse() && MO.getReg().isVirtual()) {
                    Register VirtReg = MO.getReg();
                    allocateOperand(MO, VirtReg, true);
                }
            }

            // Then, allocate def operands
            for (MachineOperand &MO : MI.operands()) {
                if (MO.isReg() && MO.isDef() && MO.getReg().isVirtual()) {
                    Register VirtReg = MO.getReg();
                    allocateOperand(MO, VirtReg, false);
                    LiveVirtRegs[VirtReg].Dirty = true;
                }
            }

            funcCallSaveRef(MI);
        }


        void allocateBasicBlock(MachineBasicBlock &MBB) {
            LiveVirtRegs.clear();


            // for (MachineInstr &MI : MBB) {
            //     for (MachineOperand &MO : MI.operands()) {
            //         if(MO.isReg() && !MO.getReg().isVirtual()) {
            //             this->AssignedRegs.insert(MO.getReg());
            //         }
            //     }
            // }

            for (MachineInstr &MI : MBB) {
                dbgs() << "Processing: " << MI;

                allocateInstruction(MI);

                dbgs() << "Processed: " << MI;

                // Remove killed virtual registers from LiveVirtRegs
                for (MachineOperand &MO : MI.operands()) {
                    if (MO.isReg() && (MO.isKill() || MO.isDead())) {
                        Register Reg = MO.getReg();
                        if (Reg.isVirtual() && LiveVirtRegs.count(Reg)) {
                            LiveVirtRegs.erase(Reg);
                        }
                    }
                }
            }

            dbgs() << "-------------------------\n";


            // Spill all live virtual registers at the end of the basic block (if needed)
            if (!MBB.isReturnBlock()) {
                for (auto &Pair : LiveVirtRegs) {
                    Register VirtReg = Pair.first;
                    // dbgs() << "Spilling live virtual register " << VirtReg << "\n";
                    spillReg(VirtReg, MBB, MBB.getFirstTerminator(), false);
                }
            }

            this->AssignedRegs.clear();
            LiveVirtRegs.clear();
        }

        bool runOnMachineFunction(MachineFunction &MF) override {
            dbgs() << "simple regalloc running on: " << MF.getName() << "\n";

            // Remove the abort() call and the "not implemented" message
            // outs() << "simple regalloc not implemented\n";
            // abort();

            // Get target-specific information
            MRI = &MF.getRegInfo();
            const TargetSubtargetInfo &STI = MF.getSubtarget();
            TRI = STI.getRegisterInfo();
            TII = STI.getInstrInfo();
            MFI = &MF.getFrameInfo();
            MRI->freezeReservedRegs(MF);
            RegClassInfo.runOnMachineFunction(MF);


            // Allocate each basic block
            for (MachineBasicBlock &MBB : MF) {
                allocateBasicBlock(MBB);
            }

            SpillMap.clear();

            // Clear virtual registers
            MRI->clearVirtRegs();

            // Recompute analyses (required by LLVM, can be ignored)
            SlotIndexes &SI = getAnalysis<SlotIndexes>();
            SI.releaseMemory();
            SI.runOnMachineFunction(MF);

            LiveIntervals &LI = getAnalysis<LiveIntervals>();
            LI.releaseMemory();
            LI.runOnMachineFunction(MF);

            return true;
        } 
    }; // class RegAllocSimple
} // namespace

/// Create the initializer and register the pass
char RegAllocSimple::ID = 0;
FunctionPass *llvm::createSimpleRegisterAllocator() {
  return new RegAllocSimple();
}
INITIALIZE_PASS(RegAllocSimple, "regallocsimple", "Simple Register Allocator",
                false, false)
static RegisterRegAlloc simpleRegAlloc("simple", "simple register allocator",
                                       createSimpleRegisterAllocator);
