# FrontEnd/bin/lexer test/assign1o.cl | FrontEnd/bin/parser | bin/semant | CodeGen/bin/cgen-2 > result.ll 2>/dev/null
FRONTEND = FrontEnd/src
CODEGEN = CodeGen/src
OPTIMIZATION = Optimization
BACKEND = llvm-project-15.0.0.src
REGALLOC = RegAlloc
all: $(FRONTEND) $(CODEGEN) $(OPTIMIZATION) $(BACKEND)
	$(MAKE) -C $(FRONTEND) && \
	$(MAKE) -C $(CODEGEN) && \
	cp $(REGALLOC)/*.cpp $(BACKEND)/llvm/lib/CodeGen/ && \
	$(MAKE) -C $(BACKEND)/build && \
	$(MAKE) -C $(OPTIMIZATION)
backend: $(BACKEND)/build
	cp $(REGALLOC)/*.cpp $(BACKEND)/llvm/lib/CodeGen/
	$(MAKE) -C $(BACKEND)/build
run: $(FRONTEND) $(CODEGEN) $(OPTIMIZATION) $(BACKEND)
	$(MAKE) -C $(FRONTEND) && \
	$(MAKE) -C $(CODEGEN) && \
	cp $(REGALLOC)/*.cpp $(BACKEND)/llvm/lib/CodeGen/ && \
	$(MAKE) -C $(BACKEND)/build && \
	$(MAKE) -C $(OPTIMIZATION) && \
	$(FRONTEND)/bin/lexer test/$(PROGRAM).cl | $(FRONTEND)/bin/parser | $(FRONTEND)/bin/semant | $(CODEGEN)/bin/cgen-2 > $(OPTIMIZATION)/tests/testing/$(PROGRAM).ll 2>/dev/null && \
	$(MAKE) -C $(OPTIMIZATION) optimize-real PROGRAM=$(PROGRAM) && \
	cp $(OPTIMIZATION)/result.ll ./$(PROGRAM).ll && \
	$(BACKEND)/build/bin/llc -verify-machineinstrs -O0 -regalloc=simple $(PROGRAM).ll -o $(PROGRAM).s && \
	$(BACKEND)/build/bin/clang -c -o $(PROGRAM).o $(PROGRAM).s && \
	$(BACKEND)/build/bin/clang -o $(PROGRAM) $(PROGRAM).o && \
	./$(PROGRAM)




