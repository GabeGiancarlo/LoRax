# Truffula Node

## Design Overview

The Truffula Node is a **custom LoRa mesh node** combining:

- **Adafruit Feather ESP32-S3** (main MCU)
- **HopeRF RFM95W** (915MHz LoRa radio)
- **Adafruit MAX17048** (battery fuel gauge)
- **RAK12500** (GNSS/GPS location module)
- **RAK18001** (buzzer module)
- **AP22802** (load switch for power gating)

## Two Versions

### 1. Slim/Professional Version
- **Form Factor**: Flat rectangular box shape
- **Battery**: 500mAh LiPo (JST PH connector)
- **Mounting**: N42 magnet for magnetic attachment
- **Use Case**: Compact, professional deployment

### 2. Round/Tree Trunk Version
- **Form Factor**: Round, tree trunk-like design
- **Battery**: 21700 lithium-ion cell (5000mAh) with replaceable battery system
- **Battery System**: Includes BMS (Battery Management System) for protection
- **Use Case**: Longer runtime, user-replaceable battery

## Key Features

- **Low power**: Deep sleep support, power gating for RFM95W
- **Battery monitoring**: MAX17048 for accurate fuel gauge in deep sleep
- **GPS tracking**: RAK12500 GNSS module for location data
- **Audio feedback**: RAK18001 buzzer for alerts and notifications
- **Range optimization**: Direct antenna connection (5dBi recommended, 10dBi optional)
- **Mesh relay**: Auto-forwarding with hop count tracking

## Hardware Connections

### I2C Bus (Shared)
Both RAK modules and MAX17048 use I2C:
- **SDA**: Pin 6 (default I2C)
- **SCL**: Pin 7 (default I2C)
- **Addresses**:
  - MAX17048: `0x36`
  - RAK12500 GPS: `0x42` (check datasheet)
  - RAK18001 Buzzer: `0x58` (check datasheet)

### SPI Bus (RFM95W)
- **MOSI**: Pin 35
- **MISO**: Pin 37
- **SCK**: Pin 36
- **CS**: Pin 33
- **RST**: Pin 38
- **DIO0**: Pin 39

### Power
- **3.3V**: For RFM95W, MAX17048, RAK modules
- **5V**: Available from Feather (for USB power)
- **Battery**: Connected via JST PH (slim) or BMS (round)

## PCB Design Files

- **Eagle PCB**: `pcb/Adafruit ESP32-S3 8MB No PSRAM.brd` (current design)
- **Eagle Schematic**: `pcb/Adafruit ESP32-S3 8MB No PSRAM.sch` (current design)
- **Pinout Reference**: `pcb/Adafruit Feather ESP32-S3 Pinout.pdf`

## Getting Started

1. **Purchase Parts**: See [BOM.md](docs/BOM.md) for complete parts list
2. **Breadboard Setup**: Follow [Breadboarding Guide](docs/BREADBOARDING.md) to test components
3. **Solder PCB**: Once verified, solder components to custom PCB
4. **Flash Firmware**: Upload mesh relay firmware to ESP32-S3
5. **Design Case**: Create 3D printed enclosure for your chosen version

## Documentation

- [docs/BOM.md](docs/BOM.md) — Complete bill of materials
- [docs/BREADBOARDING.md](docs/BREADBOARDING.md) — Breadboard setup guide for both versions
- [pcb/](pcb/) — PCB design files and pinout reference
- [firmware/](firmware/) — Arduino mesh relay code
- [enclosures/](enclosures/) — 3D print files (to be designed)
- [media/](media/) — Design screenshots and reference images

## Component Compatibility

✅ **Verified Components**:
- Adafruit Feather ESP32-S3
- HopeRF RFM95W 915MHz
- Adafruit MAX17048
- RAK12500 GPS Module (I2C compatible)
- RAK18001 Buzzer Module (I2C compatible)

⚠️ **Note**: RAK WisBlock modules use a standardized connector system. For use with Adafruit Feather, you'll need to connect via I2C using jumper wires or create an adapter board. The modules are I2C-compatible and will work with the Feather's I2C bus.

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*
