#!/bin/bash

# Script to download Instagram Alpha APK using the gplayapi JAR
# This script uses the gplayapi to get APK URLs and then downloads them

set -e

echo "Instagram Alpha APK Downloader"
echo "==============================="

# Check if config.properties exists
if [ ! -f "config.properties" ]; then
    echo "Error: config.properties not found"
    echo "Please create config.properties with email and aas_token"
    exit 1
fi

# Create a simple Kotlin script to get APK URLs
cat > /tmp/get-apk-urls.kt << 'EOF'
import java.io.File

// Simple script to extract APK URLs
// This will be executed by the gplayapi
fun main() {
    println("Getting Instagram Alpha APK URLs...")
}
EOF

# For now, we'll use a workaround: modify the gplayapi Main.kt temporarily
# to output download URLs instead of triggering workflows

echo "Note: This script requires the gplayapi to be modified to download APKs"
echo "Currently, the gplayapi only triggers GitHub workflows"
echo ""
echo "Alternative: Manually provide Instagram Alpha APK URL or file"
echo ""

# If APK URL is provided as argument, download it
if [ $# -eq 1 ]; then
    APK_URL=$1
    echo "Downloading APK from: $APK_URL"
    curl -L -o instagram-base.apk "$APK_URL"
    echo "✓ Downloaded to instagram-base.apk"
else
    echo "Usage: $0 <apk-url>"
    echo "Or: Place Instagram Alpha APK as instagram-base.apk in the current directory"
fi
