#!/bin/bash

# Combined build and publish script for jemdoc website
# Builds all .jemdoc files in src/ to build/, then publishes to root

SCRIPT_DIR="$(pwd)"
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

echo "Build complete. Publishing to root..."

# Publish: move HTML files to root
mv "$BUILD_DIR"/*.html .

echo "Publish complete. Site is ready in root."

# Push to GitHub
echo "Pushing to GitHub..."
git add .
git commit -m "Update site $(date)"
git push

echo "Push complete. Site updated and published!"