#!/bin/bash

# Publish script: copy built HTML files to root for GitHub Pages

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"

# Copy HTML files to root
cp "$BUILD_DIR"/*.html .

echo "Published HTML files to root."