# Truffula Node Connector Guide

## Overview

This guide explains which connectors are **required** vs **optional** for the Truffula Node carrier PCB.

---

## Required Connectors

### 1. **Pin Headers for ESP32-S3 Feather** ✅ REQUIRED

**Purpose**: Connect the Adafruit Feather ESP32-S3 to the carrier board

**Configuration**:
- **Two sets of pin headers** (top edge of carrier board)
- **JP1**: 16-pin header (one side of Feather)
- **JP3**: 12-pin header (other side of Feather)
- **Total**: 28 pins (matches Feather footprint)

**Why needed**: 
- The Feather plugs into these headers
- Provides power, SPI, I2C, GPIO connections
- **Cannot be removed** - this is how the ESP32-S3 connects

**Alternative**: If designing a custom PCB (not using Feather), you'd solder the ESP32-S3 directly instead.

---

### 2. **JST PH Battery Connector** ✅ REQUIRED

**Purpose**: Connect the 500mAh LiPo battery

**Configuration**:
- **X1**: JST PH 2.00mm connector (2-pin)
- **Location**: Bottom edge of carrier board
- **Pins**: Red (VBAT+), Black (GND)

**Why needed**:
- Powers the entire system
- Required for battery operation
- **Cannot be removed** - no battery = no power

---

## Optional/Redundant Connectors

### 3. **USB-C Connector on Carrier Board** ❌ NOT NEEDED

**Why redundant**:
- The **Feather ESP32-S3 already has USB-C** built-in
- Feather's USB-C provides:
  - Programming/debugging
  - Power input (when battery not connected)
  - Serial communication
- Adding another USB-C on the carrier is **redundant**

**Recommendation**: **Remove it** to save space and cost

---

### 4. **Micro-USB or Additional USB Connector** ❌ NOT NEEDED

**Why redundant**:
- Same reason as USB-C above
- Feather already has USB-C
- Multiple USB connectors serve no purpose

**Recommendation**: **Remove it** to save space and cost

---

## Summary

| Connector | Required? | Purpose | Can Remove? |
|-----------|-----------|---------|-------------|
| **Pin Headers (JP1, JP3)** | ✅ YES | Connect Feather ESP32-S3 | ❌ NO |
| **JST PH Battery (X1)** | ✅ YES | Connect battery | ❌ NO |
| **USB-C on Carrier** | ❌ NO | Redundant (Feather has USB-C) | ✅ YES |
| **Micro-USB on Carrier** | ❌ NO | Redundant (Feather has USB-C) | ✅ YES |

---

## Recommended Carrier PCB Design

### Minimal Design (Recommended)

**Connectors**:
1. ✅ **Pin headers** for Feather ESP32-S3 (JP1, JP3)
2. ✅ **JST PH connector** for battery (X1)
3. ❌ **No USB connectors** (use Feather's built-in USB-C)

**Benefits**:
- Smaller PCB footprint
- Lower cost (fewer components)
- Simpler design
- Less chance of confusion

### How to Use

1. **Programming**: Use Feather's USB-C port (on Feather board itself)
2. **Power**: 
   - Via Feather's USB-C (for development)
   - Via battery connector (for deployment)
3. **Battery**: Connect via JST PH connector on carrier board

---

## Design Notes

### If You Remove USB Connectors

**What to keep**:
- Pin headers (JP1, JP3) - **required**
- JST PH battery connector (X1) - **required**
- All supporting components (MAX17048, AP22802, etc.)

**What to remove**:
- USB-C connector on carrier board
- Micro-USB connector on carrier board
- Any USB-related components (if only for carrier USB)

**Note**: The Feather board's USB-C will still work - it's on the Feather itself, not the carrier.

---

## Example: Simplified Carrier Board

```
┌─────────────────────────────┐
│                             │
│  [JP1]  [JP3]  ← Feather    │
│  16-pin  12-pin  headers     │
│                             │
│  [RFM95W]  [MAX17048]       │
│                             │
│  [AP22802]  [WS2812B]       │
│                             │
│  [X1] ← JST PH Battery      │
│                             │
└─────────────────────────────┘

NO USB connectors on carrier!
(Use Feather's built-in USB-C)
```

---

## FAQ

**Q: Can I program the ESP32-S3 without USB on the carrier?**  
A: Yes! Use the Feather's built-in USB-C port. The Feather plugs into the carrier, but its USB-C port is still accessible.

**Q: What if I want to charge the battery via USB?**  
A: The Feather ESP32-S3 has a built-in battery charger. Connect battery to carrier's JST PH connector, and power Feather via its USB-C. The Feather will charge the battery.

**Q: Do I need any connectors for RFM95W?**  
A: No external connectors needed. RFM95W connects via SPI traces on the PCB. The antenna connects directly to RFM95W's SMA connector (on the RFM95W module itself).

**Q: What about the MAX17048?**  
A: No connector needed - it's soldered directly to the PCB and connects via I2C traces.

---

*For more details on PCB design, see [RFM95W_CAD_GUIDE.md](RFM95W_CAD_GUIDE.md)*

