#!/bin/bash

# LoRax Setup Verification Script
# Verifies that the Fox-Jack fork setup was completed correctly

echo "🔍 Verifying LoRax setup..."

# Check directory structure
echo "📁 Checking directory structure..."
required_dirs=("pcb/A_endpoint" "pcb/B_controller" "firmware/endpoint" "firmware/controller" "enclosures" "docs" "rootfs")

for dir in "${required_dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ $dir exists"
    else
        echo "❌ $dir missing"
    fi
done

# Check key files
echo "📄 Checking key files..."
required_files=("README.md" "pcb/README.md" "firmware/README.md" "enclosures/README.md" "docs/README.md" "build.sh" "dep.sh" "rootfs/rcS" "LICENSE" "CREDITS.md")

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
    fi
done

# Check attribution in key files
echo "🏷️  Checking attribution..."
if grep -q "KaliAssistant's Fox-Jack" README.md; then
    echo "✅ Main README has Fox-Jack attribution"
else
    echo "❌ Main README missing Fox-Jack attribution"
fi

if grep -q "Adapted from KaliAssistant's Fox-Jack" build.sh; then
    echo "✅ build.sh has attribution header"
else
    echo "❌ build.sh missing attribution header"
fi

if grep -q "Adapted from KaliAssistant's Fox-Jack" dep.sh; then
    echo "✅ dep.sh has attribution header"
else
    echo "❌ dep.sh missing attribution header"
fi

if grep -q "Adapted from KaliAssistant's Fox-Jack" rootfs/rcS; then
    echo "✅ rootfs/rcS has attribution header"
else
    echo "❌ rootfs/rcS missing attribution header"
fi

echo "🎉 Setup verification complete!"
