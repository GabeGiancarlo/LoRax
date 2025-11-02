<div align="center">

# 🌳 LoRax — A LoRa-Powered Network Security Education Platform

> *"I am the Lorax. I speak for the trees."*  
> *"And the trees are learning about networks."*

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Built on Fox-Jack](https://img.shields.io/badge/Built%20on-Fox--Jack-orange)](https://github.com/KaliAssistant/Fox-Jack)

**A modular, expandable, keychain-sized LoRa mesh for network security education and authorized security assessments**

*Unless someone like you cares a whole awful lot, nothing is going to get better. It's not.*

</div>

---

## ⚠️ Educational Purpose Disclaimer

**LoRax is designed for educational purposes and authorized security assessments only.**

This project is intended to:
- **Learn** about network security, mesh networking, and LoRa communication
- **Understand** how network scanning and analysis tools work
- **Conduct** authorized security assessments on networks you own or have explicit permission to test
- **Study** cryptography, mesh protocols, and embedded systems development

**⚠️ WARNING**: Unauthorized access to computer networks is illegal in most jurisdictions. Only use LoRax on networks you own or have explicit written authorization to test. The developers assume no liability for misuse of this project.

---

## 🙏 Built on KaliAssistant's Fox-Jack

**LoRax is built on and extends the excellent [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) by KaliAssistant.**

This project would not exist without KaliAssistant's groundbreaking work on Fox-Jack. LoRax adapts and extends Fox-Jack's build system, SDK framework, and PCB design concepts with permission. We are deeply grateful to KaliAssistant for:

- **Open Source Leadership**: Creating and sharing the Fox-Jack foundation
- **Explicit Permission**: Granting permission for remix and attribution
- **Technical Excellence**: Building a robust, professional-grade hardware/software system

See [Attribution](#-attribution) and [`CREDITS.md`](CREDITS.md) for complete details on how LoRax builds upon Fox-Jack.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Devices](#devices)
  - [Lorax (Endpoint)](#lorax-endpoint)
  - [Bar-ba-loot (Controller)](#bar-ba-loot-controller)
  - [Tree Node (Relay)](#tree-node-relay)
- [Protocol & Security](#protocol--security)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Contributing](#contributing)
- [Security](#security)
- [Attribution](#-attribution)

---

## 🎯 Overview

LoRax is a **professional-grade, open-source LoRa mesh ecosystem** designed for network security education and authorized security assessments. The system consists of multiple interoperable devices that communicate over **915MHz LoRa** (868MHz for EU) using a **secure mesh protocol** with **HMAC-authenticated packets** and **AES-256-GCM encrypted payloads**.

Built on **KaliAssistant's Fox-Jack** foundation, LoRax extends the original concept with a modular device ecosystem, comprehensive documentation, and educational resources for learning about network security, mesh networking, and LoRa communication.

### Key Features

- 🔒 **Secure Communication**: HMAC-SHA256 authentication + AES-256-GCM end-to-end encryption
- 📡 **Extended Range**: 1.2km direct, 8km+ via multi-hop mesh relays
- 🎯 **Stealth Operation**: No WiFi/BT emissions, LoRa invisible to standard network scanners
- 🔋 **Power Efficient**: 2-3 day active runtime (endpoints/controller), 20+ days (relays)
- 🧩 **Modular Design**: Identical structure for all devices, easy to extend
- 📦 **Open Hardware**: Complete PCB designs, 3D models, firmware, and BOMs
- 🌳 **Mesh Networking**: Auto-discovery, hop-by-hop forwarding, topology management

### Design Philosophy

LoRax follows a **device-agnostic, modular architecture** where each device maintains an identical directory structure (`pcb/`, `firmware/`, `enclosures/`, `build-journey/`) while sharing common SDK libraries and documentation. This enables rapid development of new device types while maintaining consistency across the ecosystem.

> *"The Once-ler said, 'I'm sorry, but business is business! And business must grow regardless of crummies in tummies, you know.'"*  
> LoRax disagrees. Business should be open, transparent, and secure.

---

## 🏗️ Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         LoRax Ecosystem                         │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│  Bar-ba-loot │ ◄────► │  Tree Node   │ ◄────► │    Lorax     │
│ (Controller)  │  LoRa   │   (Relay)    │  LoRa   │  (Endpoint)  │
│  ESP32 + OLED │ 915MHz  │  ESP32-S3    │ 915MHz  │  Luckfox Pico│
│              │         │   + RFM95W   │         │   Max 256MB   │
└──────────────┘         └──────────────┘         └──────────────┘
     │                          │                          │
     │                          │                          │
     └──────────────────────────┴──────────────────────────┘
                        Multi-Hop Mesh
                     (Up to 8 hops max)
```

### Directory Structure

```
LoRax/
├── shared/                     # Shared across ALL devices
│   ├── sdk/                    # Common libraries
│   │   ├── lorax_crypto.h      # HMAC, AES-256-GCM primitives
│   │   ├── lorax_mesh.h        # Mesh protocol, routing
│   │   └── lorax_common.h      # Common types, utilities
│   ├── docs/                   # Ecosystem documentation
│   │   ├── ARCHITECTURE.md     # System architecture details
│   │   ├── SECURITY.md          # Security model, threat analysis
│   │   └── CONTRIBUTING.md      # Contribution guidelines
│   ├── reference/              # Fox-Jack reference (submodule)
│   │   └── fox-jack/           # Original Fox-Jack repository
│   └── build/                  # Master build scripts
│       ├── build.sh            # Multi-device build orchestrator
│       └── dep.sh              # Dependency installer
│
├── devices/                    # One folder per device
│   ├── lorax/                  # Ghost scanner endpoint
│   │   ├── README.md           # Device overview
│   │   ├── BOM.md              # Bill of materials
│   │   ├── pcb/                # KiCad PCB files
│   │   ├── firmware/           # Luckfox firmware
│   │   ├── enclosures/         # 3D models (STL/STEP)
│   │   └── build-journey/       # Step-by-step guides
│   │
│   ├── bar-ba-loot/            # Handheld C2 controller
│   │   └── [same structure]
│   │
│   └── tree-node/              # Mesh relay extender
│       └── [same structure]
│
├── CREDITS.md                  # Attribution and credits
├── LICENSE                     # GPL v3 license
└── README.md                   # This file
```

### Communication Protocol

#### Packet Structure

```
┌─────────────────────────────────────────────────────────────────┐
│                      LoRax Packet Format                         │
└─────────────────────────────────────────────────────────────────┘

 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                            HMAC (32B)                          |
|                         (HMAC-SHA256)                           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| CMD | SRC_ID| DST_ID| HOP |           SEQUENCE (32-bit)        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    ENCRYPTED PAYLOAD (AES-256-GCM)            |
|                         (up to 242 bytes)                      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

#### Message Types

| Command | Value | Description |
|--------|-------|-------------|
| `HELLO` | `0x01` | Mesh discovery broadcast (30s interval) |
| `SCAN` | `0x02` | Network analysis request (Nmap, ARP, custom) |
| `RESULT` | `0x03` | Analysis results response |
| `ROUTE` | `0x04` | Routing table update / topology info |
| `PING` | `0x05` | Connectivity test / latency measurement |

#### Mesh Routing

- **Auto-Discovery**: Tree Nodes broadcast HELLO packets every 30s with RSSI, battery, hop count
- **Routing Table**: Each node maintains a neighbor table with device IDs, RSSI, hop distance
- **Hop Limit**: Maximum 8 hops (prevents routing loops, reduces latency)
- **Best Path**: Nodes forward packets to neighbor closest to destination (by hop count + RSSI)

---

## 🎮 Devices

### Lorax (Endpoint)

> *"I am the Lorax. I speak for the trees."*

**The Lorax** is a **discrete, keychain-sized network scanner** that operates remotely via LoRa commands from up to **1.2km** away.

#### Specifications

| Spec | Value |
|------|-------|
| **MCU** | Luckfox Pico Max (256MB RAM) |
| **OS** | Custom Linux (Buildroot-based) |
| **Radio** | HopeRF RFM95W 915MHz LoRa |
| **Size** | 58×23×9mm |
| **Weight** | 14g |
| **Battery** | 500mAh LiPo (JST PH 2.00mm) |
| **Runtime** | 2-3 days active, 20+ days deep sleep |
| **Power Draw** | ~150mA scanning, ~50mA idle, ~5mA sleep |

#### Capabilities

- **Network Analysis**: Nmap integration for authorized network assessment (TCP SYN, UDP, ARP discovery)
- **Network Learning**: Execute custom network analysis scripts for educational purposes
- **Stealth Operation**: No WiFi/BT emissions, LoRa invisible to scanners
- **Remote Control**: Receive commands via LoRa mesh, execute scans autonomously

#### Firmware Stack

- **Base OS**: Buildroot Linux (custom configuration)
- **Network Tools**: Nmap, ARP-scan, custom network utilities
- **LoRa Stack**: Custom mesh protocol implementation
- **Battery Management**: MAX17048 fuel gauge integration
- **Power Management**: Linux suspend/resume for deep sleep

**📁 Device Directory**: [`devices/lorax/`](devices/lorax/)

---

### Bar-ba-loot (Controller)

> *"The Once-ler had a cart and the cart had a horn."*  
> Bar-ba-loot has buttons and an OLED. Much better.

**Bar-ba-loot** is a **handheld control device** with an OLED display and tactile buttons for sending commands to remote Lorax endpoints for authorized network analysis.

#### Specifications

| Spec | Value |
|------|-------|
| **MCU** | TTGO LoRa32 T3 (ESP32) |
| **Framework** | Arduino (ESP-IDF) |
| **Display** | 0.96" OLED 128×64 (SSD1306) |
| **Input** | 4× Kailh Choc Low Profile switches |
| **Radio** | Built-in RFM95W 915MHz LoRa |
| **Battery** | 500mAh LiPo |
| **Runtime** | 2-3 days active |
| **Power Draw** | ~80mA display on, ~30mA display off |

#### Features

- **OLED UI**: Menu system with device list, scan type selection, status display
- **Tactile Buttons**: Navigation, selection, command sending
- **Mesh Management**: View connected devices, hop count, RSSI, battery status
- **Command Interface**: Send authorized Nmap scans, ARP discovery, and custom network analysis commands
- **Result Display**: View scan results on OLED (truncated for large outputs)

#### Firmware Stack

- **UI Framework**: Adafruit GFX + SSD1306 for OLED
- **LoRa Library**: RadioLib for RFM95W communication
- **Button Handling**: Debounced input, menu navigation
- **Mesh Protocol**: Multi-hop routing support

**📁 Device Directory**: [`devices/bar-ba-loot/`](devices/bar-ba-loot/)

---

### Tree Node (Relay)

> *"Unless someone like you cares a whole awful lot, nothing is going to get better. It's not."*

**Tree Node** is a **drop-and-forget LoRa relay** that extends your LoRax mesh network by **3km per hop** with a **20+ day battery life** on a single 500mAh charge.

#### Specifications

| Spec | Value |
|------|-------|
| **MCU** | Adafruit Feather ESP32-S3 |
| **Framework** | Arduino (ESP-IDF) |
| **Radio** | HopeRF RFM95W 915MHz LoRa |
| **Antenna** | 19cm pop-out 10dBi (SMA) |
| **Battery** | 500mAh LiPo |
| **Runtime** | 20-25 days (deep sleep) |
| **Power Draw** | ~100mA RX, ~25µA sleep (ULP coprocessor) |
| **Size** | 58×23×9mm (antenna collapsed) |

#### Features

- **Mesh Relay**: Automatically forwards packets with hop count increment
- **Auto-Discovery**: Joins mesh network via HELLO broadcasts
- **Deep Sleep**: ULP coprocessor wakes every 10s, 100ms RX window
- **Battery Monitoring**: MAX17048 fuel gauge for accurate readings in sleep
- **Power Gating**: AP22802 load switch for RFM95W power management
- **Status LED**: WS2812B RGB LED for deployment feedback

#### Relay Algorithm

1. **Wake**: ULP coprocessor triggers wake every 10s
2. **RX Window**: Listen for LoRa packets (100ms window)
3. **HMAC Validation**: Verify packet authenticity, drop if invalid
4. **Hop Count**: Increment hop count (max 8 hops)
5. **Forward**: Transmit to next hop or destination
6. **Sleep**: Return to deep sleep (25µA average)

**📁 Device Directory**: [`devices/tree-node/`](devices/tree-node/)

---

## 🔐 Protocol & Security

### Security Model

LoRax implements **defense-in-depth security** across multiple layers:

#### 1. Physical Security
- **Keychain-sized devices**: Easy to deploy discretely (vents, under cars, foliage)
- **Magnetic mounting**: Tree Nodes attach to metal surfaces
- **Weather-resistant**: Optional waterproofing for outdoor deployment

#### 2. Network Security
- **LoRa protocol**: Invisible to standard network scanners (no WiFi/BT emissions)
- **Frequency selection**: 915MHz (North America) or 868MHz (Europe)
- **Low power**: No continuous emissions (deep sleep between operations)

#### 3. Cryptographic Security

##### HMAC-SHA256 Authentication
- **Purpose**: Packet integrity and authenticity
- **Key Size**: 32 bytes (256 bits)
- **Output**: 32-byte MAC tag per packet
- **Usage**: Every packet includes HMAC for hop-by-hop validation

##### AES-256-GCM Encryption
- **Purpose**: End-to-end payload encryption
- **Key Size**: 32 bytes (256 bits)
- **Mode**: GCM (authenticated encryption with AEAD)
- **Nonce**: 12 bytes (timestamp + random, never reused)
- **Usage**: Encrypts scan commands and results

##### Key Derivation
```
Master Key → PBKDF2 → Device Keys
HMAC Key: PBKDF2(master, "HMAC", salt, iterations=10000)
AES Key: PBKDF2(master, "AES", salt, iterations=10000)
```

#### 4. Protocol Security

- **Replay Protection**: Sequence numbers + timestamps prevent replay attacks
- **Hop-by-Hop Validation**: Every relay validates HMAC before forwarding
- **Hop Limit**: Maximum 8 hops prevents routing loops and reduces attack surface

### Threat Model

| Threat | Mitigation |
|--------|------------|
| **Packet Interception** | AES-256-GCM encryption (end-to-end) |
| **Packet Injection** | HMAC-SHA256 authentication (hop-by-hop) |
| **Replay Attacks** | Sequence numbers + timestamps |
| **DoS (Jamming)** | Frequency hopping (planned feature) |
| **Physical Compromise** | Secure boot, key storage in secure element (planned) |

> *"I am the Lorax. I speak for the trees."*  
> We also speak for your security.

---

## 🚀 Installation

### Prerequisites

- **Linux/macOS**: Windows via WSL2
- **Git**: For cloning repository and submodules
- **KiCad**: For PCB design (optional, for hardware modifications)
- **Arduino IDE** or **PlatformIO**: For ESP32 firmware development
- **Luckfox SDK**: For Luckfox Pico Max firmware (see [`devices/lorax/firmware/README.md`](devices/lorax/firmware/README.md))
- **3D Printer**: For enclosure fabrication (FDM or SLA)

### Clone Repository

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/GabeGiancarlo/LoRax.git
cd LoRax

# Or, if already cloned
git submodule update --init --recursive
```

### Build System

#### Master Build Script

```bash
# Build all devices
./shared/build/build.sh

# Build specific device
./shared/build/build.sh lorax
./shared/build/build.sh bar-ba-loot
./shared/build/build.sh tree-node
```

#### Dependency Installation

```bash
# Install dependencies for all devices
./shared/build/dep.sh

# This installs:
# - Arduino IDE + ESP32 board support
# - Luckfox SDK (for Lorax)
# - KiCad libraries (for PCB)
# - Python dependencies (for build scripts)
```

### Per-Device Build

Each device has its own build process:

#### Lorax (Luckfox)
```bash
cd devices/lorax/firmware
# Follow instructions in devices/lorax/firmware/README.md
# Requires: Luckfox SDK, Buildroot configuration
```

#### Bar-ba-loot / Tree Node (ESP32)
```bash
cd devices/bar-ba-loot/firmware
# Open in Arduino IDE
# Select: Tools → Board → ESP32 Arduino → TTGO T3
# Upload sketch
```

---

## 📖 Usage

### Usage Scenario

**Scenario**: Authorized network security assessment on your own network or a network with explicit written permission

1. **Deploy Tree Node** (1.5km from assessment area, elevated position)
   - Place Tree Node in elevated location (tree, building, antenna mast)
   - Extend 10dBi antenna for maximum range
   - Power on → Tree Node auto-joins mesh via HELLO broadcast

2. **Deploy Lorax Endpoint** (near authorized assessment network)
   - Place Lorax device near the authorized network (vent, secure location, foliage)
   - Device enters deep sleep, waits for commands

3. **Send Command from Bar-ba-loot**
   - Power on controller, OLED shows connected devices
   - Navigate menu → Select Lorax endpoint
   - Select analysis type → "Nmap TCP SYN Scan"
   - Send command → Packet routed via Tree Node to Lorax

4. **Receive Results**
   - Lorax executes authorized analysis, results encrypted with AES-256-GCM
   - Results forwarded back via Tree Node to Bar-ba-loot
   - Display on OLED → Review network topology for educational purposes

### Command Examples

#### Nmap TCP SYN Scan
```
Command: SCAN 0x02
Payload: {"type": "nmap", "args": "-sS -p 80,443,22,3389 target.example.com"}
```

#### ARP Discovery
```
Command: SCAN 0x02
Payload: {"type": "arp", "args": "-l"}
```

#### Custom Script
```
Command: SCAN 0x02
Payload: {"type": "custom", "script": "myscan.sh", "args": "..."}
```

---

## 🛠️ Development

### Architecture Overview

LoRax follows a **modular, device-agnostic architecture**:

- **Shared SDK**: Common cryptographic and mesh libraries in `shared/sdk/`
- **Device-Specific Firmware**: Each device implements mesh protocol independently
- **Consistent Structure**: All devices follow identical directory layout

### Adding a New Device

1. **Create device directory**:
   ```bash
   mkdir -p devices/my-device/{pcb,firmware,enclosures,build-journey}
   ```

2. **Create documentation**:
   - `README.md` - Device overview, specs, features
   - `BOM.md` - Bill of materials with purchase links
   - `build-journey/*.md` - Step-by-step build guides

3. **Implement firmware**:
   - Include `shared/sdk/` headers
   - Implement mesh protocol (HMAC validation, routing)
   - Test with existing devices

4. **Submit PR**: Follow [`shared/docs/CONTRIBUTING.md`](shared/docs/CONTRIBUTING.md)

### Code Style

- **C/C++**: Follow device-specific style (ESP-IDF for ESP32, Linux kernel for Luckfox)
- **Python**: PEP 8 (for build scripts)
- **Documentation**: Markdown format, clear and concise
- **Attribution**: Include Fox-Jack attribution header in adapted files

---

## 🤝 Contributing

We welcome contributions! Please see [`shared/docs/CONTRIBUTING.md`](shared/docs/CONTRIBUTING.md) for detailed guidelines.

### Quick Contribution Checklist

- [ ] Fork repository
- [ ] Create feature branch (`git checkout -b feature/amazing-device`)
- [ ] Follow code style and directory structure
- [ ] Add documentation (README, BOM, build guides)
- [ ] Test on physical hardware
- [ ] Commit changes (`git commit -m 'feat: add amazing device'`)
- [ ] Push to branch (`git push origin feature/amazing-device`)
- [ ] Open Pull Request

### Device Contribution Guidelines

When adding a new device:

1. **Follow Structure**: Use identical directory structure (`pcb/`, `firmware/`, `enclosures/`, `build-journey/`)
2. **Documentation**: Include README, BOM with direct links, build journey guides
3. **Hardware**: Provide KiCad PCB files, 3D models (STL/STEP), Gerber files
4. **Testing**: Test mesh connectivity with existing devices
5. **Attribution**: Maintain Fox-Jack attribution if code is adapted

---

## 🔒 Security

### Security Best Practices

1. **Key Management**
   - Generate strong keys using cryptographically secure RNG
   - Never commit keys to repository (use `.gitignore`)
   - Rotate keys periodically (monthly recommended)
   - Use different keys per deployment

2. **Deployment**
   - Change default keys immediately after deployment
   - Only deploy on networks you own or have explicit authorization to test
   - Monitor battery levels (low battery exposes devices during charging)
   - Update firmware regularly for security patches

3. **Operational Security**
   - Use encrypted commands for sensitive operations
   - Validate HMAC on all received packets
   - Limit hop count to prevent routing loops
   - Monitor mesh for unauthorized nodes

### Reporting Security Issues

**Do NOT create public issues for security vulnerabilities.**

- **Email**: Project maintainers privately
- **Include**: Description, impact, proof-of-concept (if safe)
- **Wait**: For patch before public disclosure

See [`shared/docs/SECURITY.md`](shared/docs/SECURITY.md) for detailed security documentation.

---

## 📚 Documentation

### Device Documentation

Each device has comprehensive documentation:

- **README.md**: Device overview, specifications, capabilities
- **BOM.md**: Bill of materials with direct purchase links (Amazon, Adafruit, DigiKey)
- **build-journey/**: Step-by-step build guides (solder, flash, assemble, test)

### Ecosystem Documentation

- **ARCHITECTURE.md**: System architecture, protocol details, routing algorithms
- **SECURITY.md**: Security model, threat analysis, cryptographic primitives
- **CONTRIBUTING.md**: Contribution guidelines, code style, device addition process

**📁 All Documentation**: [`shared/docs/`](shared/docs/)

---

## 🎓 Attribution

### Built on KaliAssistant's Fox-Jack

**LoRax is built on and extends [KaliAssistant's Fox-Jack](https://github.com/KaliAssistant/Fox-Jack).** We are deeply grateful to KaliAssistant for creating this excellent foundation and granting permission for remix and attribution.

#### Core Fox-Jack Components

LoRax adapts and extends several key components from Fox-Jack:

- **Build System**: LoRax build scripts (`shared/build/build.sh`, `shared/build/dep.sh`) adapt Fox-Jack's build framework
- **SDK Integration**: Luckfox development environment setup and SDK integration patterns
- **System Framework**: Mode system architecture, initialization scripts (`rootfs/rcS`), service management patterns
- **PCB Design**: Reference design files in `shared/reference/`, component selection guidelines, layout concepts

#### Fox-Jack Reference Files

The original Fox-Jack repository is included as a submodule at `shared/reference/fox-jack/` for reference and attribution. All original Fox-Jack files are preserved with their original licenses and attribution.

#### Attribution Requirements

All files adapted from Fox-Jack include the attribution header:
```c
// Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
```

This attribution appears in:
- Build scripts (`shared/build/build.sh`, `shared/build/dep.sh`)
- SDK headers (`shared/sdk/lorax_*.h`)
- System initialization scripts (`devices/lorax/rootfs/rcS`)
- PCB design documentation

#### Permission & License

This remix is created with explicit written permission from KaliAssistant, as documented in email correspondence. The permission includes:
- Remix and build upon Fox-Jack
- Maintain proper attribution in README and file headers
- Include acknowledgment of reused components
- Preserve attribution on files that originate from Fox-Jack

**Full Attribution**: See [`CREDITS.md`](CREDITS.md) for complete credits, attribution, and license details.

**Original Fox-Jack**: [https://github.com/KaliAssistant/Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) (GNU GPL v3)

---

## 📄 License

LoRax is licensed under **GNU GPL v3**.

- **Code**: GPL v3 (see [`LICENSE`](LICENSE))
- **Hardware**: CC-BY-SA 4.0 (schematics, PCB layouts)
- **Documentation**: CC-BY-SA 4.0 (build guides, READMEs)

By contributing, you agree to license your contributions under the same license as the project.

---

## 🌲 The Lorax

> *"I am the Lorax. I speak for the trees. And the trees are scanning your network."*

LoRax takes its name and playful spirit from Dr. Seuss's *The Lorax*, a story about environmental responsibility and the importance of caring for what matters. In our case, we care about:

- **Openness**: Open hardware and software, transparent security
- **Responsibility**: Ethical use of security tools for education and authorized assessments only
- **Education**: Learning about network security, mesh networking, and embedded systems
- **Community**: Collaborative development and knowledge sharing
- **Attribution**: Proper credit to KaliAssistant and the Fox-Jack foundation
- **Trees**: Actually, we do care about trees too. Print enclosures in recycled filament when possible.

---

## 📞 Contact & Support

- **Issues**: [GitHub Issues](https://github.com/GabeGiancarlo/LoRax/issues)
- **Discussions**: [GitHub Discussions](https://github.com/GabeGiancarlo/LoRax/discussions) (if enabled)
- **Security**: Email maintainers privately (do not create public issues)

---

## 🙏 Acknowledgments

- **KaliAssistant**: Original Fox-Jack foundation, open-source leadership, and explicit permission for remix. LoRax would not exist without KaliAssistant's excellent work.
- **Luckfox Technology**: Hardware platform and SDK support
- **LoRa Alliance**: LoRaWAN specification and reference designs
- **Dr. Seuss**: For the inspiration (*The Lorax*, 1971)

**Special Thanks**: We extend our deepest gratitude to KaliAssistant for creating Fox-Jack and making it available under GPL v3, enabling projects like LoRax to build upon this foundation.

---

<div align="center">

**Built with 🌳 by the LoRax community**

*Unless someone like you cares a whole awful lot, nothing is going to get better. It's not.*

[⭐ Star us on GitHub](https://github.com/GabeGiancarlo/LoRax) | [📖 Documentation](shared/docs/) | [🤝 Contribute](shared/docs/CONTRIBUTING.md)

</div>
