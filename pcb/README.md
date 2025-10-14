# LoRax PCB Organization

This directory contains the PCB component files for the **LoRax** project, organized into two main categories based on the device architecture.

## Project Overview

**LoRax** is a dual-device LoRa-based penetration testing tool inspired by the Fox-Jack foundation:
- **A_endpoint**: Slim, discrete device for network scanning and monitoring
- **B_controller**: Fun, expandable remote controller for command and control

## Directory Structure

```
pcb/
├── A_endpoint/          # Lorax Endpoint (slim/discrete device)
├── B_controller/        # Lorax Remote (fun/expandable controller)
├── reference/           # FOX-JACK reference design files
└── README.md           # This file
```

## Component Organization

### A_endpoint/ (Lorax Endpoint)
**Purpose**: Slim, discrete device (~65x25x8mm) for network scanning and LoRa RX
**Design Goal**: Minimal profile, flat components, keychain-friendly

#### Current Components:
- ✅ `Luckfox Pico Pro_Max.step` - Core board (256MB) for running scans
- ✅ `RFM95W v5.step` - LoRa module (915MHz) with 3dBi U.FL antenna
- ✅ `M2 standoff - 6mm.stl` - Mounting hardware
- ✅ `pololu-1408-mini-slide-switch-1.snapshot.1/` - Power control switch
- ✅ `adafruit-micro-lipo-wmicrousb-jack-usb-liionlipoly-charger-1.snapshot.22/` - Battery charger
- ✅ `Adafruit's 500mah, 3.7V lipo battery. - 2044562/` - Power source

#### Recently Added Components:
- ✅ `5580 MAX17048.step` - Fuel gauge for battery telemetry
- ✅ `915MhHz Air antenna.stp` - Antenna component  
- ✅ `jst-ph-2-00mm-connector-set-1.snapshot.75/` - JST-PH connector for LiPo battery

### B_controller/ (Lorax Remote)
**Purpose**: Fun, expandable controller (~65x30x15mm) for command and control
**Design Goal**: Interactive interface, room for future emulation features

#### Current Components:
- ✅ `ttgo-lora32-t3-v1-6-1-1.snapshot.3 copy/` - Controller board with OLED
- ✅ `kailh-choc-low-profile-switch-1.snapshot.3/` - Tactile buttons (x3)
- ✅ `adafruit-micro-lipo-wmicrousb-jack-usb-liionlipoly-charger-1.snapshot.22/` - Battery charger
- ✅ `Adafruit's 500mah, 3.7V lipo battery. - 2044562/` - Power source

#### Additional Components Needed:
- ❌ Rugged Metal Pushbutton with blue LED ring
- ❌ Adafruit WS2812 LED status indicator
- ❌ Additional Kailh Choc switches for navigation

## Sorting Issues Identified

### Duplicated Components
The following components appear in both folders and need to be resolved:
- `adafruit-micro-lipo-wmicrousb-jack-usb-liionlipoly-charger-1.snapshot.22/`
- `Adafruit's 500mah, 3.7V lipo battery. - 2044562/`

### Recently Sorted Components
The following components have been moved from the original `LoRax/` folder:
- ✅ `5580 MAX17048.step` → Moved to **A_endpoint** (fuel gauge)
- ✅ `915MhHz Air antenna.stp` → Moved to **A_endpoint** (antenna)
- ✅ `jst-ph-2-00mm-connector-set-1.snapshot.75/` → Moved to **A_endpoint** (battery connector)

### Reference Components
The following components have been moved to the `reference/` folder:
- ✅ `FOX-JACK_EXT_BOARD_MID.zip` - Reference design files
- ✅ `FOX-JACK_EXT_BOARD_TOP.zip` - Reference design files

## Completed Actions

1. **✅ Moved Missing Components**:
   ```bash
   # ✅ Moved MAX17048 fuel gauge to endpoint
   mv "LoRax/5580 MAX17048.step" "pcb/A_endpoint/"
   mv "LoRax/5580 MAX17048.step.webloc" "pcb/A_endpoint/"
   
   # ✅ Moved antenna to endpoint
   mv "LoRax/915MhHz Air antenna.stp" "pcb/A_endpoint/"
   
   # ✅ Moved JST connector to endpoint
   mv "LoRax/jst-ph-2-00mm-connector-set-1.snapshot.75/" "pcb/A_endpoint/"
   ```

2. **✅ Resolved Duplicates**:
   - Battery and charger components kept in both folders (both devices need power)
   - Original components preserved with `-original` suffix for reference

3. **✅ Added Reference Folder**:
   - Created `pcb/reference/` for FOX-JACK design files
   - Preserved original design inspiration materials

4. **✅ Removed Original LoRax Folder**:
   - All components successfully sorted and moved
   - Clean project structure with organized PCB components

## Design Specifications

### A_endpoint (Lorax Endpoint)
- **Dimensions**: ~65x25x8mm
- **Profile**: Slim, flat, keychain-friendly
- **Features**: Network scanning (Nmap/ARP), LoRa RX, battery telemetry
- **Antenna**: Hidden U.FL slot for discrete operation

### B_controller (Lorax Remote)
- **Dimensions**: ~65x30x15mm  
- **Profile**: Fun, expandable, FPV antenna cap
- **Features**: Command interface, OLED display, tactile feedback
- **Future**: HID emulation, additional sensors

## Next Steps

1. Complete component sorting
2. Import STL files into CAD software
3. Design enclosure geometry
4. Create assembly documentation
5. Order components (~$135 from Adafruit/Amazon)

## References

- **Fox-Jack Foundation**: Extension board design inspiration
- **Luckfox Pico Max**: [Datasheet](https://www.luckfox.com/luckfox-pico/)
- **TTGO LoRa32**: [Documentation](https://github.com/Xinyuan-LilyGO/TTGO-LoRa-Series)
- **Adafruit Components**: [Product Pages](https://www.adafruit.com/)

---

*Last Updated: $(date)*
*Project: LoRax - LoRa-based Penetration Testing Tool*
