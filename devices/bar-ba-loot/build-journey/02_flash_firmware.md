# Step 2: Flash Firmware

## Prerequisites

- Soldered PCB (from [Step 1](01_solder_pcb.md))
- Arduino IDE or PlatformIO
- USB-C cable
- ESP32 board support

## Arduino IDE Setup

1. **Install Arduino IDE** (1.8.x or 2.x)

2. **Add ESP32 board support**:
   - File → Preferences → Additional Board Manager URLs
   - Add: `https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json`
   - Tools → Board → Boards Manager → Install "ESP32"

3. **Install Libraries**:
   - Tools → Manage Libraries
   - Install: "RadioLib" (LoRa)
   - Install: "Adafruit SSD1306" (OLED)
   - Install: "Adafruit GFX"

## Flash Firmware

1. **Open sketch**:
   ```bash
   devices/bar-ba-loot/firmware/bar-ba-loot.ino
   ```

2. **Select board**: Tools → Board → ESP32 Arduino → "TTGO T3"

3. **Configure**:
   - Tools → Port → Select USB port
   - Tools → Upload Speed → 921600
   - Tools → Partition Scheme → "Default 4MB with spiffs"

4. **Upload**: Sketch → Upload

## Verify

After upload:
- OLED should show "LoRax Controller" splash screen
- Press buttons → menu should navigate
- Check serial monitor (115200 baud) for debug output

## Configuration

Edit `bar-ba-loot.ino`:
- **LoRa frequency**: `915E6` (North America)
- **HMAC key**: Generate secure key (32 bytes)
- **OLED brightness**: Adjust in code

## Troubleshooting

- **Upload fails**: Check USB cable, hold BOOT button during upload
- **OLED blank**: Verify I2C address (0x3C default)
- **Buttons not working**: Check pin assignments in code

## Next Steps

Firmware running? Test with Oncler endpoint and proceed to case assembly!

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

