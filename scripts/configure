#!/bin/bash

cmake_preset="$1"

if [ -z "$cmake_preset" ]; then
    echo "Error: No CMake preset provided."
    echo "Usage: $(basename "$0") <cmake_preset>"
    exit 1
fi

cd "$(dirname "$0")/.."
cmake --preset "$cmake_preset"

echo ""
read -p "Press Enter to continue..."
