# Step 2: Flash Firmware

## Prerequisites

- Soldered and tested PCB (from [Step 1](01_solder_pcb.md))
- Luckfox SDK installed
- USB-C cable (data capable)
- Linux/macOS host (Windows via WSL)

## SDK Setup

```bash
# Clone Luckfox SDK
git clone https://github.com/LuckfoxTechnology/luckfox-pico.git
cd luckfox-pico

# Install dependencies
sudo apt-get install -y build-essential git python3 python3-pip
pip3 install -r requirements.txt

# Setup build environment
source scripts/setup_env.sh
```

## Build Firmware

```bash
cd devices/oncler/firmware

# Configure for Luckfox Pico Max
export LUCKFOX_BOARD=pico-max-256m

# Build rootfs with LoRax firmware
./build.sh

# Output: firmware/oncler_update.img
```

## Flash to Device

1. **Enter maskrom mode**:
   - Hold BOOT button
   - Connect USB-C to host
   - Release BOOT button

2. **Flash firmware**:
```bash
cd tools/luckfox-tools
./rkdevtool.py -t flash -i ../../../firmware/oncler_update.img
```

3. **Verify boot**:
   - Device should boot, LED blinks
   - Check serial console (115200 baud)

## Configuration

Edit `rootfs/rcS` to configure:
- LoRa frequency (915MHz default)
- HMAC keys (generate new keys for security)
- Network scan parameters

## Troubleshooting

- **Device not detected**: Check USB cable, try different port
- **Boot loop**: Verify firmware build, check serial logs
- **No LoRa**: Verify RFM95W connections, SPI pins

## Next Steps

Once firmware is running, proceed to [Step 3: Print Case](03_print_case.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

