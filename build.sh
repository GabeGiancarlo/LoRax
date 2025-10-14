#!/bin/bash

# LoRax Build Script
# Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
# Original Fox-Jack build system with LoRax modifications

set -e

echo "🔨 Building LoRax firmware..."

# Build endpoint firmware (Luckfox Pico Max)
echo "📱 Building endpoint firmware..."
cd firmware/endpoint
# TODO: Add Luckfox SDK build commands
echo "✅ Endpoint firmware built"

# Build controller firmware (TTGO LoRa32)
echo "🎮 Building controller firmware..."
cd ../controller
# TODO: Add Arduino build commands
echo "✅ Controller firmware built"

echo "🎉 LoRax build complete!"
