cmake_minimum_required(VERSION 3.13.4)
project(unit-mp5)
set(CMAKE_CXX_STANDARD 20 CACHE STRING "")
set(LLVM_DIR "../llvm-project-15.0.0.src/build/lib/cmake/llvm" CACHE STRING "")

# Add an option for LLVM path or use an environment variable
if(NOT LLVM_DIR)
    if(DEFINED ENV{LLVM_DIR})
        list(APPEND CMAKE_PREFIX_PATH $ENV{LLVM_DIR})
    else()
        list(APPEND CMAKE_PREFIX_PATH ${LLVM_DIR})
    endif()
endif()

# Find LLVM
find_package(LLVM 15 REQUIRED CONFIG)

# Add library
add_library(UnitProject SHARED UnitLICM.cpp UnitLoopInfo.cpp UnitSCCP.cpp UnitCSE.cpp RegisterPasses.cpp)
target_include_directories(UnitProject PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${LLVM_INCLUDE_DIRS})
if(NOT LLVM_ENABLE_RTTI)
  target_compile_options(UnitProject PUBLIC "-fno-rtti")
endif()

# Inform users where LLVM is being used
message(STATUS "Using LLVM from: ${LLVM_DIR}")