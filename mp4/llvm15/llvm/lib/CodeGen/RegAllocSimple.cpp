//===----------------------------------------------------------------------===//
//
/// A register allocator simplified from RegAllocFast.cpp
//
//===----------------------------------------------------------------------===//

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

        void spillReg(Register VirtReg, MachineBasicBlock &MBB, MachineBasicBlock::iterator InsertPos) {
            // Get the virtual register information
            VirtRegInfo &VRI = LiveVirtRegs[VirtReg];

            // Only spill if the virtual register is dirty
            if (VRI.Dirty) {
                // Get or create a stack slot for the virtual register
                int FrameIndex;
                if (SpillMap.count(VirtReg)) {
                    FrameIndex = SpillMap[VirtReg];
                } else {
                    const TargetRegisterClass *RC = MRI->getRegClass(VirtReg);
                    FrameIndex = MFI->CreateSpillStackObject(TRI->getSpillSize(*RC), TRI->getSpillAlign(*RC));
                    // dbgs() << "Spilling virtual register " << VirtReg << " to stack slot " << FrameIndex << "\n";
                    // MachineRegisterInfo::def_instr_iterator I = MRI->def_instr_begin(VirtReg);
                    // MachineRegisterInfo::def_instr_iterator E = MRI->def_instr_end();

                    // dbgs() << "Virtual register " << VirtReg << " definitions:\n";

                    // // Print the first definition
                    // if (I != E) {
                    //     dbgs() << "  First definition: " << *I << "\n";
                    //     ++I; // Move to the next definition
                    // }

                    // // Print the second definition (if it exists)
                    // if (I != E) {
                    //     dbgs() << "  Second definition: " << *I << "\n";
                    // }

                    SpillMap[VirtReg] = FrameIndex;
                }

                // Insert store instruction
                TII->storeRegToStackSlot(MBB, InsertPos, VRI.PhysReg, true,
                                        FrameIndex, MRI->getRegClass(VirtReg), TRI);

                // Increment the number of stores
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
            for (MachineOperand &MO : MI.operands()) {
                if (MO.isRegMask()) {
                    const uint32_t *RegMask = MO.getRegMask();

                    // Spill live virtual registers whose physical registers are clobbered
                    std::vector<Register> RegsToSpill;
                    for (auto &Entry : LiveVirtRegs) {
                        Register VirtReg = Entry.first;
                        MCPhysReg PhysReg = Entry.second.PhysReg;

                        if (MachineOperand::clobbersPhysReg(RegMask, PhysReg)) {
                            RegsToSpill.push_back(VirtReg);
                        }
                    }

                    for (Register VirtReg : RegsToSpill) {
                        spillReg(VirtReg, *MI.getParent(), MI.getIterator());

                        // Remove the spilled virtual register from LiveVirtRegs
                        LiveVirtRegs.erase(VirtReg);
                    }
                }
            }
        }

        MCPhysReg findNextAvailablePhysReg(const TargetRegisterClass *RC, ArrayRef<MCPhysReg> &AllocationOrder) {

            std::set<MCPhysReg> UsedPhysRegs;
            MCPhysReg AssignedPhysReg = 0;

            // Set to keep track of used physical registers
            for (const auto &Entry : LiveVirtRegs) {
                UsedPhysRegs.insert(Entry.second.PhysReg);
            }

            // Get the preferred allocation order for the register class
            for (MCPhysReg PhysReg : AllocationOrder) {
                // Skip reserved registers
                if (MRI->isReserved(PhysReg))
                    continue;

                // Check if the physical register is already used
                if (UsedPhysRegs.count(PhysReg))
                    continue;

                // Check for overlapping registers (using register units)
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
                        // Spill the virtual register
                        spillReg(VRegToSpill, *MI.getParent(), MI.getIterator());

                        // Remove the spilled virtual register from LiveVirtRegs
                        LiveVirtRegs.erase(VRegToSpill);

                        // Assign the freed physical register
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
                // Virtual register is already allocated to a physical register
                MCPhysReg PhysReg = LiveVirtRegs[VirtReg].PhysReg;
                // Update the operand to use the physical register
                setMachineOperandToPhysReg(MO, PhysReg);
                return;
            }

            // Get the register class of the virtual register
            const TargetRegisterClass *RC = MRI->getRegClass(VirtReg);

            // Get the preferred allocation order for the register class
            ArrayRef<MCPhysReg> AllocationOrder = RegClassInfo.getOrder(RC);

            MCPhysReg AssignedPhysReg = findNextAvailablePhysReg(RC, AllocationOrder);

            // If this is a use and the virtual register was previously spilled, reload it
            reloadReg(MO, VirtReg, is_use, AssignedPhysReg);

            // Update the operand to use the assigned physical register
            setMachineOperandToPhysReg(MO, AssignedPhysReg);

            // Mark the virtual register as live
            VirtRegInfo VRI;
            VRI.PhysReg = AssignedPhysReg;
            VRI.Dirty = !is_use; // Mark as dirty if this is a def
            LiveVirtRegs[VirtReg] = VRI;
        }


        void allocateInstruction(MachineInstr &MI) {
            // Spill clobbered virtual registers to stack 
        
            funcCallSaveRef(MI);

            // Set to keep track of physical registers used in this instruction
            std::set<MCPhysReg> UsedInInstr;

            // First, allocate use operands
            for (MachineOperand &MO : MI.operands()) {
                if (MO.isReg() && MO.isUse() && MO.getReg().isVirtual()) {
                    Register VirtReg = MO.getReg();
                    allocateOperand(MO, VirtReg, true);
                    UsedInInstr.insert(LiveVirtRegs[VirtReg].PhysReg);
                }
            }

            // Then, allocate def operands
            for (MachineOperand &MO : MI.operands()) {
                if (MO.isReg() && MO.isDef() && MO.getReg().isVirtual()) {
                    Register VirtReg = MO.getReg();
                    dbgs() << "Defining for virt reg " << VirtReg << "\n";
                    allocateOperand(MO, VirtReg, false);
                    UsedInInstr.insert(LiveVirtRegs[VirtReg].PhysReg);

                    // Mark the virtual register as dirty
                    LiveVirtRegs[VirtReg].Dirty = true;
                }
            }
        }


        void allocateBasicBlock(MachineBasicBlock &MBB) {
            // Clear live virtual registers at the start of the basic block
            LiveVirtRegs.clear();

            // Process each instruction in the basic block
            for (MachineInstr &MI : MBB) {
                dbgs() << "Processing: " << MI;

                allocateInstruction(MI);

                // Remove killed virtual registers from LiveVirtRegs
                for (MachineOperand &MO : MI.operands()) {
                    if (MO.isReg() && MO.isKill()) {
                        Register Reg = MO.getReg();
                        if (Reg.isVirtual() && LiveVirtRegs.count(Reg)) {
                            LiveVirtRegs.erase(Reg);
                        }
                    }
                }
            }

            dbgs() << "-------------------------\n";

            // Check if the last instruction is a return instruction
            bool IsReturnBlock = false;
            if (!MBB.empty()) {
                MachineInstr &LastMI = MBB.instr_back();
                if (LastMI.isReturn()) {
                    IsReturnBlock = true;
                }
            }

            // Spill all live virtual registers at the end of the basic block (if needed)
            if (!IsReturnBlock) {
                for (auto &Pair : LiveVirtRegs) {
                    Register VirtReg = Pair.first;
                    dbgs() << "Spilling live virtual register " << VirtReg << "\n";
                    spillReg(VirtReg, MBB, MBB.getFirstTerminator());
                }
            }

            // Clear live virtual registers at the end of the basic block
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
