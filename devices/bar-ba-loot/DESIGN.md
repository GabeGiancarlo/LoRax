# Bar-ba-loot — Technical Design Document

> Comprehensive technical specifications, architecture, and design considerations for the premium handheld command & control device

---

## Table of Contents

- [Overview](#overview)
- [System Architecture](#system-architecture)
- [Hardware Design](#hardware-design)
- [Mechanical Design](#mechanical-design)
- [Thermal Management](#thermal-management)
- [Power Management](#power-management)
- [RF & Antenna Design](#rf--antenna-design)
- [Software Architecture](#software-architecture)
- [Security Considerations](#security-considerations)
- [Testing & Validation](#testing--validation)

---

## Overview

The Bar-ba-loot is designed as a **premium, phone-sized handheld computer** that bridges the gap between maker projects and commercial field devices. It combines:

- **Industrial-grade compute**: Variscite VAR-SOM-MX8M-Plus SoM
- **High-resolution display**: 6.8" bar-format touchscreen
- **Rugged enclosure**: IP67 waterproof, CNC aluminum
- **Extended runtime**: 4000mAh battery with efficient power management
- **Professional UX**: Smooth 60fps UI, offline capable, AI-accelerated

### Design Goals

| Goal | Target | Rationale |
|------|--------|-----------|
| **Form Factor** | ≤155mm × 70mm × 14mm | Phone-sized, pocketable |
| **Processing Power** | Smartphone-level CPU + NPU | Local AI, data analysis |
| **Display Quality** | High-res bar format, 60fps | Professional UX |
| **Durability** | IP67, -10°C to +60°C | Field-ready reliability |
| **Battery Life** | 8-12 hours active | Full day of operation |
| **Build Quality** | Industrial-grade, no "maker" feel | Professional device |

---

## System Architecture

### Block Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Bar-ba-loot Device                        │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │        6.8" Bar Display (480×1280)                  │   │
│  │        Capacitive Touch Overlay                     │   │
│  │        MIPI DSI Interface                           │   │
│  └─────────────────────────────────────────────────────┘   │
│                          │                                    │
│                          ▼                                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │    Variscite VAR-SOM-MX8M-Plus                      │   │
│  │    • Quad-core Cortex-A53 @ 1.8GHz                  │   │
│  │    • NPU (~2.3 TOPS)                                │   │
│  │    • 4-8GB LPDDR4                                    │   │
│  │    • 64-128GB eMMC                                   │   │
│  │    • Wi-Fi 802.11ac, BLE 5.0                        │   │
│  │    • PMIC, USB-C, MIPI DSI, GPIO                    │   │
│  └─────────────────────────────────────────────────────┘   │
│         │              │              │                       │
│         ▼              ▼              ▼                       │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐                │
│  │  LoRa    │   │  Battery │   │  USB-C   │                │
│  │  Module  │   │  Mgmt    │   │  Port    │                │
│  │(RFM95W)  │   │  Circuit │   │ (IP68)   │                │
│  └──────────┘   └──────────┘   └──────────┘                │
│         │              │                                       │
│         ▼              ▼                                       │
│  ┌──────────┐   ┌──────────┐                                 │
│  │ 915MHz   │   │ 4000mAh  │                                 │
│  │ Antenna  │   │ Li-ion   │                                 │
│  └──────────┘   └──────────┘                                 │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Optional: Feather S3 Coprocessor                   │   │
│  │  • BLE beacon, wake controller                      │   │
│  │  • Sensor hub (IMU, temp)                          │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Component Stack

| Layer | Component | Thickness | Notes |
|-------|-----------|-----------|-------|
| **Top** | Laminated P-CAP touch glass | 1.1-1.5mm | Gorilla Glass, black mask |
| | 6.8" LCD panel | 2-3mm | IPS TFT, MIPI DSI |
| | Display driver board | 5-10mm | MIPI DSI to SoM |
| **Middle** | Variscite SoM | 4mm | 67×50mm footprint |
| | Carrier board | 1.6mm | Custom PCB, phone-sized |
| | Thermal pad | 0.5-1mm | 2-3 W/mK conductivity |
| **Bottom** | Battery pack | 4-5mm | 4000mAh flat cell |
| | Feather S3 (optional) | 2mm | Coprocessor module |
| **Enclosure** | Aluminum chassis | 1-2mm | Heat spreader, structural |

**Total Stack Height**: ~14-16mm (excluding enclosure walls)

---

## Hardware Design

### Variscite VAR-SOM-MX8M-Plus Specifications

#### Processor
- **CPU**: 4× ARM Cortex-A53 @ up to 1.8 GHz
- **NPU**: Neural Processing Unit (~2.3 TOPS)
- **Co-processor**: 1× ARM Cortex-M7 @ 800 MHz
- **GPU**: Vivante GC7000UL
  - OpenGL ES 3.1, Vulkan 1.1
  - 16 GFLOPS compute
  - Hardware video decode/encode

#### Memory & Storage
- **RAM**: 4GB or 8GB LPDDR4 (soldered)
- **Storage**: 64GB or 128GB eMMC 5.1 (soldered)
- **External**: Optional microSD slot (via carrier board)

#### Connectivity
- **Wi-Fi**: 802.11ac (2.4/5 GHz), integrated
- **Bluetooth**: BLE 5.0, integrated
- **Ethernet**: Gigabit (via carrier board)
- **USB**: USB 3.0 host, USB-C (via carrier board)
- **PCIe**: Gen 3.0 (for 4G/5G modem option)

#### Display Interfaces
- **MIPI DSI**: 4-lane, up to 1080p60 (native)
- **HDMI**: 2.0 (via carrier board, fallback)
- **LVDS**: Optional (legacy displays)

#### Power
- **Input**: 5V via USB-C or PMIC
- **Power Draw**: 2-6W typical (idle to full load)
- **PMIC**: Integrated on SoM

#### Physical
- **Form Factor**: 67mm × 50mm
- **Connector**: 314-pin SO-DIMM (0.8mm pitch)
- **Height**: ~4mm (excluding connector)

### Carrier Board Requirements

The custom carrier board must provide:

1. **SoM Interface**
   - 314-pin SO-DIMM connector (0.8mm pitch)
   - Power regulation (5V input, multiple rails)
   - Signal routing (MIPI DSI, USB, GPIO, etc.)

2. **Display Interface**
   - MIPI DSI connector (4-lane)
   - Backlight power supply
   - Touch controller interface (I²C/USB)

3. **Power Management**
   - Battery management IC (BQ series or similar)
   - USB-C PD controller
   - Power path switching (battery vs. USB)
   - Charging circuit (1-2A)

4. **LoRa Module**
   - RFM95W/SX1276 SPI interface
   - Antenna connector (SMA/IPEX)
   - RF matching network

5. **I/O Connectors**
   - USB-C port (data + charging, IP68-rated)
   - Optional: microSD slot
   - Optional: debug UART header

6. **Thermal Management**
   - Thermal vias under SoM
   - Thermal pad mounting area
   - Heat spreader connection points

### Display Integration

#### Display Specifications
- **Size**: 6.8" diagonal
- **Resolution**: 480×1280 (portrait bar format)
- **Aspect Ratio**: ~2.67:1 (long, narrow)
- **Technology**: IPS TFT
- **Interface**: MIPI DSI (preferred) or HDMI
- **Brightness**: 400-500 nits (outdoor visibility)
- **Viewing Angle**: 170°+ (IPS)

#### Touch Integration
- **Technology**: Capacitive (P-CAP)
- **Controller**: FT5316 or similar (USB HID or I²C)
- **Overlay**: Laminated glass (1.1-1.5mm)
- **Multi-touch**: 5-10 point support

#### Display Driver Options

**Option 1: Native MIPI DSI** (Recommended)
- Direct connection to SoM MIPI DSI interface
- Lower latency, better power efficiency
- Requires display with native MIPI DSI

**Option 2: HDMI Driver Board** (Fallback)
- Display with HDMI driver board
- More flexible, easier to source
- Slightly higher power, additional board space

### LoRa Radio Integration

#### RFM95W Module
- **Frequency**: 915MHz (US), 868MHz (EU)
- **Interface**: SPI (4-wire)
- **Power**: 3.3V, ~120mA TX, ~10mA RX
- **Range**: 1.2km+ line-of-sight
- **Modulation**: LoRa (SF7-SF12)

#### Antenna Design
- **Type**: 915MHz monopole or ceramic
- **Gain**: 2-3 dBi
- **Connector**: SMA or IPEX (internal)
- **Placement**: Critical for RF performance in metal enclosure
- **Considerations**: 
  - Metal enclosure blocks RF — antenna must be external or in non-metallic window
  - Consider plastic/polycarbonate top section for antenna
  - Or use external antenna with IP68-rated connector

---

## Mechanical Design

### Enclosure Design

#### Form Factor
- **Target Dimensions**: 155mm × 70mm × 14mm
- **Weight**: 200-250g (with battery)
- **Aspect Ratio**: ~2.2:1 (matches display)

#### Material Options

**Option 1: CNC Aluminum** (Recommended)
- **Pros**: Excellent thermal conductivity, premium feel, durability
- **Cons**: More expensive, harder to machine, RF blocking
- **Finish**: Anodized (black, gray, or custom color)
- **Thickness**: 1-2mm walls, internal mounting features

**Option 2: High-Impact Polycarbonate**
- **Pros**: Easier to prototype, RF-transparent, impact resistant
- **Cons**: Lower thermal conductivity, less premium feel
- **Finish**: Textured or smooth, can be painted
- **Thickness**: 2-3mm walls for structural integrity

**Option 3: Hybrid (Aluminum + Polycarbonate)**
- **Pros**: Best of both worlds — thermal + RF
- **Cons**: More complex design, assembly challenges
- **Design**: Aluminum bottom/back (thermal), polycarbonate top (RF window)

#### Waterproofing Strategy

**IP67 Requirements:**
- **Ingress Protection**: Dust-tight, water-resistant to 1m for 30 minutes
- **Sealing Methods**:
  1. **Gaskets**: Silicone O-rings or custom-cut gaskets
  2. **Bonding**: Optical adhesive for display glass
  3. **Sealed Connectors**: IP68-rated USB-C connector
  4. **Conformal Coating**: PCB protection (optional)

**Sealing Points:**
- Front glass to chassis (optical adhesive)
- Back cover to chassis (gasket)
- USB-C port (IP68 connector with gasket)
- Antenna connector (if external, IP68-rated)

#### Internal Layout

```
┌─────────────────────────────────────┐
│  [Glass Front Panel]               │
│  ┌───────────────────────────────┐ │
│  │  6.8" Display + Touch         │ │
│  └───────────────────────────────┘ │
├─────────────────────────────────────┤
│  [Internal Components]              │
│  ┌──────────┐  ┌──────────────┐   │
│  │ Display  │  │ Variscite    │   │
│  │ Driver   │  │ SoM          │   │
│  └──────────┘  └──────────────┘   │
│  ┌──────────┐  ┌──────────────┐   │
│  │ LoRa     │  │ Carrier      │   │
│  │ Module   │  │ Board        │   │
│  └──────────┘  └──────────────┘   │
│  ┌──────────────────────────────┐  │
│  │ 4000mAh Battery Pack          │  │
│  └──────────────────────────────┘  │
├─────────────────────────────────────┤
│  [Back Cover]                       │
│  [USB-C Port] [Antenna]             │
└─────────────────────────────────────┘
```

### Mounting Strategy

1. **SoM Mounting**
   - SO-DIMM connector on carrier board
   - Thermal pad between SoM and chassis
   - Standoffs for clearance

2. **Display Mounting**
   - Adhesive mounting to front glass
   - Flex cable routing to carrier board
   - Backlight driver board placement

3. **Battery Mounting**
   - Adhesive pad or bracket
   - Protection from sharp edges
   - Easy replacement access

4. **Carrier Board Mounting**
   - Standoffs to chassis
   - Ground connection for RF
   - Thermal vias to chassis

---

## Thermal Management

### Heat Sources

| Component | Power Draw | Heat Generation |
|-----------|------------|----------------|
| **SoM (idle)** | 2W | Low |
| **SoM (full load)** | 6W | High |
| **Display** | 1-2W | Medium |
| **LoRa TX** | 0.4W | Low |
| **Battery charging** | 5-10W | Medium |

**Total Heat**: Up to ~8W under full load

### Cooling Strategy

**Passive Cooling** (Primary)
- Thermal pad (2-3 W/mK) from SoM to aluminum chassis
- Chassis acts as heat spreader
- Natural convection to ambient

**Thermal Path:**
```
SoM → Thermal Pad → Carrier Board (vias) → Chassis → Ambient
```

**Design Considerations:**
- Thermal pad thickness: 0.5-1mm (compressible)
- Thermal pad area: Match SoM footprint
- Chassis surface area: Maximize for convection
- Ventilation: No vents (IP67), rely on conduction

**Active Cooling** (If Needed)
- Small fan (5V, 0.5W) — only if passive insufficient
- Requires venting (compromises IP67)
- Not recommended unless absolutely necessary

### Temperature Limits

| Component | Operating Range | Notes |
|-----------|----------------|-------|
| **SoM** | -40°C to +85°C | Industrial grade |
| **Battery** | 0°C to +45°C | Charging: 10°C to +45°C |
| **Display** | -20°C to +70°C | Typical LCD range |
| **Device (ambient)** | -10°C to +60°C | Target operating range |

**Thermal Validation:**
- Test under full CPU/GPU load
- Measure SoM temperature (should stay <80°C)
- Measure chassis temperature (should be safe to touch <50°C)
- Test in worst-case ambient (60°C)

---

## Power Management

### Power Budget

| Mode | SoM | Display | LoRa | Other | Total | Runtime (4000mAh) |
|------|-----|---------|------|-------|-------|-------------------|
| **Idle** | 0.4A | 0.1A | 0.01A | 0.05A | 0.56A | ~7 hours |
| **Active (UI)** | 0.8A | 0.2A | 0.01A | 0.05A | 1.06A | ~3.8 hours |
| **Full Load** | 1.2A | 0.2A | 0.12A | 0.05A | 1.57A | ~2.5 hours |
| **Standby** | 0.01A | 0A | 0.01A | 0.01A | 0.03A | ~133 hours |

**Note**: Battery capacity derated to ~3500mAh usable (safety margin, aging)

### Power Management Features

1. **Dynamic Voltage/Frequency Scaling (DVFS)**
   - SoM automatically scales CPU frequency based on load
   - Reduces power when idle

2. **Display Backlight Control**
   - Automatic brightness adjustment
   - Dimming in low-light conditions
   - Screen-off timeout

3. **Deep Sleep Mode**
   - SoM enters suspend (S3 state)
   - LoRa module in sleep mode
   - Wake-on-LoRa or wake-on-touch
   - Feather S3 can handle wake events

4. **Battery Management**
   - Fuel gauge (battery level monitoring)
   - Low battery warning (<20%)
   - Critical battery shutdown (<5%)
   - Thermal protection during charging

### Charging

- **Input**: USB-C PD (18W recommended)
- **Charging Current**: 1-2A (C/2 to C rate)
- **Charging Time**: ~2-3 hours (0-100%)
- **Charging Temperature**: 10°C to 45°C
- **Protection**: Over-voltage, over-current, thermal

---

## RF & Antenna Design

### LoRa Radio

**Frequency Selection:**
- **915MHz** (US, Canada, Australia)
- **868MHz** (EU, UK)
- **433MHz** (Asia, some regions)

**Regulatory Compliance:**
- FCC Part 15 (US)
- CE marking (EU)
- Verify regional requirements

### Antenna Design Challenges

**Problem**: Metal enclosure blocks RF signals

**Solutions:**

1. **External Antenna** (Recommended)
   - IP68-rated SMA connector
   - External whip antenna (2-3 dBi)
   - Waterproof connector seal
   - **Pros**: Best RF performance
   - **Cons**: Less compact, connector protrusion

2. **RF Window** (Alternative)
   - Non-metallic section in enclosure (polycarbonate)
   - Internal antenna (ceramic or PCB)
   - **Pros**: Compact, no external parts
   - **Cons**: Lower gain, design complexity

3. **Hybrid Enclosure**
   - Aluminum bottom/back (thermal)
   - Polycarbonate top (RF window)
   - Internal antenna in top section
   - **Pros**: Balance of thermal and RF
   - **Cons**: More complex design

### Antenna Placement

- **Keepaway**: Minimum 5mm from metal
- **Ground plane**: Antenna needs reference plane
- **Impedance matching**: 50Ω matching network
- **VSWR**: Target <2:1 across operating band

---

## Software Architecture

### Operating System Options

**Option 1: Linux (Yocto/Buildroot)** (Recommended)
- **Pros**: Full control, lightweight, custom UI
- **Cons**: More development effort
- **UI Framework**: Qt/QML or GTK
- **Boot Time**: <10 seconds

**Option 2: Android 13**
- **Pros**: Rich UI framework, app ecosystem
- **Cons**: Higher overhead, longer boot
- **UI Framework**: Native Android
- **Boot Time**: 20-30 seconds

### Software Stack

```
┌─────────────────────────────────────┐
│  Application Layer                  │
│  • Command & Control UI             │
│  • Scan Configuration               │
│  • Data Visualization               │
│  • Mesh Management                  │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  Framework Layer                    │
│  • Qt/QML or Android Framework      │
│  • LoRa Mesh SDK                    │
│  • Crypto Library (HMAC, AES)       │
│  • AI Inference Engine (NPU)        │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  OS Layer (Linux/Android)           │
│  • Kernel (Linux 5.x)               │
│  • Device Drivers                   │
│  • Power Management                 │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  Hardware Layer                     │
│  • Variscite SoM                    │
│  • Display, Touch, LoRa, Battery    │
└─────────────────────────────────────┘
```

### Key Software Components

1. **Touch UI Application**
   - Main interface for device control
   - Scan configuration and execution
   - Results display and analysis
   - Mesh topology visualization

2. **LoRa Mesh Stack**
   - Packet routing and forwarding
   - HMAC authentication
   - AES-256-GCM encryption
   - Mesh discovery and maintenance

3. **Power Management Daemon**
   - CPU frequency scaling
   - Display backlight control
   - Deep sleep/wake management
   - Battery monitoring

4. **AI Inference Engine** (Optional)
   - NPU-accelerated data analysis
   - Pattern recognition
   - Anomaly detection

---

## Security Considerations

### Hardware Security

- **TPM 2.0**: Secure element for key storage (if available on SoM)
- **Secure Boot**: U-Boot with verified boot chain
- **Encrypted Storage**: eMMC encryption (optional)

### Software Security

- **HMAC Authentication**: All LoRa packets signed
- **AES-256-GCM Encryption**: End-to-end payload encryption
- **Key Management**: Secure key storage, rotation
- **OTA Updates**: Signed firmware updates via LoRa or USB

### Physical Security

- **Tamper Detection**: Optional (enclosure sensors)
- **Secure Erase**: Factory reset capability
- **Lock Screen**: PIN/password protection

---

## Testing & Validation

### Hardware Testing

1. **Functional Testing**
   - [ ] SoM boot and initialization
   - [ ] Display and touch functionality
   - [ ] LoRa communication (range test)
   - [ ] Battery charging and fuel gauge
   - [ ] USB-C data and charging
   - [ ] Wi-Fi and Bluetooth

2. **Environmental Testing**
   - [ ] Temperature cycling (-10°C to +60°C)
   - [ ] IP67 water ingress test (1m, 30min)
   - [ ] Drop test (1m onto concrete)
   - [ ] Vibration test (field conditions)

3. **Thermal Testing**
   - [ ] Full load temperature measurement
   - [ ] Thermal throttling validation
   - [ ] Chassis temperature (touch safety)
   - [ ] Battery temperature during charging

4. **RF Testing**
   - [ ] LoRa range test (1.2km+ target)
   - [ ] Antenna VSWR measurement
   - [ ] Regulatory compliance (FCC/CE)

### Software Testing

1. **Unit Tests**
   - LoRa mesh protocol
   - Crypto functions
   - UI components

2. **Integration Tests**
   - End-to-end command flow
   - Mesh routing
   - Power management

3. **Performance Tests**
   - UI responsiveness (60fps target)
   - Boot time (<10s target)
   - Battery life (8-12h active target)

---

## Design Validation Checklist

Before finalizing design, verify:

- [ ] All components fit within 155×70×14mm envelope
- [ ] Thermal path from SoM to chassis is viable
- [ ] Antenna placement doesn't conflict with metal
- [ ] Battery capacity meets runtime requirements
- [ ] IP67 sealing design is manufacturable
- [ ] USB-C connector is IP68-rated
- [ ] Display and touch are compatible
- [ ] Carrier board routing is feasible
- [ ] Cost is within budget
- [ ] Long-term component availability

---

## Future Enhancements

- **5G Modem**: Add 5G connectivity via PCIe
- **Enhanced Sensors**: IMU, environmental sensors
- **Extended Battery**: 5000mAh+ options
- **Modular Expansion**: PCIe slot for future modules
- **Wireless Charging**: Qi-compatible charging base

---

*This design document is a living document and will be updated as the design evolves.*

