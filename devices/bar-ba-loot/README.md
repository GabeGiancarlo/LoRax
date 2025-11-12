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

The Bar-ba-loot runs **Arduino-based firmware**:

- **OLED UI**: Menu system, status display
- **LoRa stack**: Command transmission, response handling
- **Button handling**: Debounced input, navigation
- **Mesh routing**: Multi-hop support via Truffula Nodes

---

## See Also

- [BOM.md](BOM.md) — Buy links
- [pcb/](pcb/) — KiCad PCB design
- [firmware/](firmware/) — Arduino sketches
- [enclosures/](enclosures/) — 3D printed case
- [build-journey/](build-journey/) — Step-by-step build guide

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

