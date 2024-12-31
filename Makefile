# FrontEnd/bin/lexer test/assign1o.cl | FrontEnd/bin/parser | bin/semant | CodeGen/bin/cgen-2 > result.ll 2>/dev/null
FRONTEND = FrontEnd/src
FRONTEND_BIN = FrontEnd/bin
CODEGEN = CodeGen/src
CODEGEN_BIN = CodeGen/bin
OPTIMIZATION = Optimization
BACKEND = llvm-project-15.0.0.src
REGALLOC = RegAlloc
TESTING = test
CLANG = $(BACKEND)/build/bin/clang
COOLRT = $(CODEGEN)/coolrt.cc
all: $(FRONTEND) $(CODEGEN) $(OPTIMIZATION) $(BACKEND)
	bash ./$(REGALLOC)/patch.sh  ./$(REGALLOC)/*.h llvm-project-15.0.0.src
	bash ./$(REGALLOC)/patch.sh  ./$(REGALLOC)/*.cpp llvm-project-15.0.0.src
	$(MAKE) -C $(FRONTEND) && \
	$(MAKE) -C $(CODEGEN) && \
	$(MAKE) -C $(BACKEND)/build -j4 && \
	$(MAKE) -C $(OPTIMIZATION)
backend: $(BACKEND)/build
	cp $(REGALLOC)/*.cpp $(BACKEND)/llvm/lib/CodeGen/
	$(MAKE) -C $(BACKEND)/build
run: coolrt.o
	$(FRONTEND_BIN)/lexer $(TESTING)/$(PROGRAM).cl | $(FRONTEND_BIN)/parser | ./bin/semant | $(CODEGEN_BIN)/cgen-2 > $(OPTIMIZATION)/tests/testing/$(PROGRAM).ll 2>/dev/null && \
	$(MAKE) -C $(OPTIMIZATION) optimize PROGRAM=$(PROGRAM) && \
	cp $(OPTIMIZATION)/result.ll ./$(PROGRAM).ll && \
	$(BACKEND)/build/bin/llc -verify-machineinstrs -O0 $(PROGRAM).ll -o $(PROGRAM).s && \
	$(CLANG) -c -o $(PROGRAM).o $(PROGRAM).s && \
	$(CLANG) -o $(PROGRAM) $(PROGRAM).o coolrt.o && \
	./$(PROGRAM)
coolrt.o:
	$(CLANG) -c -o coolrt.o $(COOLRT)

