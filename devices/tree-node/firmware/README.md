# Tree Node Firmware

## Overview

The Tree Node runs **Arduino-based firmware** on the Adafruit Feather ESP32-S3 with:

- **Mesh relay**: Auto-forwarding, hop count tracking
- **Deep sleep**: ULP wake, 25µA average draw
- **Battery monitoring**: MAX17048 fuel gauge
- **Status LED**: WS2812B for deployment feedback

## Features

- **Mesh relay**: Automatically forwards packets with hop count increment
- **Auto-discovery**: Joins mesh via HELLO broadcasts
- **Deep sleep**: Wakes every 10s to listen for packets (100ms RX window)
- **Power efficient**: 20-25 days on 500mAh LiPo
- **Range extension**: 3km per hop with 10dBi antenna

## Dependencies

- **RadioLib**: LoRa communication (https://github.com/jgromes/RadioLib)
- **Adafruit MAX1704X**: Battery fuel gauge (https://github.com/adafruit/Adafruit_MAX1704X_Library)
- **FastLED**: WS2812B LED control (https://github.com/FastLED/FastLED)

## Configuration

Edit `tree-node.ino` to configure:

- **LoRa frequency**: `915E6` (North America) or `868E6` (Europe)
- **HMAC key**: Generate secure 32-byte key
- **Wake interval**: Default 10s (adjustable for power/performance tradeoff)
- **RX window**: Default 100ms (adjustable)

## Building

1. **Install Arduino IDE** (1.8.x or 2.x)

2. **Add ESP32 board support**:
   - File → Preferences → Additional Board Manager URLs
   - Add: `https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json`
   - Tools → Board → Boards Manager → Install "ESP32"

3. **Install libraries** (see Dependencies above)

4. **Select board**: Tools → Board → ESP32 Arduino → "Adafruit Feather ESP32-S3"

5. **Upload**: Sketch → Upload

## Serial Monitor

- **Baud rate**: 115200
- **Output**: Node status, packet forwarding, battery level, RSSI

## Deployment

See [build-journey/04_test_range.md](../build-journey/04_test_range.md) for range testing and mesh verification.

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

