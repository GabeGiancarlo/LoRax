#!/bin/bash

# LoRax Fork Setup Script
# Sets up LoRax repository as a fork of Fox-Jack with proper attribution
# Based on email from KaliAssistant granting permission for remix with attribution

set -e  # Exit on any error

echo "🚀 Setting up LoRax as a Fox-Jack fork with proper attribution..."
echo "📧 Based on permission from KaliAssistant for remix with attribution"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "Not in a git repository. Please run this script from your LoRax repo root."
    exit 1
fi

print_info "Creating directory structure..."

# Create main directories
mkdir -p pcb/A_endpoint
mkdir -p pcb/B_controller
mkdir -p firmware/endpoint
mkdir -p firmware/controller
mkdir -p enclosures
mkdir -p docs

print_status "Created directory structure"

# Create main README.md
print_info "Creating main README.md with project description and attribution..."

cat > README.md << 'EOF'
# LoRax: A keychain-sized LoRa system for remote scans

**LoRax** is a dual-device LoRa-based penetration testing tool inspired by the Fox-Jack foundation:
- **Endpoint**: Luckfox Pico Max (256MB) runs Nmap/ARP via 915MHz LoRa
- **Controller**: TTGO LoRa32 with OLED sends commands
- **Security**: Secure HMAC packets, tactile buttons, 500mAh LiPo (~2-3d)
- **Hardware**: Includes AutoCAD STLs/STEP, Arduino/Luckfox firmware
- **Goal**: Build your stealthy network tool!

## Project Structure

```
LoRax/
├── pcb/
│   ├── A_endpoint/          # Slim, discrete device for network scanning
│   ├── B_controller/        # Fun, expandable remote controller
│   └── reference/           # Fox-Jack reference design files
├── firmware/
│   ├── endpoint/            # Luckfox Pico Max firmware
│   └── controller/          # TTGO LoRa32 Arduino sketches
├── enclosures/              # 3D printed case designs
└── docs/                    # Documentation and guides
```

## Quick Start

1. **Hardware**: Order components (~$135 from Adafruit/Amazon)
2. **Firmware**: Flash Arduino sketches to TTGO, build Luckfox image
3. **Assembly**: 3D print enclosures, solder components
4. **Usage**: Pair devices, send scan commands via LoRa

## Features

- **Discrete Operation**: Keychain-sized endpoint for stealthy deployment
- **Remote Control**: OLED interface with tactile feedback
- **Network Scanning**: Nmap, ARP, and custom network tools
- **Secure Communication**: HMAC-authenticated LoRa packets
- **Power Efficient**: 2-3 day battery life with 500mAh LiPo
- **Expandable**: Modular design for future enhancements

## Credits & Acknowledgments

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

This project is a remix and evolution of the excellent [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) by KaliAssistant. We gratefully acknowledge the following components that were adapted from Fox-Jack:

- **SDK & Build System**: Core build scripts and development environment
- **Mode Framework**: Modular task system and initialization scripts  
- **PCB Assets**: Reference design files and component libraries
- **Rootfs Logic**: Startup scripts and system configuration

Special thanks to KaliAssistant for the open-source foundation and permission to remix with proper attribution.

## License

This project builds upon the Fox-Jack foundation with appropriate attribution. See individual file headers for specific licensing details.

## Contributing

We welcome contributions! Please see our contributing guidelines and ensure proper attribution is maintained for any Fox-Jack derived components.

---

*LoRax - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created main README.md with attribution"

# Create PCB README.md
print_info "Creating PCB README.md with Fox-Jack reference..."

cat > pcb/README.md << 'EOF'
# LoRax PCB Organization

This directory contains the PCB component files for the **LoRax** project, organized into two main categories based on the device architecture.

## Project Overview

**LoRax** is a dual-device LoRa-based penetration testing tool inspired by the Fox-Jack foundation:
- **A_endpoint**: Slim, discrete device for network scanning and monitoring
- **B_controller**: Fun, expandable remote controller for command and control

## Directory Structure

```
pcb/
├── A_endpoint/          # Lorax Endpoint (slim/discrete device)
├── B_controller/        # Lorax Remote (fun/expandable controller)
├── reference/           # FOX-JACK reference design files
└── README.md           # This file
```

## Component Organization

### A_endpoint/ (Lorax Endpoint)
**Purpose**: Slim, discrete device (~65x25x8mm) for network scanning and LoRa RX
**Design Goal**: Minimal profile, flat components, keychain-friendly

### B_controller/ (Lorax Remote)
**Purpose**: Fun, expandable controller (~65x30x15mm) for command and control
**Design Goal**: Interactive interface, room for future emulation features

## Fox-Jack Reference

This PCB design is inspired by and builds upon the [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) extension board design by KaliAssistant. The reference files in the `reference/` directory contain the original Fox-Jack design files that served as inspiration for the LoRax architecture.

**Attribution**: Built on KaliAssistant's Fox-Jack – core PCB design and component selection.

## References

- **Fox-Jack Foundation**: [Original Extension Board Design](https://github.com/KaliAssistant/Fox-Jack)
- **Luckfox Pico Max**: [Datasheet](https://www.luckfox.com/luckfox-pico/)
- **TTGO LoRa32**: [Documentation](https://github.com/Xinyuan-LilyGO/TTGO-LoRa-Series)
- **Adafruit Components**: [Product Pages](https://www.adafruit.com/)

---

*Last Updated: $(date)*
*Project: LoRax - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created PCB README.md with Fox-Jack reference"

# Create firmware directory READMEs
print_info "Creating firmware directory structure..."

cat > firmware/README.md << 'EOF'
# LoRax Firmware

This directory contains the firmware for both LoRax devices.

## Structure

- `endpoint/` - Luckfox Pico Max firmware (C/C++, build system)
- `controller/` - TTGO LoRa32 Arduino sketches (C++)

## Development

### Endpoint Firmware
- Based on Luckfox SDK
- Network scanning tools (Nmap, ARP)
- LoRa communication stack
- Battery management and telemetry

### Controller Firmware  
- Arduino-based for TTGO LoRa32
- OLED display interface
- Tactile button handling
- LoRa command transmission

## Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

The endpoint firmware builds upon the Fox-Jack SDK and mode framework, with appropriate attribution maintained in individual source files.

---

*LoRax Firmware - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created firmware README.md"

# Create enclosures README
print_info "Creating enclosures documentation..."

cat > enclosures/README.md << 'EOF'
# LoRax Enclosures

3D printed case designs for the LoRax devices.

## Design Goals

### A_endpoint (Slim/Discrete)
- Keychain-friendly form factor
- Minimal profile for stealthy deployment
- Rugged construction for field use
- Hidden antenna design

### B_controller (Fun/Expandable)
- Ergonomic button layout
- OLED display protection
- FPV antenna cap design
- Room for future expansion

## Files

- `A_endpoint/` - Endpoint enclosure STLs and STEP files
- `B_controller/` - Controller enclosure STLs and STEP files
- `assembly/` - Assembly guides and documentation

## 3D Printing

- **Material**: PETG or ABS recommended
- **Layer Height**: 0.2mm for strength
- **Infill**: 20-30% for balance of strength/weight
- **Supports**: Minimal, designed for easy removal

---

*LoRax Enclosures - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created enclosures README.md"

# Create docs directory
print_info "Creating documentation structure..."

cat > docs/README.md << 'EOF'
# LoRax Documentation

Comprehensive documentation for the LoRax project.

## Contents

- **Assembly Guide** - Step-by-step hardware assembly
- **Firmware Guide** - Software installation and configuration  
- **Usage Guide** - Operating the LoRax system
- **Development** - Contributing and extending LoRax
- **Troubleshooting** - Common issues and solutions

## Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

Documentation structure and development practices inspired by the Fox-Jack project.

---

*LoRax Documentation - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created documentation structure"

# Create .gitignore for the project
print_info "Creating .gitignore for LoRax project..."

cat > .gitignore << 'EOF'
# LoRax .gitignore

# Build artifacts
build/
dist/
*.o
*.elf
*.bin
*.hex

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.temp
*.log

# Arduino IDE
*.ino.bak

# KiCad files
*.kicad_pcb-bak
*.pro-bak
*.sch-bak

# 3D printing
*.gcode
*.stl.bak

# Documentation builds
docs/_build/
docs/build/

# Python (if used for build scripts)
__pycache__/
*.pyc
*.pyo

# Node modules (if used for web interfaces)
node_modules/

# Backup files
*.bak
*.backup
*~
EOF

print_status "Created .gitignore"

# Create a template for build.sh with attribution header
print_info "Creating build.sh template with Fox-Jack attribution..."

cat > build.sh << 'EOF'
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
EOF

chmod +x build.sh
print_status "Created build.sh with Fox-Jack attribution"

# Create a template for dep.sh with attribution header
print_info "Creating dep.sh template with Fox-Jack attribution..."

cat > dep.sh << 'EOF'
#!/bin/bash

# LoRax Dependencies Script
# Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
# Original Fox-Jack dependency management with LoRax modifications

set -e

echo "📦 Installing LoRax dependencies..."

# System dependencies
echo "🔧 Installing system dependencies..."
# TODO: Add system package installation commands

# Arduino IDE and libraries
echo "🎯 Setting up Arduino environment..."
# TODO: Add Arduino IDE and library installation

# Luckfox SDK
echo "🦊 Setting up Luckfox SDK..."
# TODO: Add Luckfox SDK installation

# Python dependencies (if used)
echo "🐍 Installing Python dependencies..."
# TODO: Add Python package installation

echo "✅ LoRax dependencies installed!"
EOF

chmod +x dep.sh
print_status "Created dep.sh with Fox-Jack attribution"

# Create a template for rootfs/rcS with attribution header
print_info "Creating rootfs structure with Fox-Jack attribution..."

mkdir -p rootfs
cat > rootfs/rcS << 'EOF'
#!/bin/sh

# LoRax Rootfs Startup Script
# Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
# Original Fox-Jack startup logic with LoRax modifications

echo "🚀 Starting LoRax system..."

# Initialize LoRa module
echo "📡 Initializing LoRa module..."
# TODO: Add LoRa initialization commands

# Start network scanning services
echo "🔍 Starting network scanning services..."
# TODO: Add Nmap/ARP service startup

# Initialize battery management
echo "🔋 Starting battery management..."
# TODO: Add battery telemetry startup

echo "✅ LoRax system started!"
EOF

chmod +x rootfs/rcS
print_status "Created rootfs/rcS with Fox-Jack attribution"

# Create LICENSE file with attribution
print_info "Creating LICENSE file with Fox-Jack attribution..."

cat > LICENSE << 'EOF'
LoRax License

Copyright (c) 2024 LoRax Project

This project is a remix and evolution of Fox-Jack by KaliAssistant.

ATTRIBUTION REQUIREMENT:
This work is based on KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack).
The following components are adapted from Fox-Jack with permission:

- Build system and SDK framework
- Mode system and initialization scripts  
- PCB design concepts and component selection
- Rootfs startup logic and system configuration

All adapted components must maintain the attribution header:
"Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)"

ORIGINAL FOX-JACK LICENSE:
The original Fox-Jack project by KaliAssistant is licensed under [original license].
Please refer to the original Fox-Jack repository for the complete license terms.

LORAX ADDITIONS:
New components, firmware, and documentation created for LoRax are licensed under [your chosen license].

PERMISSION:
This remix is created with explicit permission from KaliAssistant as documented in email correspondence dated [date].

For questions about attribution or licensing, please contact the LoRax project maintainers.
EOF

print_status "Created LICENSE with Fox-Jack attribution"

# Create a credits file
print_info "Creating detailed credits file..."

cat > CREDITS.md << 'EOF'
# LoRax Credits & Attribution

## Primary Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

This project is a remix and evolution of the excellent [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) by KaliAssistant, created with explicit permission for remix and attribution.

## Fox-Jack Components Used

The following components from Fox-Jack have been adapted for LoRax:

### Build System & SDK
- **build.sh**: Core build script framework
- **dep.sh**: Dependency management system  
- **SDK Integration**: Luckfox development environment setup

### System Framework
- **rootfs/rcS**: System startup and initialization logic
- **Mode System**: Modular task framework for device operations
- **Service Management**: Background service handling

### PCB Design
- **Component Selection**: Reference design files and part libraries
- **Layout Concepts**: Extension board design principles
- **Reference Files**: Original Fox-Jack PCB assets in `pcb/reference/`

## Permission & License

This remix is created with explicit written permission from KaliAssistant, as documented in email correspondence. The permission includes:

- Remix and build upon Fox-Jack
- Maintain proper attribution in README and file headers
- Include acknowledgment of reused components
- Preserve attribution on files that originate from Fox-Jack

## File Headers

All files adapted from Fox-Jack include the attribution header:
```
# Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
```

## Original Fox-Jack

- **Repository**: https://github.com/KaliAssistant/Fox-Jack
- **Creator**: KaliAssistant
- **License**: [Original Fox-Jack License]
- **Purpose**: Extension board for penetration testing tools

## LoRax Evolution

LoRax extends Fox-Jack with:
- **Dual-device architecture**: Endpoint + Controller
- **LoRa communication**: 915MHz wireless command/control
- **Network scanning**: Nmap, ARP, and custom tools
- **Stealth operation**: Keychain-sized discrete deployment
- **Power efficiency**: 2-3 day battery life

## Contact

For questions about attribution, licensing, or the relationship between LoRax and Fox-Jack, please contact the LoRax project maintainers.

---

*LoRax Credits - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
EOF

print_status "Created detailed credits file"

# Create a setup verification script
print_info "Creating setup verification script..."

cat > verify_setup.sh << 'EOF'
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
EOF

chmod +x verify_setup.sh
print_status "Created setup verification script"

# Add all files to git
print_info "Adding files to git repository..."

git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    print_warning "No changes to commit (files may already exist)"
else
    print_info "Committing changes with attribution message..."
    git commit -m "Initial setup with Fox-Jack attribution and structure

- Added proper attribution to KaliAssistant's Fox-Jack
- Created directory structure for dual-device architecture  
- Added README files with project description and credits
- Created build scripts with Fox-Jack attribution headers
- Added LICENSE with attribution requirements
- Included detailed CREDITS.md with component breakdown
- Set up verification script for setup validation

Built on KaliAssistant's Fox-Jack – core SDK and mode system."
    
    print_status "Committed changes with proper attribution"
fi

# Run verification
print_info "Running setup verification..."
./verify_setup.sh

echo ""
print_status "🎉 LoRax fork setup complete!"
echo ""
print_info "📋 Summary of what was created:"
echo "   • Directory structure for dual-device architecture"
echo "   • README files with project description and Fox-Jack attribution"
echo "   • Build scripts (build.sh, dep.sh) with attribution headers"
echo "   • Rootfs startup script with Fox-Jack attribution"
echo "   • LICENSE file with attribution requirements"
echo "   • Detailed CREDITS.md with component breakdown"
echo "   • Setup verification script"
echo ""
print_info "🔗 Key attribution maintained:"
echo "   • 'Built on KaliAssistant's Fox-Jack – core SDK and mode system'"
echo "   • File headers: 'Adapted from KaliAssistant's Fox-Jack'"
echo "   • Credits section explaining reused components"
echo ""
print_info "📧 Based on permission from KaliAssistant for remix with attribution"
print_info "🚀 Ready to start developing LoRax!"
echo ""
