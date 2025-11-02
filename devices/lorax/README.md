# Lorax — LoRa Ghost Scanner

> *"Unless someone like you cares a whole awful lot, nothing is going to get better. It's not."*  
> — The Lorax

The **Lorax** is a **keychain-sized, stealth network scanner** that operates remotely via LoRa from up to **1.2km** away.

---

## What It Is

A **discrete, 58×23×9mm endpoint** that:

- Runs **Nmap, ARP scans** on target networks
- Receives commands via **915MHz LoRa** (HMAC-secured)
- Operates **2-3 days** on 500mAh LiPo
- Deploys **stealthily** — no WiFi/BT emissions

---

## Why You Need It

| Problem | Lorax Solution |
|---------|----------------|
| Physical access required | **1.2km remote** control via LoRa |
| WiFi/BT detected easily | **LoRa is invisible** to standard network tools |
| Large, obvious devices | **Keychain-sized** — fits anywhere |
| Short battery life | **2-3 days** on single charge |

---

## How It Works

1. **Deploy** Lorax near target network
2. **Send command** from Bar-ba-loot controller via LoRa
3. **Lorax executes** Nmap/ARP scan
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

The Lorax runs **custom firmware** on the Luckfox Pico Max:

- **Network scanning**: Nmap integration, ARP discovery
- **LoRa stack**: HMAC-secured packet handling
- **Battery management**: MAX17048 fuel gauge
- **Mode switching**: Multiple operational modes

---

## See Also

- [BOM.md](BOM.md) — Buy links
- [pcb/](pcb/) — KiCad PCB design
- [firmware/](firmware/) — Luckfox firmware
- [enclosures/](enclosures/) — 3D printed case
- [build-journey/](build-journey/) — Step-by-step build guide

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

