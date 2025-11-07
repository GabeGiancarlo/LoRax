# Truffula Node PCB

## Design Overview

The Truffula Node PCB is a **custom design** combining:

- **Adafruit Feather ESP32-S3** (main MCU)
- **HopeRF RFM95W** (915MHz LoRa radio)
- **Adafruit MAX17048** (battery fuel gauge)
- **AP22802** (load switch for power gating)

## Key Features

- **Low power**: Deep sleep support, power gating for RFM95W
- **Battery monitoring**: MAX17048 for accurate fuel gauge in deep sleep
- **Range optimization**: Direct antenna connection (10dBi support)
- **Compact**: 58×23×9mm footprint
- **Magnetic mount**: N42 magnet pocket in bottom case

## PCB Design Files

- **KiCad project**: `truffula-node.kicad_pcb` (when available)
- **Schematic**: `truffula-node.kicad_sch` (when available)
- **Gerber files**: `gerbers/` (when available)

## Component Placement

1. **Feather ESP32-S3**: Center of board
2. **RFM95W**: Left side, SMA connector accessible
3. **MAX17048**: Right side, I2C connection to Feather
4. **AP22802**: Power gate between 3.3V rail and RFM95W
5. **WS2812B**: Status LED, visible through case
6. **JST PH**: Battery connector, bottom edge

## Manufacturing Notes

- **PCB thickness**: 1.6mm (standard)
- **Copper layers**: 2-layer (top + bottom)
- **Finish**: HASL or ENIG (ENIG recommended)
- **Solder mask**: Green (standard)
- **Silkscreen**: Component labels, polarity marks

## Assembly

See [build-journey/02_solder_antenna.md](../build-journey/02_solder_antenna.md) for step-by-step assembly instructions.

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

