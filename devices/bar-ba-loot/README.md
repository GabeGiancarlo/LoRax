# Bar-ba-loot — Premium Handheld Command & Control Device

> *"I am the Lorax. I speak for the trees. And the trees are scanning your network."*

<div align="center">

![Bar-ba-loot](../../shared/media/images/reference/barbaloot-book.jpeg)
*Bar-ba-loot — the premium controller with a cart and a horn*

</div>

The **Bar-ba-loot** is a **premium, phone-sized handheld command & control device** that sends scan commands to remote Oncler endpoints via **915MHz LoRa**. Built with industrial-grade components, featuring a high-resolution touchscreen display, waterproof enclosure, and smartphone-level processing power.

---

## What It Is

A **premium handheld computer-class device** with:

- **High-performance ARM SoM** (Variscite VAR-SOM-MX8M-Plus) — quad-core Cortex-A53 + NPU
- **6.8" bar-format touchscreen** (480×1280) — portrait-oriented, capacitive touch
- **Waterproof enclosure** (IP67) — sealed, rugged design
- **Premium build quality** — no "maker board" feel, industrial-grade components
- **Local processing** — handles advanced tasks, AI inference, offline operation
- **915MHz LoRa radio** — mesh communication with Oncler endpoints
- **4000mAh battery** — extended runtime with USB-C charging
- **64-128GB storage** — onboard eMMC for OS and data

---

## Why You Need It

| Problem | Bar-ba-loot Solution |
|---------|----------------------|
| Need direct access | **1.2km+ remote** command via LoRa mesh |
| Limited processing power | **Smartphone-level CPU** with NPU for AI tasks |
| Poor display quality | **High-res bar display** with capacitive touch |
| Not field-ready | **IP67 waterproof** enclosure, rugged design |
| Short battery life | **4000mAh battery** with efficient power management |
| No local storage | **64-128GB eMMC** for offline operation |
| Maker board feel | **Industrial-grade SoM** and premium components |

---

## How It Works

1. **Power on** → Touchscreen UI displays device list and status
2. **Navigate interface** → Capacitive touch gestures, smooth 60fps UI
3. **Select target** → Choose Oncler endpoint from mesh network
4. **Configure scan** → Nmap, ARP, custom payloads with visual editor
5. **Send command** → LoRa transmission with HMAC authentication
6. **Display results** → Real-time visualization, data analysis, export options
7. **Local processing** → AI inference, data correlation, offline analysis

> **Security**: All commands HMAC-signed, responses AES-256 encrypted. TPM 2.0 secure element for key storage.

---

## Hardware Specifications

### Core Compute

| Spec | Value |
|------|-------|
| **SoM** | Variscite VAR-SOM-MX8M-Plus |
| **CPU** | Quad-core ARM Cortex-A53 up to 1.8 GHz |
| **NPU** | Neural Processing Unit (~2.3 TOPS) |
| **Co-processor** | Cortex-M7 real-time processor |
| **GPU** | Vivante GC7000UL (OpenGL ES 3.1, Vulkan) |
| **RAM** | 4-8 GB LPDDR4 |
| **Storage** | 64-128 GB eMMC (industrial-grade) |
| **OS** | Linux (Yocto/Buildroot) or Android 13 |

### Display & Touch

| Spec | Value |
|------|-------|
| **Display** | 6.8" IPS LCD bar format |
| **Resolution** | 480×1280 (portrait) |
| **Touch** | Capacitive (P-CAP) with glass overlay |
| **Interface** | MIPI DSI (native) or HDMI |
| **Lens** | Laminated Gorilla Glass (1.1-1.5mm) |

### Connectivity & Radio

| Spec | Value |
|------|-------|
| **LoRa** | 915MHz RFM95W or SX1276 (mesh communication) |
| **Wi-Fi** | 802.11ac (2.4/5 GHz) built into SoM |
| **Bluetooth** | BLE 5.0 |
| **USB** | USB-C (data + charging) |
| **Optional** | 4G/5G modem via USB/PCIe |

### Power & Battery

| Spec | Value |
|------|-------|
| **Battery** | 4000mAh Li-ion flat pack |
| **Charging** | USB-C PD (Power Delivery) |
| **PMIC** | Integrated power management |
| **Runtime** | 8-12 hours active, days in standby |
| **Thermal** | Passive cooling via aluminum chassis |

### Enclosure

| Spec | Value |
|------|-------|
| **Material** | CNC'd aluminum or high-impact polycarbonate |
| **Ingress Protection** | IP67 (1m submersion, 30 minutes) |
| **Dimensions** | ~155mm × 70mm × 14mm (phone-sized) |
| **Weight** | ~200-250g (with battery) |
| **Sealing** | Silicone gaskets, optical adhesive bonding |

---

## Software & Firmware

The Bar-ba-loot runs **custom Linux-based firmware** (Yocto/Buildroot) or **Android 13**:

- **Touch UI Framework**: Qt/QML or Android native
- **LoRa Stack**: Custom mesh protocol implementation
- **Command Interface**: Visual scan configuration, payload editor
- **Data Visualization**: Real-time results display, charts, export
- **AI Processing**: NPU-accelerated inference for data analysis
- **Power Management**: Advanced sleep modes, wake-on-LoRa

### Building & Flashing

1. **Development Environment**: Yocto Project or Android build system
2. **Toolchain**: ARM cross-compiler, Variscite SDK
3. **Bootloader**: U-Boot with secure boot support
4. **Firmware Update**: OTA via LoRa mesh or USB-C

---

## PCB Design

The Bar-ba-loot requires a **custom carrier board** for the Variscite SoM:

- **SoM connector**: 314-pin SO-DIMM connector
- **Power regulation**: PMIC, battery management, USB-C PD
- **Display interface**: MIPI DSI connector for 6.8" display
- **LoRa module**: RFM95W/SX1276 with antenna connector
- **USB-C port**: Data + charging (IP68-rated connector)
- **Thermal management**: Thermal pads, heat spreader to chassis

KiCad PCB design files will be added when the design is complete.

---

## Enclosures

3D printed or CNC-machined enclosure designs will be added when ready. Design goals:

- **Waterproof sealing**: IP67-rated gaskets and bonding
- **Thermal path**: SoM heat conduction to aluminum chassis
- **Display protection**: Laminated glass with black mask
- **Ergonomic design**: Comfortable grip, balanced weight
- **Professional finish**: Anodized aluminum or textured polycarbonate

**Note**: Enclosure design requires careful thermal and RF engineering. Prototype with eval kit first.

---

## Design Philosophy

The Bar-ba-loot represents a **premium, professional-grade device** that bridges the gap between maker projects and commercial handheld computers. Key design principles:

- **No compromises on quality**: Industrial-grade components, not hobbyist boards
- **Smartphone-level performance**: Modern ARM SoC with NPU, not microcontroller
- **Field-ready reliability**: Waterproof, rugged, long-term availability
- **Professional UX**: Smooth touch interface, responsive UI, offline capable
- **Extensible architecture**: Modular design allows for future upgrades

---

## Getting Started

### Recommended Build Order

1. **Eval Kit Prototyping**: Start with Variscite VAR-SOM-MX8M-Plus eval kit
2. **Display Integration**: Test 6.8" bar display with MIPI DSI
3. **Touch Interface**: Verify capacitive touch overlay
4. **LoRa Integration**: Add RFM95W module and test mesh communication
5. **Power System**: Design battery management and charging circuit
6. **Carrier Board**: Design custom PCB for phone-sized form factor
7. **Enclosure Design**: 3D model, thermal analysis, waterproofing
8. **Firmware Development**: Build Linux/Android image with custom UI
9. **Assembly & Testing**: Final assembly, IP67 testing, field trials

### Parts & Documentation

- [BOM.md](BOM.md) — Complete bill of materials with buy links
- [DESIGN.md](DESIGN.md) — Technical specifications and design considerations
- [`../../shared/sdk/`](../../shared/sdk/) — LoRa mesh SDK and crypto libraries

---

## Performance Expectations

- **CPU Performance**: Equivalent to mid-range Android smartphone
- **AI Inference**: NPU handles real-time data analysis (~2.3 TOPS)
- **UI Responsiveness**: 60fps smooth scrolling, instant touch response
- **Boot Time**: <10 seconds from power-on to UI ready
- **LoRa Range**: 1.2km direct, 8km+ via mesh relays
- **Battery Life**: 8-12 hours active use, days in standby with wake-on-LoRa

---

## Comparison: Old vs. New

| Aspect | Original (ESP32) | Premium (Variscite SoM) |
|--------|------------------|-------------------------|
| **CPU** | Dual-core Xtensa @ 240MHz | Quad-core Cortex-A53 @ 1.8GHz |
| **Display** | 0.96" OLED 128×64 | 6.8" IPS LCD 480×1280 |
| **Input** | Tactile buttons | Capacitive touchscreen |
| **Storage** | External SD card | 64-128GB onboard eMMC |
| **RAM** | 520KB SRAM | 4-8GB LPDDR4 |
| **Processing** | Basic command relay | AI inference, local analysis |
| **Enclosure** | 3D printed case | IP67 waterproof, CNC aluminum |
| **Build Quality** | Maker project | Industrial-grade device |

---

## Future Enhancements

- **5G connectivity**: Add 5G modem for remote operation
- **Enhanced AI**: More NPU-accelerated features for data analysis
- **Extended battery**: 5000mAh+ options for longer runtime
- **Additional sensors**: IMU, environmental sensors for field use
- **Modular expansion**: PCIe slot for future radio modules

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*
