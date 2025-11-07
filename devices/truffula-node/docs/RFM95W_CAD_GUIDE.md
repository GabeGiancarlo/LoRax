# RFM95W CAD Design Guide

## Overview

This guide provides detailed instructions for representing the RFM95W module in CAD programs (KiCad, Eagle, Altium) for custom PCB design.

---

## RFM95W Module Dimensions

### Physical Specifications

- **Module Size**: 16mm × 16mm × 3mm
- **Pin Pitch**: 2.54mm (0.1" standard)
- **Pin Configuration**: 2 rows × 4 columns
- **Row Spacing**: 12.7mm (0.5")
- **Pin Size**: 0.64mm diameter (through-hole) or 1.5mm × 1.5mm pad (SMD)
- **SMA Connector**: 8.2mm diameter, 4mm height (if using external antenna)

### Pin Layout (Top View)

```
     [SMA Connector]
          ↑
    ┌─────────────┐
    │             │
  8 │ 3.3V        │  ← Top row
  7 │ DIO0        │
  6 │ RST         │
  5 │ NSS/CS      │
    │             │
  4 │ SCK         │  ← Bottom row
  3 │ MISO        │
  2 │ MOSI        │
  1 │ GND         │
    └─────────────┘
```

---

## KiCad Design

### Step 1: Create Footprint

1. **Open Footprint Editor**:
   ```
   Tools → Footprint Editor
   File → New Footprint
   Name: RFM95W_Module
   ```

2. **Create Pads**:
   - Use `Add Pad` tool (F8)
   - **Pad Settings**:
     - Type: `SMD` (for surface mount) or `Through-hole`
     - Shape: `Rectangular` (SMD) or `Round` (through-hole)
     - Size: 1.5mm × 1.5mm (SMD) or 0.8mm drill (through-hole)
     - Number: 1-8

3. **Place Pads**:
   - **Bottom Row** (pins 1-4): Y = 0mm
     - Pin 1 (GND): X = -5.715mm
     - Pin 2 (MOSI): X = -1.905mm
     - Pin 3 (MISO): X = 1.905mm
     - Pin 4 (SCK): X = 5.715mm
   
   - **Top Row** (pins 5-8): Y = 12.7mm
     - Pin 5 (NSS): X = -5.715mm
     - Pin 6 (RST): X = -1.905mm
     - Pin 7 (DIO0): X = 1.905mm
     - Pin 8 (3.3V): X = 5.715mm

4. **Add Silkscreen**:
   - Draw rectangle: 16mm × 16mm
   - Add pin 1 indicator (dot or triangle)
   - Add component outline

5. **Add Courtyard**:
   - Draw rectangle: 18mm × 18mm (1mm clearance)
   - Place on `F.CrtYd` layer

6. **Save Footprint**:
   - Save to custom library or project library

### Step 2: Create Schematic Symbol

1. **Open Symbol Editor**:
   ```
   Tools → Symbol Editor
   File → New Symbol
   Name: RFM95W
   ```

2. **Add Pins**:
   - Left side (inputs):
     - Pin 2: MOSI (input)
     - Pin 3: MISO (output)
     - Pin 4: SCK (input)
     - Pin 5: NSS (input)
     - Pin 6: RST (input)
     - Pin 7: DIO0 (output)
   
   - Right side (power):
     - Pin 1: GND (power input)
     - Pin 8: 3.3V (power input)

3. **Add Labels**:
   - Component name: `RFM95W`
   - Reference: `U?`
   - Add pin names

4. **Save Symbol**

### Step 3: Create Device

1. **Open Symbol Editor**:
   ```
   Tools → Symbol Editor
   File → New Device
   ```

2. **Link Symbol and Footprint**:
   - Add `RFM95W` symbol
   - Add `RFM95W_Module` footprint
   - Map pins: Pin 1 → Pad 1, etc.

3. **Add Properties**:
   - Value: `RFM95W`
   - Datasheet: Link to RFM95W datasheet
   - Manufacturer: `HopeRF`

4. **Save Device**

### Step 4: Use in Schematic

1. **Place Component**:
   - Add `RFM95W` device to schematic
   - Connect pins to ESP32-S3

2. **Connections**:
   ```
   RFM95W          ESP32-S3
   --------        --------
   MOSI    →       GPIO 11 (MOSI)
   MISO    →       GPIO 13 (MISO)
   SCK     →       GPIO 12 (SCK)
   NSS     →       GPIO 10 (CS)
   RST     →       GPIO 9 (RST)
   DIO0    →       GPIO 2 (DIO0)
   3.3V    →       AP22802 OUT
   GND     →       GND
   ```

### Step 5: PCB Layout

1. **Place Components**:
   - Place RFM95W on left side
   - Place ESP32-S3 in center
   - Place AP22802 near RFM95W power pin

2. **Route Traces**:
   - **SPI Traces**:
     - Width: 0.2mm
     - Spacing: 0.2mm
     - Length: Keep as short as possible
     - Route on top layer
   
   - **Power Traces**:
     - Width: 0.5mm (for 3.3V)
     - Use ground plane on bottom layer
   
   - **RF Antenna Trace**:
     - Width: Calculate for 50Ω impedance
     - Formula: Use KiCad's impedance calculator
     - For 1.6mm FR4, 0.2mm trace ≈ 50Ω
     - Keep away from other traces

3. **Ground Plane**:
   - Add ground plane on bottom layer
   - **Exception**: Keep area under RFM95W antenna clear (no ground)

4. **Decoupling Capacitors**:
   - Place 10µF and 100nF close to RFM95W VCC pin
   - Route with short traces

5. **Design Rules**:
   - Minimum trace width: 0.15mm
   - Minimum spacing: 0.15mm
   - Via size: 0.5mm drill, 1.0mm pad

---

## Eagle Design

### Step 1: Create Package

1. **Open Library Editor**:
   ```
   Library → Package → New
   Name: RFM95W_MODULE
   ```

2. **Create Pads**:
   - Use `PAD` tool
   - **Settings**:
     - Shape: `Round` or `Square`
     - Size: 1.5mm × 1.5mm
     - Drill: 0.8mm (if through-hole)

3. **Place Pads**:
   - Use same coordinates as KiCad
   - Name pads: 1, 2, 3, 4, 5, 6, 7, 8

4. **Add Silkscreen**:
   - Use `WIRE` tool on `tPlace` layer
   - Draw 16mm × 16mm rectangle
   - Add pin 1 indicator

5. **Add Courtyard**:
   - Draw on `tKeepout` layer
   - 18mm × 18mm rectangle

### Step 2: Create Symbol

1. **Create Symbol**:
   ```
   Library → Symbol → New
   Name: RFM95W
   ```

2. **Add Pins**:
   - Use `PIN` tool
   - Place 8 pins (left and right sides)
   - Name: GND, MOSI, MISO, SCK, NSS, RST, DIO0, 3.3V

3. **Add Labels**:
   - Component name
   - Pin names

### Step 3: Create Device

1. **Create Device**:
   ```
   Library → Device → New
   Name: RFM95W
   ```

2. **Link Symbol and Package**:
   - Add `RFM95W` symbol
   - Add `RFM95W_MODULE` package
   - Map pins to pads

3. **Save Device**

### Step 4: Use in Schematic & Board

- Similar workflow to KiCad
- Use `ROUTE` tool for traces
- Use `POLYGON` for ground planes

---

## Altium Designer

### Step 1: Create Footprint

1. **Open PCB Library**:
   ```
   File → New → Library → PCB Library
   ```

2. **Create Pads**:
   - Place → Pad
   - **Properties**:
     - Designator: 1-8
     - Layer: Top Layer (SMD) or Multi-Layer (through-hole)
     - Size: 1.5mm × 1.5mm
     - Hole Size: 0.8mm (if through-hole)

3. **Place Pads**:
   - Use same coordinates as KiCad
   - Use `Edit → Paste Special` for precise placement

4. **Add Silkscreen**:
   - Place → Line (on Top Overlay)
   - Draw 16mm × 16mm rectangle

5. **Add Courtyard**:
   - Place → Keepout → Region (on Keep-Out Layer)
   - 18mm × 18mm rectangle

### Step 2: Create Schematic Symbol

1. **Open Schematic Library**:
   ```
   File → New → Library → Schematic Library
   ```

2. **Create Symbol**:
   - Place → Pin
   - Add 8 pins with names
   - Draw component outline

### Step 3: Create Component

1. **Component Wizard**:
   - Tools → Component Wizard
   - Link symbol and footprint
   - Map pins

2. **Add 3D Model** (Optional):
   - Place → 3D Body
   - Import STEP file or create simple 16mm × 16mm × 3mm box

---

## RF Design Considerations

### Impedance Matching

- **Antenna Trace**: Must be 50Ω impedance
- **Calculation**:
  - Use online calculator or CAD tool
  - For 1.6mm FR4, 0.2mm trace width ≈ 50Ω
  - Adjust based on stackup

### Ground Plane

- **Keep antenna area clear**: No ground plane under RFM95W antenna section
- **Add ground plane**: Everywhere else for shielding
- **Via stitching**: Add vias around RF section for better grounding

### Component Placement

- **Keep SPI traces short**: < 5cm
- **Place decoupling caps close**: Within 2mm of VCC pin
- **Separate digital and RF**: Keep digital traces away from RF section

---

## Manufacturing Notes

### Gerber Files

Include these layers:
- **Top Copper** (F.Cu)
- **Bottom Copper** (B.Cu)
- **Top Solder Mask** (F.Mask)
- **Bottom Solder Mask** (B.Mask)
- **Top Silkscreen** (F.SilkS)
- **Bottom Silkscreen** (B.SilkS)
- **Drill File** (.drl)
- **Pick & Place** (.pos)

### Assembly Notes

- **Solder Paste**: Use stencil for SMD pads
- **Reflow Profile**: Standard lead-free profile
- **Component Orientation**: Pin 1 indicator must match

---

## 3D Model Integration

### Creating 3D Model

1. **Simple Box Model**:
   - 16mm × 16mm × 3mm
   - Add SMA connector (if applicable): 8.2mm diameter, 4mm height

2. **Import STEP File**:
   - Download RFM95W 3D model from manufacturer
   - Import into CAD tool
   - Align with footprint

3. **Use in CAD**:
   - Attach 3D model to footprint
   - Use for clearance checking
   - Generate 3D view for case design

---

## Testing Checklist

- [ ] Footprint matches physical module
- [ ] Pin mapping is correct
- [ ] Schematic connections verified
- [ ] PCB layout has proper spacing
- [ ] RF trace impedance calculated
- [ ] Ground plane properly designed
- [ ] Decoupling capacitors placed
- [ ] Gerber files generated
- [ ] 3D model integrated (optional)

---

*For antenna size alternatives, see [Antenna Options Guide](../build-journey/02a_solder_rfm95w_pcb.md#antenna-size-considerations)*

