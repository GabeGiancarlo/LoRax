# Step 1: Solder PCB Components

## Tools Required

- Soldering iron (temperature controlled, 350°C recommended)
- Solder wire (0.8mm, lead-free or 63/37)
- Flux (optional, but recommended)
- Tweezers
- Multimeter
- Helping hands or PCB holder

## Parts Preparation

Before soldering, verify all components from [BOM.md](../BOM.md):

1. ✅ TTGO LoRa32 T3 (with built-in OLED and LoRa)
2. ✅ Kailh Choc switches (4x)
3. ✅ Micro Lipo charger board
4. ✅ JST PH connector
5. ✅ Battery (test separately first)

## Soldering Steps

### 1. Switches

- **Kailh Choc switches** → Solder to PCB switch pads
- **Test fit**: Ensure switches click properly
- **Direction**: Check switch orientation (hotswap sockets recommended)

### 2. Charger Board

- **Micro Lipo charger** → Solder JST connector wires
- **USB jack**: Verify alignment with case opening
- **Test**: Charge battery before proceeding

### 3. Battery Connection

- **JST PH connector** → Wire to TTGO power pins
- **Polarity**: Double-check — reversed will damage device!
- **Fuse**: Add optional fuse if space permits

## Verification

1. **Power test**: Connect battery, verify 3.3V on rails
2. **OLED test**: Should show boot screen
3. **Button test**: Check continuity on switch pads
4. **LoRa test**: RFM95W should initialize (check firmware)

## Common Issues

- **OLED blank**: Check I2C connections, power rails
- **Switches don't work**: Verify switch orientation, continuity
- **No power**: Check battery voltage, fuse, polarity

## Next Steps

Once PCB is verified, proceed to [Step 2: Flash Firmware](02_flash_firmware.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

