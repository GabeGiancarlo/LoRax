# PCB Component Placement Guide

## Overview

This guide explains the correct placement of components on the Truffula Node carrier PCB. The **RFM95W module does NOT plug directly into the ESP32-S3 Feather** - they are separate modules that connect via SPI traces on the carrier board.

---

## Key Concept: Separate Modules, Connected via Traces

### ❌ **WRONG**: RFM95W Plugged Into ESP32-S3

```
[RFM95W Module]
     ↓ (plugged in)
[ESP32-S3 Feather]
```

**This won't work!** The headers don't line up because they're not meant to connect directly.

### ✅ **CORRECT**: Both Modules on Carrier PCB

```
[RFM95W Module] ← Soldered to carrier PCB
     ↓ (SPI traces)
[Carrier PCB]
     ↑ (pin headers)
[ESP32-S3 Feather] ← Plugs into carrier PCB
```

**This is correct!** Both modules are placed on the carrier PCB and connected via traces.

---

## Component Placement on Carrier PCB

### 1. **ESP32-S3 Feather** (Center)

**Placement**:
- **Location**: Center of carrier board
- **Connection**: Plugs into pin headers (JP1, JP3) on carrier board
- **Headers**: Two sets of pin headers on carrier board
  - **JP1**: 16-pin header (one side of Feather)
  - **JP3**: 12-pin header (other side of Feather)

**In CAD**:
- Place pin headers (JP1, JP3) on carrier board
- Feather plugs into these headers (not shown in CAD, but physically plugs in)
- Feather's USB-C port is accessible (on Feather itself, not carrier)

---

### 2. **RFM95W Module** (Left Side)

**Placement**:
- **Location**: Left side of carrier board
- **Connection**: Soldered directly to carrier PCB (SMD pads or through-hole)
- **Orientation**: SMA connector accessible (for antenna connection)

**In CAD**:
- Place RFM95W footprint on carrier board (left side)
- **NOT** on top of ESP32-S3 Feather
- **NOT** plugged into ESP32-S3 headers
- Separate component, placed on carrier PCB

**Footprint**:
- 8 pads (2×4 grid)
- 2.54mm pitch
- 16mm × 16mm module size

---

### 3. **Connection Method: SPI Traces**

The RFM95W and ESP32-S3 connect via **SPI traces** on the carrier PCB:

```
RFM95W Pin    →    Carrier PCB Trace    →    ESP32-S3 Pin
----------------------------------------------------------
MOSI (Pin 2)  →    SPI trace            →    GPIO 11 (MOSI)
MISO (Pin 3)  →    SPI trace            →    GPIO 13 (MISO)
SCK (Pin 4)   →    SPI trace            →    GPIO 12 (SCK)
NSS (Pin 5)   →    SPI trace            →    GPIO 10 (CS)
RST (Pin 6)   →    SPI trace            →    GPIO 9 (RST)
DIO0 (Pin 7)  →    SPI trace            →    GPIO 2 (DIO0)
3.3V (Pin 8)  →    Power trace          →    3.3V (via AP22802)
GND (Pin 1)   →    Ground plane         →    GND
```

**In CAD**:
- Draw traces from RFM95W pads to ESP32-S3 header pins
- Use 0.2mm trace width for SPI signals
- Keep traces short (< 5cm)
- Route on top layer

---

## Correct CAD Layout

### Top View of Carrier PCB

```
┌─────────────────────────────────────┐
│                                     │
│  [RFM95W]    [Carrier PCB]         │
│     ↓              ↑                │
│  (soldered)   (pin headers)        │
│     ↓              ↑                │
│  [SPI traces]  [ESP32-S3 Feather]  │
│     ↓              ↑                │
│  (traces)     (plugs in)            │
│                                     │
│  [MAX17048]   [AP22802]            │
│                                     │
│  [JST PH Battery Connector]        │
│                                     │
└─────────────────────────────────────┘
```

### Side View (Stacked)

```
        [ESP32-S3 Feather]
              ↑
        (pin headers)
              ↑
        [Carrier PCB]
        ┌─────────────┐
        │             │
        │ [RFM95W]    │ ← Soldered to carrier
        │ [MAX17048]  │
        │ [AP22802]   │
        │             │
        └─────────────┘
```

---

## Step-by-Step CAD Placement

### 1. **Place Pin Headers for ESP32-S3**

**In CAD**:
- Place **JP1** (16-pin header) on carrier board
- Place **JP3** (12-pin header) on carrier board
- Position them where Feather will plug in (center of board)
- These are **through-hole pads** on carrier board

**Physical Reality**:
- Feather plugs into these headers
- Feather sits **above** the carrier board
- Feather's USB-C port is accessible

---

### 2. **Place RFM95W Footprint**

**In CAD**:
- Place **RFM95W footprint** on carrier board (left side)
- **NOT** on top of ESP32-S3 headers
- **NOT** overlapping with Feather position
- Separate component, placed on carrier PCB

**Footprint Details**:
- 8 pads (2×4 grid)
- 2.54mm pitch
- 16mm × 16mm module outline
- Pin 1 (GND) marked

---

### 3. **Route SPI Traces**

**In CAD**:
- Draw traces from RFM95W pads to ESP32-S3 header pins
- **MOSI**: RFM95W Pin 2 → ESP32-S3 GPIO 11 (MOSI)
- **MISO**: RFM95W Pin 3 → ESP32-S3 GPIO 13 (MISO)
- **SCK**: RFM95W Pin 4 → ESP32-S3 GPIO 12 (SCK)
- **CS**: RFM95W Pin 5 → ESP32-S3 GPIO 10 (CS)
- **RST**: RFM95W Pin 6 → ESP32-S3 GPIO 9 (RST)
- **DIO0**: RFM95W Pin 7 → ESP32-S3 GPIO 2 (DIO0)

**Trace Specifications**:
- Width: 0.2mm
- Spacing: 0.2mm between traces
- Length: Keep as short as possible
- Route on top layer

---

### 4. **Route Power Traces**

**In CAD**:
- **3.3V**: RFM95W Pin 8 → AP22802 OUT → ESP32-S3 3.3V
- **GND**: RFM95W Pin 1 → Ground plane → ESP32-S3 GND

**Power Trace Specifications**:
- Width: 0.5mm (for 3.3V)
- Use ground plane on bottom layer
- Place decoupling capacitors near RFM95W VCC pin

---

## Common Mistakes

### ❌ **Mistake 1**: Trying to Plug RFM95W Into ESP32-S3

**Problem**: Headers don't line up because they're not meant to connect directly.

**Solution**: Place RFM95W on carrier board separately, connect via traces.

---

### ❌ **Mistake 2**: Placing RFM95W on Top of ESP32-S3

**Problem**: RFM95W overlaps with Feather position, causing interference.

**Solution**: Place RFM95W on left side of carrier board, separate from Feather.

---

### ❌ **Mistake 3**: Not Routing SPI Traces

**Problem**: RFM95W and ESP32-S3 have no connection.

**Solution**: Route SPI traces from RFM95W pads to ESP32-S3 header pins.

---

### ❌ **Mistake 4**: Wrong Pin Mapping

**Problem**: Connecting wrong pins (e.g., MOSI to MISO).

**Solution**: Follow pin mapping table (see above).

---

## Verification Checklist

Before finalizing PCB design:

- [ ] RFM95W footprint placed on carrier board (left side)
- [ ] ESP32-S3 pin headers placed (JP1, JP3) on carrier board (center)
- [ ] RFM95W **NOT** overlapping with Feather position
- [ ] SPI traces routed from RFM95W to ESP32-S3 header pins
- [ ] Power traces routed (3.3V via AP22802, GND to ground plane)
- [ ] Decoupling capacitors placed near RFM95W VCC pin
- [ ] Ground plane added (except under RFM95W antenna area)
- [ ] All traces verified (no wrong connections)

---

## Physical Assembly

### Step 1: Solder RFM95W to Carrier PCB

- Solder RFM95W module to carrier board pads
- Use SMD pads or through-hole headers
- Verify all 8 pins are soldered

### Step 2: Solder Other Components

- Solder MAX17048, AP22802, etc. to carrier board
- Solder pin headers (JP1, JP3) to carrier board

### Step 3: Plug in ESP32-S3 Feather

- Plug Feather ESP32-S3 into pin headers (JP1, JP3)
- Feather sits above carrier board
- Feather's USB-C port is accessible

### Step 4: Connect Antenna

- Attach antenna to RFM95W's SMA connector
- **Never power on without antenna!**

---

## Summary

**Key Points**:
1. ✅ RFM95W and ESP32-S3 are **separate modules**
2. ✅ Both are placed on the **carrier PCB**
3. ✅ They connect via **SPI traces** (not direct plug-in)
4. ✅ RFM95W is **soldered** to carrier board
5. ✅ ESP32-S3 **plugs into** pin headers on carrier board

**In CAD**:
- Place RFM95W footprint on carrier board (left side)
- Place ESP32-S3 pin headers on carrier board (center)
- Route SPI traces between them
- **Don't** try to plug RFM95W into ESP32-S3!

---

*For more details on RFM95W footprint creation, see [RFM95W_CAD_GUIDE.md](RFM95W_CAD_GUIDE.md)*

