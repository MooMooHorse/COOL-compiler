CLANG = clang-15

SRC = foo.cc

LL = foo.ll

all: $(LL)


$(LL): $(SRC)
	$(CLANG) -S -emit-llvm $(SRC) -o $(LL)

clean:
	rm -f $(LL)