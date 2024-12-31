#ifndef LLVM_LIB_CODEGEN_REGALLOCSIMPLE_H
#define LLVM_LIB_CODEGEN_REGALLOCSIMPLE_H

#include "llvm/Pass.h"

namespace llvm {
class PassRegistry;
class FunctionPass;

void initializeRegAllocSimplePass(PassRegistry &);
FunctionPass *createSimpleRegisterAllocator();
}

#endif