#!/bin/bash

cd "$(dirname "$0")/.."
cmake --build --preset linux-x64-Debug --target code_format

echo "Done."
echo ""
read -p "Press Enter to continue..."
