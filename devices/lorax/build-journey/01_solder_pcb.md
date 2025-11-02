# Step 1: Solder PCB Components

## Tools Required

- Soldering iron (temperature controlled, 350°C recommended)
- Solder wire (0.8mm, lead-free or 63/37)
- Flux (optional, but recommended)
- Tweezers
- Multimeter
- Helping hands or PCB holder
- Desoldering braid (for mistakes)

## Parts Preparation

Before soldering, verify all components from [BOM.md](../BOM.md):

1. ✅ Luckfox Pico Max (256MB)
2. ✅ RFM95W module
3. ✅ MAX17048 fuel gauge
4. ✅ Micro Lipo charger board
5. ✅ JST PH connector
6. ✅ Slide switch
7. ✅ Standoffs

## Soldering Order (Easiest to Hardest)

### 1. Through-Hole Components

- **JST PH connector** → Bottom of PCB, align pins correctly
- **Slide switch** → Align with case opening
- **M2 standoffs** → Install last (after testing)

### 2. Surface Mount Components

- **MAX17048** → Use flux, careful with thermal pad
- **Micro Lipo charger** → Pre-tin pads, align USB jack
- **RFM95W** → SPI connections critical, double-check pinout

### 3. Final Assembly

- **Luckfox Pico Max** → Attach via header pins (or direct solder for permanent)
- **Antenna** → SMA connector, ensure proper ground connection

## Verification Steps

1. **Continuity test**: Check for shorts between power rails
2. **Voltage test**: Power on (without battery first), verify 3.3V on rails
3. **RFM95W SPI**: Test with multimeter (CLK, MOSI, MISO should show activity)

## Common Issues

- **Cold joints**: Reheat and add flux
- **Shorts**: Use desoldering braid, clean with isopropyl alcohol
- **Wrong orientation**: MAX17048 and RFM95W have polarity — check datasheets

## Next Steps

Once PCB is verified, proceed to [Step 2: Flash Firmware](02_flash_firmware.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

