FRONTEND_BIN_DIR = ../FrontEnd/bin
REF_BIN_DIR = ../bin
LEXER = $(FRONTEND_BIN_DIR)/lexer
PARSER = $(FRONTEND_BIN_DIR)/parser
SEMANT = $(REF_BIN_DIR)/semant
BACKEND = ../llvm-project-15.0.0.src
CLANG = $(BACKEND)/build/bin/clang
OPT = $(BACKEND)/build/bin/opt

debug = true
proj_dir = CodeGen/src

ifeq ($(debug),true)
  CGENOPTS = -d
else
  CGENOPTS =
endif

CGEN = ../CodeGen/bin/cgen-2
CGENREF = ../CodeGen/reference-binaries/cgen-2
COOLRT = ../CodeGen/reference-binaries/coolrt.o

SRCS := $(wildcard *.cl)

# Disable built-in rules and variables
.SUFFIXES:

.PRECIOUS: %.ast %.ll %-o3.ll %.bin

default: all
all: $(SRCS:%.cl=%.out)
verify: $(SRCS:%.cl=%.verify)
check: $(SRCS:%.cl=%.check)

cgen-1:
	make -j -C $(proj_dir) cgen-1

cgen-2:
	make -j -C $(proj_dir) cgen-2

%.ast: %.cl
	$(LEXER) $< | $(PARSER) | $(SEMANT) > $@

%.ll: %.ast $(CGEN)
	$(CGEN) $(CGENOPTS) < $< > $@

# %.ll : %.ast $(CGENREF)
# 	$(CGENREF) $(CGENOPTS) < $< > $@

%-o3.ll: %.ll
	$(OPT) -O3 -S $< -f -o $*-o3.ll


%.bin: $(COOLRT) %-o3.ll 
	$(CLANG) -g $+ -o $@


%.verify: %.ll
	$(OPT) -S -verify $<


%.out: %.bin
	./$< > $@ || true


%.check: %.out
	diff -u $< $(<:%.out=%.refout)

clean:
	-rm -f *.bin *.ll *.out *.ast *.verify ../src/*.o
