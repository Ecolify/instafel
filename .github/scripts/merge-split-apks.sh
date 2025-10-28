#!/bin/bash
# Script to merge split APKs into a single installable APK
# Uses bundletool to merge the splits into a universal APK
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

# If there's only one APK (base only), just copy it
if [ "$APK_COUNT" -eq 1 ]; then
    echo "Only one APK found, copying directly without merge..."
    cp "$SPLITS_DIR"/*.apk "$OUTPUT_APK"
    echo "APK copied successfully: $OUTPUT_APK"
    exit 0
fi

# List all APK files
echo "APK files to merge:"
find "$SPLITS_DIR" -name "*.apk" -exec basename {} \;

# Download bundletool if not already present
BUNDLETOOL_JAR="bundletool.jar"
BUNDLETOOL_VERSION="1.17.2"
if [ ! -f "$BUNDLETOOL_JAR" ]; then
    echo "Downloading bundletool v${BUNDLETOOL_VERSION}..."
    BUNDLETOOL_URL="https://github.com/google/bundletool/releases/download/${BUNDLETOOL_VERSION}/bundletool-all-${BUNDLETOOL_VERSION}.jar"
    curl -L -o "$BUNDLETOOL_JAR" "$BUNDLETOOL_URL"
    echo "bundletool downloaded successfully"
fi

# Create an APKS file from the splits
APKS_FILE="instagram-alpha.apks"
echo "Creating APKS bundle from splits..."

# Create a ZIP file with all the APK splits (APKS format is just a ZIP)
cd "$SPLITS_DIR"
zip -r "../$APKS_FILE" *.apk
cd ..

echo "APKS bundle created: $APKS_FILE"

# Extract universal APK from the APKS bundle
echo "Extracting universal APK from bundle..."

# Use bundletool to build a universal APK
# First, we need to create a proper APKS structure
# bundletool expects the splits to be in APKS format
java -jar "$BUNDLETOOL_JAR" build-apks \
    --bundle="$APKS_FILE" \
    --output="temp-universal.apks" \
    --mode=universal \
    || {
        echo "Warning: bundletool build-apks failed, trying alternative method..."
        
        # Alternative: manually merge using zip
        echo "Using alternative merge method..."
        
        # Create a temporary directory
        MERGE_DIR=$(mktemp -d)
        trap "rm -rf $MERGE_DIR" EXIT
        
        # Find the base APK (usually the largest one)
        BASE_APK=$(find "$SPLITS_DIR" -name "base*.apk" -o -name "*base*.apk" | head -1)
        if [ -z "$BASE_APK" ]; then
            # If no base APK found by name, use the largest APK
            BASE_APK=$(find "$SPLITS_DIR" -name "*.apk" -exec ls -s {} \; | sort -rn | head -1 | awk '{print $2}')
        fi
        
        echo "Using base APK: $(basename $BASE_APK)"
        
        # Copy base APK as starting point
        cp "$BASE_APK" "$OUTPUT_APK"
        
        # For each split APK, extract and merge into base
        for split in "$SPLITS_DIR"/*.apk; do
            if [ "$split" != "$BASE_APK" ]; then
                echo "Merging split: $(basename $split)"
                # Extract the split to temp directory
                unzip -q -o "$split" -d "$MERGE_DIR/split_$(basename $split .apk)"
                
                # Add the contents to the output APK
                (cd "$MERGE_DIR/split_$(basename $split .apk)" && zip -r -u "../../../../$OUTPUT_APK" . -x "META-INF/*")
            fi
        done
        
        echo "Manual merge completed"
    }

# If bundletool succeeded, extract the universal APK
if [ -f "temp-universal.apks" ]; then
    echo "Extracting universal APK from temp-universal.apks..."
    unzip -p "temp-universal.apks" "universal.apk" > "$OUTPUT_APK" || {
        echo "Failed to extract universal APK, using alternative extraction..."
        unzip "temp-universal.apks" "*.apk" -d temp-extract
        mv temp-extract/*.apk "$OUTPUT_APK"
        rm -rf temp-extract
    }
    rm -f "temp-universal.apks"
fi

# Clean up APKS file
rm -f "$APKS_FILE"

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

