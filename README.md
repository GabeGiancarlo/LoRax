# LoRax — A LoRa-Powered Penetration Testing Ecosystem

> *"I am the Lorax. I speak for the trees. And the trees are scanning your network."*

A **modular, expandable, keychain-sized LoRa mesh** for remote network reconnaissance.

## Devices

| Device | Role | Range | Battery |
|--------|------|-------|---------|
| **Lorax** | Ghost scanner (Nmap/ARP) | 1.2km LOS | 2-3 days |
| **Bar-ba-loot** | Handheld C2 controller | 1.2km LOS | 2-3 days |
| **Tree Node** | Mesh relay extender | 3km/hop | 20+ days |

## Why LoRax?

- **Stealth**: Keychain-sized, no WiFi/BT emissions
- **Range**: 8km+ chains via Tree Nodes
- **Secure**: HMAC + AES-256 E2E
- **Open**: Full PCB, STL, firmware, BOMs

## Quick Start

1. Pick a device → `devices/<name>/`
2. Buy parts → `BOM.md`
3. Follow → `build-journey/`
4. Deploy → Chain: Bar-ba-loot → Tree Node → Lorax

---

*Inspired by [KaliAssistant's Fox-Jack](https://github.com/KaliAssistant/fox-jack)*  
*See `CREDITS.md` for full attribution*
