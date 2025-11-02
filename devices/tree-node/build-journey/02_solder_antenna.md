# Step 2: Solder Antenna & PCB

## Antenna Assembly

The Tree Node uses a **pop-out 10dBi antenna** for extended range.

### Step 1: Antenna Connector

1. **Solder SMA connector** to antenna cable (if not pre-assembled)
2. **Test continuity**: Center pin → antenna element
3. **Check ground**: Outer shield → SMA ground

### Step 2: RFM95W Connection

1. **Solder RFM95W** to Feather via SPI pins:
   - MOSI → MOSI
   - MISO → MISO
   - SCK → SCK
   - CS → CS (GPIO 10)
   - RST → RST (GPIO 9)
   - DIO0 → DIO0 (GPIO 2)

2. **Attach antenna** to RFM95W SMA connector
   - **Critical**: Tighten properly (hand-tight + quarter turn)
   - **Never power on** without antenna attached!

## Main PCB Assembly

### Step 3: Power Management

1. **MAX17048**: Solder to Feather via I2C
   - SDA → SDA
   - SCL → SCL
   - GND → GND
   - VCC → 3.3V

2. **AP22802 Load Switch**: 
   - Gate → GPIO (for power gating RFM95W)
   - IN → 3.3V rail
   - OUT → RFM95W VCC

3. **WS2812B LED**:
   - Data → GPIO (e.g., GPIO 8)
   - VCC → 3.3V
   - GND → GND

### Step 4: Battery Connection

1. **JST PH connector**:
   - Red → VBAT+
   - Black → GND
   - **Double-check polarity!**

2. **Test voltage**: Multimeter on battery pins

## Verification

1. **Power on** (via USB first, no battery):
   - LED should blink
   - Serial output: "Tree Node initializing"

2. **Attach battery**:
   - MAX17048 should read voltage
   - Deep sleep should activate (LED off)

3. **RFM95W test**:
   - Check SPI communication
   - Verify antenna connected (critical!)

## Common Issues

- **RFM95W not detected**: Check SPI connections, CS pin
- **No antenna**: Device will damage RFM95W — always attach antenna!
- **Battery not detected**: Check MAX17048 connections, I2C address

## Next Steps

PCB assembled? Proceed to [Step 3: Assemble Case](03_assemble_case.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

