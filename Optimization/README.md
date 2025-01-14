## Usage

### Compile the Optimization Passes


1. download `llvm-project-18.1.0.src.tar.xz` from github (search llvm-project release)

2. 
```bash
tar xvf llvm-project-18.1.0.src.tar.xz && mv llvm-project-18.1.0.src llvm18
cd llvm18/
cmake -B build/ -S llvm/ \
  -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" \
  -DLLVM_USE_LINKER=lld -DCMAKE_BUILD_TYPE="Debug" \
  -DLLVM_TARGETS_TO_BUILD="NVPTX;X86" \
  -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" \
  -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi"
cd llvm && make -j16
```

3. in Optimization directory do 

```
cmake -B build -DLLVM_DIR=/home/hao/COOL-compiler/llvm-project-15.0.0.src/lib/cmake/llvm
cd build && make -j8
```

### End 2 End

This will run batch testing on correctness and to run the benchmarking on the optimization passes.
```
make all
```

### Unit testing

To run unit test on individual test file / optmiization pass, do

this will compile the passes into `.so` file placed in `build/` directory.

Then, to run the optimization sequence, do

```
make optimize-<optimize-options> PROGRAM=<your_program_name>
```

where `<your_program_name>` is the name(withou suffix) of the program you want to optimize in `test/` directory in `.ll` format.

Also you can directly optimize from `C++` source code by doing

```
make optimize-real-<optimize-options> PROGRAM=<your_program_name>
```

where `<your_program_name>` is the name(withou suffix) of the program you want to optimize in `test/` directory in `.cpp` format.






## Description
Then you will see an analysis printed out, the `LA_test.ll` with the following CFG (For the LLVM IR)

```mermaid
graph TD;
    entry[entry]
    for_cond1[for.cond1]
    for_body1[for.body1]
    for_cond2[for.cond2]
    for_body2[for.body2]
    for_end2[for.end2]
    for_end1[for.end1]
    for_cond3[for.cond3]
    for_body3[for.body3]
    for_end3[for.end3]

    entry --> for_cond1
    for_cond1 -->|%cmp1 true| for_body1
    for_cond1 -->|%cmp1 false| for_end1
    for_body1 --> for_cond2
    for_cond2 -->|%cmp2 true| for_body2
    for_cond2 -->|%cmp2 false| for_end2
    for_body2 --> for_cond2
    for_end2 --> for_cond1
    for_end1 --> for_cond3
    for_cond3 -->|%cmp3 true| for_body3
    for_cond3 -->|%cmp3 false| for_end3
    for_body3 --> for_cond3
    for_end3 --> for_end1
```

However, we must know that when we run the Loop analysis, we're running on transformed LLVM IR, so the CFG will be different from the above one.

```mermaid
graph TD;
    entry[entry]
    for_cond1[for.cond1]
    for_cond2[for.cond2]
    for_body2[for.body2]
    for_end2[for.end2]
    for_cond3[for.cond3]
    for_body3[for.body3]
    for_end3[for.end3]

    entry --> for_cond1
    for_cond1 -->|%cmp1 true| for_cond2
    for_cond1 -->|%cmp1 false| for_cond3
    for_cond2 -->|%cmp2 true| for_body2
    for_cond2 -->|%cmp2 false| for_end2
    for_body2 --> for_cond2
    for_end2 --> for_cond1
    for_cond3 -->|%cmp3 true| for_body3
    for_cond3 -->|%cmp3 false| for_end3
    for_body3 --> for_cond3
    for_end3 --> for_end2

```



From the directory containing this file, execute the following commands
```
mkdir build; cd build; cmake ..; make -j
```
This should configure and then build the four passes into a single file ``
which you'll then need to run with LLVM `opt`.
Note that you should use the `opt` of LLVM installation that `cmake` found.
If you're not certain which LLVM that is, search for `LLVM_DIR` in `build/CMakeCache.txt`.
You can run _just_ your passes like this:
```
opt -load-pass-plugin=build/libUnitProject.so -passes="unit-licm,unit-sccp" <input> -o <output>
```
which will probably not do much on their own; or use the full optimization sequence given in the PDF.


