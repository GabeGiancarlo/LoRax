# Step 1: Prepare Parts

## Tools Required

- Soldering iron (temperature controlled)
- Solder wire (0.8mm)
- Flux
- Tweezers
- Multimeter
- Wire strippers
- Helping hands

## Parts Verification

Check all components from [BOM.md](../BOM.md):

1. ✅ Adafruit Feather ESP32-S3
2. ✅ RFM95W module (915MHz)
3. ✅ MAX17048 fuel gauge
4. ✅ AP22802 load switch
5. ✅ WS2812B LED
6. ✅ JST PH connector
7. ✅ 10dBi antenna
8. ✅ 500mAh LiPo battery
9. ✅ N42 magnet (optional)

## Pre-Assembly Testing

Before soldering, test components:

### Battery Test
- Measure voltage: Should be 3.7-4.2V
- Check connector: JST PH 2.00mm fits properly

### Feather Test
- Power via USB-C: LED should blink
- Upload blink sketch: Verify functionality

### RFM95W Test
- Visual inspection: No damaged pins
- Check datasheet: Verify pinout matches design

## Preparation

1. **Clean components**: Isopropyl alcohol for pads
2. **Tin pads**: Pre-tin all PCB pads
3. **Organize**: Group components by assembly order
4. **Document**: Take photos before/after for reference

## Next Steps

Parts ready? Proceed to [Step 2: Solder Antenna](02_solder_antenna.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

