# LoRax Architecture

## Overview

LoRax is a **modular, device-agnostic LoRa mesh ecosystem** for remote network reconnaissance. The architecture is designed for:

- **Scalability**: Add new devices with identical structure
- **Modularity**: Shared SDK, per-device firmware
- **Security**: HMAC + AES-256 end-to-end encryption
- **Range**: Multi-hop mesh via Truffula Node relays

---

## System Architecture

```
┌─────────────────┐
│  Bar-ba-loot    │  Handheld C2 Controller
│  (ESP32)        │
└────────┬────────┘
         │ LoRa (915MHz)
         │
    ┌────▼────┐
    │Truffula │  Relay Node (ESP32-S3)
    │  Node   │
    └────┬────┘
         │ LoRa
         │
    ┌────▼────┐
    │ Oncler  │  Ghost Scanner (Luckfox)
    │(Endpoint)│
    └─────────┘
```

---

## Directory Structure

```
LoRax/
├── shared/              # Shared across all devices
│   ├── sdk/             # Common libraries (crypto, mesh, utils)
│   ├── docs/            # Ecosystem documentation
│   ├── reference/       # Fox-Jack reference (submodule)
│   └── build/           # Shared build tools
│
├── devices/             # One folder per device (identical structure)
│   ├── oncler/          # Endpoint device (LoRa scanner)
│   ├── lorax/           # IP Mesh MANET radio
│   ├── bar-ba-loot/     # Controller device
│   └── truffula-node/   # Relay device
│
├── CREDITS.md           # Attribution
├── LICENSE              # GPL v3
└── README.md            # Ecosystem overview
```

---

## Communication Protocol

### Packet Structure

```
┌─────────┬─────────┬─────────┬──────────┬──────────┬──────────┐
│  HMAC   │  CMD    │  SRC    │  DST     │  HOP     │  PAYLOAD │
│ (32B)   │  (1B)   │  ID(1B) │  ID(1B)  │  (1B)    │  (242B)  │
└─────────┴─────────┴─────────┴──────────┴──────────┴──────────┘
```

### Security

- **HMAC-SHA256**: Packet authentication (32 bytes)
- **AES-256-GCM**: Payload encryption (end-to-end)
- **Hop-by-hop**: Each relay validates HMAC before forwarding

### Commands

| CMD | Value | Description |
|-----|-------|-------------|
| HELLO | 0x01 | Mesh discovery broadcast |
| SCAN | 0x02 | Network scan request |
| RESULT | 0x03 | Scan results response |
| ROUTE | 0x04 | Routing/status update |

---

## Device Types

### Oncler (Endpoint)

- **MCU**: Luckfox Pico Max (256MB)
- **Role**: Execute Nmap/ARP scans
- **Power**: 500mAh LiPo, 2-3 days active
- **Firmware**: Custom Linux-based (Luckfox SDK)

### Lorax (IP Mesh)

- **SBC**: i.MX 8M Plus Quad-core, 4GB RAM, 64GB eMMC
- **Role**: MANET mesh networking, voice/data/video
- **Wireless**: WiFi 6/7 + LoRa/GPS parallel operation
- **Firmware**: Custom Linux mesh routing firmware

### Bar-ba-loot (Controller)

- **MCU**: TTGO LoRa32 T3 (ESP32)
- **Role**: Send commands, display results
- **Power**: 500mAh LiPo, 2-3 days active
- **Firmware**: Arduino-based (ESP32)

### Truffula Node (Relay)

- **MCU**: Adafruit Feather ESP32-S3
- **Role**: Mesh relay, extend range
- **Power**: 500mAh LiPo, 20-25 days
- **Firmware**: Arduino-based (deep sleep)

---

## Mesh Routing

### Auto-Discovery

1. **HELLO broadcasts**: Truffula Nodes announce presence (30s interval)
2. **Neighbor table**: Each node maintains list of nearby nodes
3. **Hop count**: Increments with each relay

### Routing Algorithm

- **Destination ID**: Every packet includes target device ID
- **Hop limit**: Maximum 8 hops (prevents loops)
- **Best path**: Nodes forward to closest neighbor to destination

### Example

```
Controller → Node A → Node B → Endpoint
   (0 hops)  (1 hop)  (2 hops)  (3 hops)
```

---

## Power Management

### Active Mode

- **Oncler**: ~150mA scanning, ~50mA idle
- **Bar-ba-loot**: ~80mA display on, ~30mA display off
- **Truffula Node**: ~100mA RX, ~25µA deep sleep
- **Lorax**: Varies by operation mode (WiFi/LoRa active)

### Deep Sleep

- **Oncler**: Linux suspend (S3 state)
- **Bar-ba-loot**: ESP32 light sleep
- **Truffula Node**: ESP32-S3 ULP deep sleep (wake every 10s)
- **Lorax**: Linux suspend or low-power mode

---

## Security Model

### Authentication

- **HMAC keys**: Unique per device pair (or shared mesh key)
- **Packet validation**: Every relay validates HMAC before forwarding
- **Replay protection**: Sequence numbers prevent replay attacks

### Encryption

- **AES-256-GCM**: End-to-end payload encryption
- **Nonce**: 12-byte nonce per packet (timestamp + random)
- **Key derivation**: PBKDF2 from shared secret

### Threat Model

- **Passive eavesdropping**: Mitigated by AES-256 encryption
- **Replay attacks**: Prevented by sequence numbers
- **Unauthorized access**: HMAC prevents packet injection
- **Physical compromise**: Keys stored in secure element (if available)

---

## Future Extensions

### Planned Devices

- **Once-ler**: Long-range base station (5km+)
- **Truffula Seed**: Sensor node (temperature, humidity)

### Planned Features

- **OTA updates**: Firmware updates via mesh
- **Mesh diagnostics**: Health monitoring, battery alerts
- **Key rotation**: Dynamic key exchange

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

