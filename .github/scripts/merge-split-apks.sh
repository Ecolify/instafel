#!/bin/bash
# Script to merge split APKs into a single installable APK
# Uses AntiSplit-M to merge the splits
# 
# Usage: ./merge-split-apks.sh <splits-directory> <output-apk>
#
# Example: ./merge-split-apks.sh instagram-splits instagram-alpha.apk

set -e

SPLITS_DIR="${1:-instagram-splits}"
OUTPUT_APK="${2:-instagram-alpha.apk}"

echo "=== Merging Split APKs ==="
echo "Splits directory: $SPLITS_DIR"
echo "Output APK: $OUTPUT_APK"

# Check if splits directory exists
if [ ! -d "$SPLITS_DIR" ]; then
    echo "Error: Splits directory '$SPLITS_DIR' does not exist"
    exit 1
fi

# Count APK files
APK_COUNT=$(find "$SPLITS_DIR" -name "*.apk" | wc -l)
echo "Found $APK_COUNT APK files to merge"

if [ "$APK_COUNT" -eq 0 ]; then
    echo "Error: No APK files found in $SPLITS_DIR"
    exit 1
fi

# List all APK files
echo "APK files to merge:"
find "$SPLITS_DIR" -name "*.apk" -exec basename {} \;

# Download AntiSplit-M if not already present
ANTISPLIT_JAR="AntiSplit-M.jar"
if [ ! -f "$ANTISPLIT_JAR" ]; then
    echo "Downloading AntiSplit-M..."
    # Download the latest release from GitHub
    ANTISPLIT_URL="https://github.com/AbdurazaaqMohammed/AntiSplit-M/releases/latest/download/AntiSplit-M.jar"
    curl -L -o "$ANTISPLIT_JAR" "$ANTISPLIT_URL"
    echo "AntiSplit-M downloaded successfully"
fi

# Create a temporary directory for the merged APK
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Copy all splits to temp directory
echo "Copying splits to temporary directory..."
cp "$SPLITS_DIR"/*.apk "$TEMP_DIR/"

# Use AntiSplit-M to merge the APKs
echo "Merging APKs using AntiSplit-M..."

# AntiSplit-M expects a directory with split APKs
# It will merge them into a single APK
java -jar "$ANTISPLIT_JAR" "$TEMP_DIR" "$OUTPUT_APK"

if [ ! -f "$OUTPUT_APK" ]; then
    echo "Error: Failed to create merged APK"
    exit 1
fi

# Verify the output file
OUTPUT_SIZE=$(stat -c%s "$OUTPUT_APK" 2>/dev/null || stat -f%z "$OUTPUT_APK" 2>/dev/null || echo "0")
OUTPUT_SIZE_MB=$((OUTPUT_SIZE / 1024 / 1024))

echo "=== Merge Complete ==="
echo "Merged APK: $OUTPUT_APK"
echo "File size: ${OUTPUT_SIZE_MB} MB"
echo "Original splits cleaned up from: $SPLITS_DIR"
