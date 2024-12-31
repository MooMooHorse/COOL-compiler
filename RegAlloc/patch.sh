#!/bin/bash

FILE_TO_ADD="$1"
LLVM_DIR="$2"
TARGET_CMAKE="${LLVM_DIR}/llvm/lib/CodeGen/CMakeLists.txt"

if [[ -z "$FILE_TO_ADD" || -z "$LLVM_DIR" ]]; then
    echo "Usage: $0 <file_to_add.cpp> <llvm_dir>"
    exit 1
fi

# Step 1: Copy the file to the directory
cp "$FILE_TO_ADD" "${LLVM_DIR}/llvm/lib/CodeGen/"
if [[ $? -ne 0 ]]; then
    echo "Failed to copy file to ${LLVM_DIR}/llvm/lib/CodeGen/"
    exit 1
fi

# Step 2: Add to CMakeLists.txt in the correct section
BASENAME=$(basename "$FILE_TO_ADD")

# Check if the file is already in the CMakeLists.txt
if grep -q "$BASENAME" "$TARGET_CMAKE"; then
    echo "$BASENAME is already in $TARGET_CMAKE"
else
    echo "Adding $BASENAME to $TARGET_CMAKE"

    # Append the new file at the end of the list before ADDITIONAL_HEADER_DIRS
    sed -i "/ADDITIONAL_HEADER_DIRS/i \ \ $BASENAME" "$TARGET_CMAKE"
fi

echo "Done. Remember to reconfigure and build LLVM."
