#!/bin/bash

# Build script for jemdoc website
# Processes all .jemdoc files in src/ and outputs to build/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JEMDOC="$SCRIPT_DIR/scripts/jemdoc"
SRC_DIR="$SCRIPT_DIR/src"
BUILD_DIR="$SCRIPT_DIR/build"

# Ensure build directory exists
mkdir -p "$BUILD_DIR"

# Process each .jemdoc file
for jemdoc_file in "$SRC_DIR"/*.jemdoc; do
    if [ -f "$jemdoc_file" ]; then
        base_name=$(basename "$jemdoc_file" .jemdoc)
        echo "Processing $base_name.jemdoc..."
        python "$JEMDOC" -c "$SRC_DIR/mysite.conf" -o "$BUILD_DIR/$base_name.html" "$jemdoc_file"
    fi
done

echo "Build complete. HTML files are in $BUILD_DIR/"