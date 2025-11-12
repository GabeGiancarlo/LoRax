# Oncler — LoRa Ghost Scanner

> *"I am the Lorax. I speak for the trees."*  
> — The Lorax

<div align="center">

![The Oncler](../../shared/media/images/reference/lorax-movie.avif)
*The Oncler — speaking for network security*

</div>

The **Oncler** is a **keychain-sized, stealth network scanner** that operates remotely via LoRa from up to **1.2km** away.

---

## What It Is

A **discrete, 58×23×9mm endpoint** that:

- Runs **Nmap, ARP scans** on target networks
- Receives commands via **915MHz LoRa** (HMAC-secured)
- Operates **2-3 days** on 500mAh LiPo
- Deploys **stealthily** — no WiFi/BT emissions

---

## Why You Need It

| Problem | Oncler Solution |
|---------|----------------|
| Physical access required | **1.2km remote** control via LoRa |
| WiFi/BT detected easily | **LoRa is invisible** to standard network tools |
| Large, obvious devices | **Keychain-sized** — fits anywhere |
| Short battery life | **2-3 days** on single charge |

---

## How It Works

1. **Deploy** Oncler near target network
2. **Send command** from Bar-ba-loot controller via LoRa
3. **Oncler executes** Nmap/ARP scan
4. **Results forwarded** back via LoRa mesh
5. **Deep sleep** when idle → ultra-low power

> **Security**: All packets HMAC-authenticated, payload AES-256 encrypted end-to-end.

---

## Hardware

| Spec | Value |
|------|-------|
| MCU | Luckfox Pico Max (256MB RAM) |
| Radio | RFM95W 915MHz LoRa |
| Size | 58×23×9mm |
| Weight | 14g |
| Battery | 500mAh LiPo |
| Runtime | 2-3 days active, 20+ days sleep |

---

## Firmware

The Oncler runs **custom firmware** on the Luckfox Pico Max, located in [`../../firmware/endpoint/`](../../firmware/endpoint/):

- **Network scanning**: Nmap integration, ARP discovery
- **LoRa stack**: HMAC-secured packet handling
- **Battery management**: MAX17048 fuel gauge
- **Mode switching**: Multiple operational modes

### Building & Flashing

1. Set up Luckfox SDK and Buildroot environment
2. Navigate to `firmware/endpoint/` directory
3. Follow build instructions in the firmware directory
4. Flash firmware to Luckfox Pico Max via USB

**Note**: Firmware is based on KaliAssistant's Fox-Jack SDK and mode framework.

---

## PCB Design

KiCad PCB design files will be added when the design is complete. The design will include:

- Luckfox Pico Max module integration
- RFM95W LoRa radio module
- MAX17048 fuel gauge circuit
- Battery management and charging
- Power distribution and mode switching

---

## Enclosures

3D printed case designs will be added when ready. Design goals:

- Keychain-friendly form factor
- Minimal profile for stealthy deployment
- Rugged construction for field use
- Hidden antenna design

**3D Printing Notes**:
- **Material**: PETG or ABS recommended
- **Layer Height**: 0.2mm for strength
- **Infill**: 20-30% for balance of strength/weight
- **Supports**: Minimal, designed for easy removal

**Note**: Before printing enclosures, breadboard the electronics and verify functionality.

---

## Root Filesystem

Custom root filesystem configuration is in [`rootfs/`](rootfs/), including:
- Custom initialization scripts (`rcS`)
- Network scanning tools and payloads
- System configuration files

---

## Getting Started

### Recommended Build Order

1. **Breadboard first**: Test electronics on a breadboard before soldering
2. **Verify firmware**: Build and flash endpoint firmware
3. **Test LoRa communication**: Verify mesh connectivity with controller
4. **Test network scanning**: Verify Nmap/ARP functionality
5. **PCB assembly**: Once verified, solder components to PCB
6. **Enclosure**: Design and print case after electronics are confirmed working

### Parts & Documentation

- [BOM.md](BOM.md) — Complete bill of materials with buy links
- [`../../firmware/endpoint/`](../../firmware/endpoint/) — Luckfox firmware source
- [`rootfs/`](rootfs/) — Root filesystem configuration
- [`fox-jack-reference/`](fox-jack-reference/) — Original Fox-Jack reference repository (build system, PCB designs, source code)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

