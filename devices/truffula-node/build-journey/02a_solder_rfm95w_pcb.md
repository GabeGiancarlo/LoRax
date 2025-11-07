# Step 2a: Solder RFM95W Module to Custom PCB

## Overview

This guide covers soldering the **RFM95W module** directly to a custom PCB that integrates with the ESP32-S3. The RFM95W is a complete module (not a bare chip), making it easier to work with than the bare SX1276 chip.

---

## RFM95W Module Specifications

- **Dimensions**: 16mm × 16mm × 3mm
- **Pin Pitch**: 2.54mm (0.1")
- **Pin Count**: 8 pins (2×4 header)
- **Package**: Through-hole or surface-mount pads
- **Frequency**: 915MHz (North America) or 868MHz (Europe)

### Pinout

| Pin | Name | Function | ESP32-S3 Connection |
|-----|------|----------|---------------------|
| 1 | GND | Ground | GND |
| 2 | MOSI | SPI Data Out | GPIO 11 (MOSI) |
| 3 | MISO | SPI Data In | GPIO 13 (MISO) |
| 4 | SCK | SPI Clock | GPIO 12 (SCK) |
| 5 | NSS/CS | Chip Select | GPIO 10 (CS) |
| 6 | RST | Reset | GPIO 9 (RST) |
| 7 | DIO0 | Interrupt | GPIO 2 (DIO0) |
| 8 | 3.3V | Power | 3.3V (via AP22802 load switch) |

---

## Soldering Methods

### Method 1: Surface Mount (Recommended for Custom PCB)

**Best for**: Custom PCB design with SMD pads

**Steps**:

1. **Prepare PCB**:
   - Apply solder paste to RFM95W pads using stencil
   - Or manually apply small dots of solder paste to each pad

2. **Place RFM95W Module**:
   - Use tweezers to align module over pads
   - Ensure pin 1 (GND) aligns with pad marked "1" or ground symbol
   - Check alignment with magnifying glass

3. **Tack Solder**:
   - Heat one corner pin (GND or 3.3V) to temporarily hold module
   - Verify alignment before proceeding

4. **Solder All Pins**:
   - Use fine-tip soldering iron (0.5mm-1mm tip)
   - Temperature: 350-370°C (660-700°F)
   - Apply flux to each pin
   - Touch iron to pad + pin junction
   - Feed thin solder wire (0.5mm) until joint is smooth
   - **Avoid solder bridges** between adjacent pins

5. **Inspect**:
   - Check each joint under magnification
   - Look for:
     - Smooth, shiny joints (not dull/grainy)
     - No solder bridges between pins
     - Good fillet on both pad and pin

6. **Clean**:
   - Remove flux residue with isopropyl alcohol
   - Use soft brush to clean between pins

### Method 2: Through-Hole Headers

**Best for**: Prototyping or if using existing Feather board

**Steps**:

1. **Solder Headers to RFM95W**:
   - Insert 8-pin header (2×4) into RFM95W module
   - Solder from top side of module
   - Ensure headers are perpendicular

2. **Solder Headers to PCB**:
   - Insert header pins through PCB holes
   - Solder from bottom side
   - Trim excess pin length

3. **Connect to ESP32-S3**:
   - Use jumper wires or PCB traces
   - Keep SPI traces short (< 5cm)
   - Route away from RF section

---

## Custom PCB Design in CAD

### KiCad Workflow

1. **Create RFM95W Footprint**:
   ```
   File → New Footprint
   Name: RFM95W_Module
   ```

   **Pad Specifications**:
   - **Pad Size**: 1.5mm × 1.5mm (square)
   - **Pad Spacing**: 2.54mm (0.1")
   - **Pad Count**: 8 (2 rows × 4 columns)
   - **Hole Size**: 0.8mm (if through-hole)
   - **Pad Type**: SMD (for surface mount) or Through-hole

   **Placement**:
   - Pin 1 (GND): Bottom-left
   - Pin 8 (3.3V): Top-left
   - Row spacing: 12.7mm (0.5")

2. **Create Schematic Symbol**:
   ```
   File → New Symbol
   Name: RFM95W
   ```

   **Pin Layout**:
   - Left side: GND, MOSI, MISO, SCK
   - Right side: NSS, RST, DIO0, 3.3V
   - Add labels for each pin

3. **Design Schematic**:
   - Place RFM95W symbol
   - Place ESP32-S3 symbol
   - Connect pins:
     - SPI: MOSI, MISO, SCK
     - Control: NSS → GPIO10, RST → GPIO9, DIO0 → GPIO2
     - Power: 3.3V → AP22802 → RFM95W VCC
     - Ground: GND → GND plane

4. **PCB Layout**:
   - Place RFM95W module on left side of board
   - Place ESP32-S3 in center
   - Route SPI traces:
     - Keep traces short and direct
     - Use 0.2mm trace width
     - Maintain 0.2mm spacing between traces
   - **RF Considerations**:
     - Keep RFM95W antenna area clear (no ground plane under antenna)
     - Add ground plane on bottom layer
     - Place decoupling capacitors close to RFM95W VCC pin
     - Route antenna trace with 50Ω impedance (use impedance calculator)

5. **Generate Manufacturing Files**:
   - File → Fabrication Outputs → Gerbers
   - Include: Top copper, bottom copper, solder mask, silkscreen, drill file

### Eagle Workflow

1. **Create RFM95W Package**:
   ```
   Library → Package → New
   Name: RFM95W_MODULE
   ```

   **Pad Placement**:
   - Use `PAD` tool
   - Size: 1.5mm × 1.5mm
   - Spacing: 2.54mm
   - Create 2×4 grid

2. **Create RFM95W Device**:
   - Link package to schematic symbol
   - Define pin mapping

3. **Schematic & Board Design**:
   - Similar to KiCad workflow
   - Use `ROUTE` tool for traces
   - Use `POLYGON` for ground planes

---

## Antenna Connection

### Option 1: SMA Connector (Current Design)

- **RFM95W** has built-in SMA female connector
- Connect external antenna via SMA cable
- **Pros**: Easy to swap antennas, good performance
- **Cons**: Adds height, requires external antenna

### Option 2: uFL/IPEX Connector (More Compact)

- Replace SMA with **uFL connector** on PCB
- Use uFL-to-SMA pigtail for external antenna
- **Pros**: Lower profile, flexible antenna placement
- **Cons**: Slightly more loss, more fragile

### Option 3: PCB Antenna (Smallest)

- Design **printed antenna** directly on PCB
- Quarter-wave monopole: ~82mm for 915MHz
- **Pros**: No external components, very compact
- **Cons**: Lower gain (~2-3dBi), requires RF design expertise

---

## Antenna Size Considerations

### Current 10dBi Antenna

- **Length**: ~19cm (quarter-wave with gain elements)
- **Gain**: 10dBi (10× power increase)
- **Range**: ~3km line-of-sight
- **Size**: Too large for compact keychain design

### Alternative Antenna Options

| Type | Length | Gain | Range | Notes |
|------|--------|------|-------|-------|
| **Quarter-wave wire** | 8.2cm | 0dBi | ~500m | Simple, compact |
| **Helical/spring** | 5-8cm | 2-3dBi | ~1km | Good balance |
| **PCB antenna** | 8.2cm | 2-3dBi | ~1km | Integrated, no external parts |
| **3dBi rubber duck** | 10cm | 3dBi | ~1.5km | Flexible, compact |
| **5dBi whip** | 12cm | 5dBi | ~2km | Better than 10dBi, smaller |
| **10dBi (current)** | 19cm | 10dBi | ~3km | Best range, but large |

### Recommendation

For **keychain-sized** Truffula Node:
- **Use 3-5dBi antenna** instead of 10dBi
- **Range**: Still 1.5-2km (adequate for mesh relay)
- **Size**: 10-12cm (much more manageable)
- **Trade-off**: Slightly reduced range, but much better form factor

**Suggested**: 5dBi whip antenna (~12cm) provides good balance

---

## Testing After Soldering

1. **Visual Inspection**:
   - Check for solder bridges
   - Verify all pins are soldered
   - Check for cold joints (dull, grainy appearance)

2. **Continuity Test**:
   - Use multimeter to check:
     - GND continuity
     - 3.3V connection
     - SPI pins (MOSI, MISO, SCK)
     - Control pins (CS, RST, DIO0)

3. **Power Test**:
   - Apply 3.3V power
   - Check current draw: ~20mA idle, ~120mA TX
   - **Never power on without antenna!**

4. **SPI Communication**:
   - Upload test firmware
   - Check serial output for RFM95W detection
   - Verify register reads/writes

---

## Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| **Solder bridges** | Too much solder | Use solder wick to remove excess |
| **Cold joints** | Insufficient heat | Reheat joint, add flux |
| **Module not detected** | Wrong SPI pins | Verify pin mapping in firmware |
| **No RF output** | Antenna not connected | **Always attach antenna before powering!** |
| **Poor range** | Antenna mismatch | Check antenna is 915MHz (not 868MHz) |

---

## Next Steps

- RFM95W soldered? Proceed to [Step 2: Solder Antenna & PCB](02_solder_antenna.md)
- Custom PCB designed? Generate Gerber files and order from PCB manufacturer

---

*For bare SX1276 chip integration (advanced), see separate guide*

