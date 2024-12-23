# Register Allocation Policy


## Virtual registers & Physical Registers

- Virtual registers represent the values of variables in IR that are not tied to any hardware registers.

- Physical registers are the actual hardware registers that are used to store values during execution.

## Caller Saved Register and Callee Saved Register

The critical part for register allocation in function calls are **how to handle caller-saved registers and callee-saved registers**.

The callee-saved registers are saved by load and store instruction inserted by `PrologEpilogInserter` in `PrologEpilogInserter.cpp`. Hence, only caller-saved registers have to be taken care of. This is done by the `funcCallSaveRef` in `RegAllocSimple.cpp`.

## Motivation

**Saving physical registers used across function calls to callee-saved registers can avoid them being saved each time a function is called.**

## Implementation

1. Get a set of callee-saved registers from the target machine in `runOnMachineFunction`.

```c
    // Identify callee-saved registers
    CalleeSavedSet.clear();
    const MCPhysReg *CSRegs = TRI->getCalleeSavedRegs(&MF);
    for (int i = 0; CSRegs[i] != 0; ++i) {
        CalleeSavedSet.insert(CSRegs[i]);
    }
```

2. For each basic block, compute a set of virtual registers that are live across function calls. This is done by tracking the first and last occurrence of each virtreg and call positions within the basic block.

```c
    void computeLiveAcrossCalls(MachineBasicBlock &MBB, std::map<Register,bool> &LiveAcrossCall) {
        LiveAcrossCall.clear();

        // Track first and last occurrence of each vreg and call positions
        std::map<Register, int> FirstDefOrUse, LastDeforUse;
        std::vector<int> CallInstrs;

        int idx = 0;
        for (MachineInstr &MI : MBB) {
            if (MI.isCall()) {
                CallInstrs.push_back(idx);
            }

            for (MachineOperand &MO : MI.operands()) {
                if (MO.isReg() && MO.getReg().isVirtual()) {
                    Register VReg = MO.getReg();
                    // mark first or last occurrence of vreg -> FirstDefOrUse, LastUse
                }
            }
            idx++;
        }

        // Determine which vregs live across calls:
        for (auto &Entry : FirstDefOrUse) {
            Register VReg = Entry.first;
            int start = Entry.second;
            int end = LastDeforUse[VReg];
            
            bool across = false;
            for (int cpos : CallInstrs) {
                if (cpos > start && cpos < end) {
                    across = true;
                    break;
                }
            }
            LiveAcrossCall[VReg] = across;
        }
    }
```


3. When allocating an operand, we check if the virtreg lives across function calls (`LiveAcrossCall[VReg] == true`) and then choose an order of allocation baesd on that.


```c
MCPhysReg findNextAvailablePhysReg(const TargetRegisterClass *RC, 
                                   ArrayRef<MCPhysReg> &AllocationOrder, 
                                   MachineOperand &MO) {

        // ..... get CalleeSavedOrder and CallerSavedOrder from AllocationOrder and target machine
        // ..... get acrossCall from LiveAcrossCall

        // Decide which list to try first
        ArrayRef<MCPhysReg> PrimaryOrder = acrossCall ? ArrayRef<MCPhysReg>(CalleeSavedOrder)
                                                        : ArrayRef<MCPhysReg>(CallerSavedOrder);
        ArrayRef<MCPhysReg> SecondaryOrder = acrossCall ? ArrayRef<MCPhysReg>(CallerSavedOrder)
                                                        : ArrayRef<MCPhysReg>(CalleeSavedOrder);
   
        auto TryAllocate = [&](ArrayRef<MCPhysReg> Order, bool if_spill) -> MCPhysReg {

            // Try to allocate a register from the list
            // if physreg is not allocated, spill and allocate
        };

        MCPhysReg AssignedPhysReg = TryAllocate(PrimaryOrder, false);
        if (AssignedPhysReg == 0) {
            AssignedPhysReg = TryAllocate(SecondaryOrder, true);
            if (AssignedPhysReg == 0) {
                AssignedPhysReg = TryAllocate(PrimaryOrder, true);
            }
        }

        return AssignedPhysReg;
    }
```


## Proof of Concept

By turning on / off the `EXTRA_OPTIMIZE` flag in `RegAllocSimple.cpp`, we can switch between baseline and optimized register allocation policy.

**Challenge**: The testing case for baseline hardly reveal the benefit of the optimization. 

**Designed Test**:

```assembly
; ModuleID = 'extra_optimize_test'
source_filename = "extra_optimize_test.c"

define i64 @main() {
entry:
    %a = alloca i64, align 8       
    %b = alloca i64, align 8       
    %c = alloca i64, align 8       
    %d = alloca i64, align 8       
    %e = alloca i64, align 8       

    ; Initialize values
    store i64 10, i64* %a, align 8
    store i64 20, i64* %b, align 8
    store i64 30, i64* %c, align 8
    store i64 40, i64* %d, align 8

    ; Load values into virtual registers (64-bit)
    %a_val = load i64, i64* %a, align 8
    %b_val = load i64, i64* %b, align 8
    %c_val = load i64, i64* %c, align 8

    ; Use callee-saved optimization opportunity
    %sum1 = call i64 @callee_func1(i64 %a_val, i64 %b_val)  
    %sum2 = call i64 @callee_func2(i64 %a_val, i64 %c_val)   

    ; Operate on the values returned
    %result1 = add i64 %sum1, %sum2   
    %result2 = add i64 %result1, %a_val   
    store i64 %result2, i64* %e, align 8  

    ; Return
    %final_result = load i64, i64* %e, align 8   
    ret i64 %final_result 
}

define i64 @callee_func1(i64 %x, i64 %y) {
entry:
    %sum = add i64 %x, %y   
    ret i64 %sum  
}

define i64 @callee_func2(i64 %x, i64 %y) {
entry:
    %sum = sub i64 %x, %y  
    ret i64 %sum  
}
```

## Result

- **Baseline**: 4 Store and 4 Load

- **Optimized**: 1 Store and 0 Load


