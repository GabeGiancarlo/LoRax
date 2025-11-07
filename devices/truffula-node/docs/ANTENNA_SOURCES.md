# Antenna Sourcing Guide

## Overview

This guide helps you find compatible 915MHz antennas for the RFM95W module used in the Truffula Node.

---

## Required Specifications

### For RFM95W Module

- **Frequency**: 915MHz (North America) or 868MHz (Europe)
- **Connector**: SMA male (connects to RFM95W's SMA female connector)
- **Impedance**: 50Ω
- **Gain Options**:
  - **5dBi** (recommended): ~12cm length, ~2km range
  - **10dBi** (optional): ~19cm length, ~3km range

---

## Where to Buy

### 1. **Amazon**

**Search Terms**:
- "915MHz SMA antenna 5dBi"
- "915MHz LoRa antenna SMA"
- "Meshtastic antenna 915MHz"
- "RFM95W antenna"

**What to Look For**:
- ✅ SMA male connector (screws into RFM95W)
- ✅ 915MHz frequency (or 900-930MHz range)
- ✅ 50Ω impedance
- ✅ 5dBi or 10dBi gain
- ❌ Avoid: 2.4GHz, 5GHz, or other frequencies

**Example Products** (verify availability):
- Generic 915MHz SMA whip antennas
- LoRa/LoRaWAN compatible antennas
- Meshtastic community-recommended antennas

---

### 2. **DigiKey / Mouser**

**Search Terms**:
- "915MHz antenna SMA"
- "ISM band antenna 915MHz"

**Manufacturers to Look For**:
- **Taoglas**: Professional-grade antennas
- **Pulse Electronics**: RF antennas
- **Linx Technologies**: ISM band antennas
- **Antenova**: Compact antennas

**Part Number Examples** (verify current availability):
- Search by frequency: 915MHz
- Filter by connector: SMA
- Filter by gain: 5dBi or 10dBi

---

### 3. **Adafruit / SparkFun**

**Adafruit**:
- Search: "915MHz antenna" or "LoRa antenna"
- May have u.FL connectors (need adapter to SMA)

**SparkFun**:
- Search: "915MHz antenna" or "ISM antenna"
- Often have SMA-compatible options

---

### 4. **Specialty RF Suppliers**

**Companies**:
- **The Antenna Company**
- **L-com** (l-com.com)
- **RF Solutions**
- **Antenna Factor**

**Note**: These may be more expensive but offer professional-grade options.

---

## Alternative: Make Your Own Wire Antenna

### Quarter-Wave Monopole

**Specifications**:
- **Length**: ~82mm (3.2 inches) for 915MHz
- **Material**: Solid or stranded wire (22-24 AWG)
- **Connection**: Solder directly to RFM95W antenna pad (if no SMA connector)

**Formula**:
```
Length (mm) = (300,000,000 / Frequency (Hz)) / 4
For 915MHz: 300,000,000 / 915,000,000 / 4 = 0.082m = 82mm
```

**Performance**:
- Gain: ~0-2dBi (lower than commercial antennas)
- Range: ~500m-1km (less than 5dBi antenna)
- **Pros**: Free, simple, works
- **Cons**: Lower gain, requires careful tuning

---

## Connector Types

### RFM95W Module

Most RFM95W modules come with:
- **SMA female connector** (internal threads)
- Requires **SMA male antenna** (external threads)

### Alternative: u.FL Connector

Some RFM95W modules have:
- **u.FL/IPEX connector** (tiny surface-mount)
- Requires **u.FL to SMA pigtail** cable
- Then attach SMA antenna to pigtail

---

## Verification Checklist

Before purchasing, verify:

- [ ] **Frequency**: 915MHz (or 900-930MHz range)
- [ ] **Connector**: SMA male (screws into RFM95W)
- [ ] **Impedance**: 50Ω
- [ ] **Gain**: 5dBi (recommended) or 10dBi (optional)
- [ ] **Length**: ~12cm (5dBi) or ~19cm (10dBi)
- [ ] **Reviews**: Check user reviews for RFM95W/LoRa compatibility

---

## Common Mistakes to Avoid

❌ **Wrong Frequency**: 2.4GHz, 5GHz, or other ISM bands won't work  
❌ **Wrong Connector**: RP-SMA (reverse polarity) won't fit standard SMA  
❌ **Wrong Impedance**: 75Ω antennas (TV/Cable) won't work well  
❌ **Too Short**: Very short antennas (<5cm) may have poor performance  
❌ **No Antenna**: **Never power on RFM95W without antenna!** Will damage module.

---

## Recommended Antenna Types

### 1. **Whip Antenna** (Recommended)

- Flexible wire with SMA connector
- 5dBi: ~12cm, good for keychain-sized device
- 10dBi: ~19cm, better range but larger

### 2. **Rubber Duck Antenna**

- Flexible rubber-coated whip
- Similar performance to whip
- More durable for outdoor use

### 3. **Helical/Spring Antenna**

- Coiled design, more compact
- 2-3dBi gain typically
- Good for space-constrained designs

### 4. **PCB Antenna** (Advanced)

- Printed directly on PCB
- Requires RF design expertise
- Most compact, but lower gain (~2-3dBi)

---

## Testing Your Antenna

After purchasing:

1. **Visual Check**:
   - SMA connector threads properly
   - Antenna length matches specs

2. **Range Test**:
   - Test with another LoRa device
   - Compare RSSI (signal strength)
   - Verify range matches expected (2km for 5dBi, 3km for 10dBi)

3. **SWR Check** (if you have equipment):
   - Should be < 2:1 for good performance
   - Higher SWR = poor match = reduced range

---

## Community Resources

### Meshtastic Community

The Meshtastic community uses similar antennas:
- Check Meshtastic forums/discord for recommendations
- Many users share tested antenna options
- Community-verified Amazon links may be available

### LoRaWAN Communities

- The Things Network forums
- Reddit: r/LoRa, r/meshtastic
- Often have antenna recommendations

---

## Budget Options

### Low Cost (< $10)

- Generic 915MHz SMA whip antennas (Amazon)
- DIY wire antenna (free, but lower performance)

### Mid Range ($10-20)

- Branded 5dBi whip antennas
- Better quality, verified specs

### High End ($20+)

- Professional RF antennas (DigiKey/Mouser)
- Higher quality, better performance
- May have certifications (FCC, etc.)

---

*Last updated: Check product availability before purchasing. Antenna availability changes frequently.*

