# Bar-ba-loot — Handheld LoRa C2 Controller

> *"I am the Lorax. I speak for the trees. And the trees are scanning your network."*

<div align="center">

![Bar-ba-loot](../../shared/media/images/reference/barbaloot-book.jpeg)
*Bar-ba-loot — the controller with a cart and a horn*

</div>

The **Bar-ba-loot** is a **handheld command & control** device that sends scan commands to remote Oncler endpoints via **915MHz LoRa**.

---

## What It Is

A **portable controller** with:

- **OLED display** for status and command selection
- **Tactile buttons** for navigation and sending commands
- **915MHz LoRa radio** for mesh communication
- **2-3 day battery** on 500mAh LiPo

---

## Why You Need It

| Problem | Bar-ba-loot Solution |
|---------|----------------------|
| Need direct access | **1.2km remote** command via LoRa |
| Complex command entry | **Tactile buttons** + OLED menu |
| Can't see scan results | **OLED display** shows status |
| Large control units | **Handheld-sized** — fits in pocket |

---

## How It Works

1. **Power on** → OLED shows device list
2. **Navigate menu** with buttons → select target Oncler
3. **Select scan type** (Nmap, ARP, custom)
4. **Send command** via LoRa → HMAC-authenticated
5. **Display results** on OLED as they arrive

> **Security**: All commands HMAC-signed, responses AES-256 encrypted.

---

## Hardware

| Spec | Value |
|------|-------|
| MCU | TTGO LoRa32 T3 (ESP32) |
| Display | 0.96" OLED 128×64 |
| Radio | RFM95W 915MHz LoRa |
| Input | Kailh Choc Low Profile switches |
| Battery | 500mAh LiPo |
| Runtime | 2-3 days active |

![Bar-ba-loot PCB Top](../../shared/media/images/devices/bar-ba-loot/bar-ba-loot-pcb-top.jpg)
*Bar-ba-loot PCB (top view)*

![Kailh Choc Switch](../../shared/media/images/devices/bar-ba-loot/kailh-choc-switch.jpg)
*Kailh Choc Low Profile Tactile Switch*

---

## Firmware

The Bar-ba-loot runs **Arduino-based firmware** located in [`../../firmware/controller/`](../../firmware/controller/):

- **OLED UI**: Menu system, status display
- **LoRa stack**: Command transmission, response handling
- **Button handling**: Debounced input, navigation
- **Mesh routing**: Multi-hop support via Truffula Nodes

### Building & Flashing

1. Open the Arduino sketch from `firmware/controller/` in Arduino IDE
2. Select: **Tools → Board → ESP32 Arduino → TTGO T3**
3. Install required libraries (see firmware directory for dependencies)
4. Upload sketch via USB-C

---

## PCB Design

KiCad PCB design files will be added when the design is complete. The design will include:

- TTGO LoRa32 T3 module integration
- Kailh Choc switch footprint placement
- Battery management circuit
- Power distribution and USB-C charging

---

## Enclosures

3D printed case designs will be added when ready. Design goals:

- Ergonomic button layout
- OLED display protection
- FPV antenna cap design
- Room for future expansion

**Note**: Before printing enclosures, breadboard the electronics and verify functionality.

---

## Getting Started

### Recommended Build Order

1. **Breadboard first**: Test electronics on a breadboard before soldering
2. **Verify firmware**: Flash and test controller firmware
3. **Test LoRa communication**: Verify mesh connectivity with other devices
4. **PCB assembly**: Once verified, solder components to PCB
5. **Enclosure**: Design and print case after electronics are confirmed working

### Parts & Documentation

- [BOM.md](BOM.md) — Complete bill of materials with buy links
- [`../../firmware/controller/`](../../firmware/controller/) — Arduino firmware source

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

