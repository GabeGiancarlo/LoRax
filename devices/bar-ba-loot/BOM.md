# Bar-ba-loot — Bill of Materials

> Premium handheld command & control device — complete component list with buy links

---

## Core Compute Module

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **Variscite VAR-SOM-MX8M-Plus SoM** | Premium SoM core — Quad-core Cortex-A53 @ 1.8GHz, NPU, 4-8GB RAM, 64-128GB eMMC | $58.00 | [Variscite Store](https://shop.variscite.com/product/system-on-module/var-som-mx8m-plus-system-on-module/) |
| 1 | **Variscite VAR-SOM-MX8M-Plus Eval Kit** | Complete eval kit with carrier board, heat-sink, display connectors — **recommended for prototyping** | $269.00 | [Variscite Store](https://shop.variscite.com/product/evaluation-kit/var-som-mx8m-plus-evaluation-kits/) |

**Notes:**
- SoM includes: CPU, GPU, NPU, RAM, eMMC, Wi-Fi, Bluetooth, PMIC
- Eval kit essential for initial development and testing
- SoM uses 314-pin SO-DIMM connector (requires custom carrier board for final design)

---

## Display & Touch

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **6.8" Bar Display 480×1280 with HDMI Driver** | Premium bar-format display with HDMI driver board — IPS TFT, high-res | $54.80 | [YourITech](https://youritech-online.com/products/6-8-inch-bar-display-480x1280-mipi-hdmi-ips-tft-lcd-display-with-hdmi-driver-board) |
| 1 | **6.8" TFT Screen Module 480×1280** | Budget bar display option — good for early prototyping | $9.99 | [CreateXPlay](https://createxplay.com/product/createxplay-6-8-inch-tft-screen-module-4801280/) |
| 1 | **7" Capacitive Touch Panel with Controller** | Capacitive touch overlay with FT5316 controller — USB/I²C interface | $8.36 | [BuyDisplay](https://www.buydisplay.com/7-inch-capacitive-touch-panel-with-controller-ft5316-for-800x480) |

**Notes:**
- Bar format (480×1280) matches phone-sized portrait orientation
- MIPI DSI interface preferred (native to SoM), HDMI driver board as fallback
- Capacitive touch required for premium UX — verify compatibility with display
- Consider laminated glass overlay for waterproof sealing

---

## Power & Battery

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **Li-Po 3.7V 4000mAh Battery Pack** | High-capacity flat Li-ion cell — smartphone form factor | $5.87 | [YDL Battery](https://ydlbattery.com/products/3-7v-2300mah-125054-lithium-polymer-ion-battery) |
| 1 | **USB-C Li-Po Battery Charger Board** | USB-C charger with protection, JST socket, LED indicator, thermal regulation | $10.99 | [Treedix](https://treedix.com/products/treedix-2pcs-type-c-usb-lipo-battery-charger-board-with-battery-protection-jst-socket-with-led-indicator-charging-rate-adjustable-automatic-power-down-thermal-regulation) |
| 1 | **Li-Po Charger Board (DFRobot)** | Alternate charger board option — compact design | $5.90 | [DFRobot](https://www.dfrobot.com/product-2068.html) |

**Notes:**
- 4000mAh provides 8-12 hours active runtime
- USB-C PD (Power Delivery) recommended for faster charging
- Battery protection circuit essential for safety
- Flat pack form factor fits phone-sized enclosure

---

## LoRa Radio Module

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **RFM95W LoRa Module** | 915MHz LoRa transceiver — SPI interface, 1.2km+ range | $12.95 | [Adafruit](https://www.adafruit.com/product/3072) or [SparkFun](https://www.sparkfun.com/products/14464) |
| 1 | **LoRa Antenna (915MHz)** | 915MHz antenna — SMA connector, 3dBi gain | $8.99 | [Adafruit](https://www.adafruit.com/product/3344) |

**Notes:**
- RFM95W (or SX1276) for 915MHz LoRa mesh communication
- SPI interface connects to SoM GPIO
- Antenna placement critical for RF performance in metal enclosure
- Consider ceramic antenna for internal mounting (lower gain but more compact)

---

## Enclosure & Mechanical

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| - | **CNC Aluminum Enclosure** | Custom-machined aluminum chassis — **requires design & fabrication** | $150-300 | Custom quote (e.g., [Protolabs](https://www.protolabs.com/), [SendCutSend](https://sendcutsend.com/)) |
| - | **Polycarbonate Enclosure** | High-impact polycarbonate alternative — **requires design & fabrication** | $80-150 | Custom quote |
| 1 | **IP68 USB-C Connector** | Waterproof USB-C connector — sealing gasket included | $15.99 | [Mouser](https://www.mouser.com/) or [DigiKey](https://www.digikey.com/) |
| 1 | **Thermal Pad (2-3 W/mK)** | Thermal interface material — SoM to chassis heat transfer | $8.99 | [DigiKey](https://www.digikey.com/) |
| 1 | **Silicone Gasket Material** | Waterproof sealing gasket — custom-cut for enclosure | $12.99 | [McMaster-Carr](https://www.mcmaster.com/) |

**Notes:**
- Enclosure design requires 3D modeling (Fusion 360, SolidWorks)
- IP67 rating requires careful gasket design and bonding
- Thermal path from SoM to chassis essential for performance
- Consider professional fabrication for production-quality finish

---

## Optional: Feather S3 Coprocessor

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **Adafruit Feather ESP32-S3** | Low-power coprocessor — BLE beacon, wake controller, sensor hub | $12.95 | [Adafruit](https://www.adafruit.com/product/5477) |

**Notes:**
- Optional: Use as always-on BLE beacon or wake controller
- Reduces standby power by keeping main SoM in deep sleep
- Can handle accelerometer, gyro, temperature sensors
- Connects via I²C or UART to main SoM

---

## Development & Prototyping

| Qty | Part | Description | Price | Link |
|-----|------|-------------|-------|------|
| 1 | **USB-C to USB-A Cable** | Programming and debugging | $9.99 | [Amazon](https://www.amazon.com/) |
| 1 | **MicroSD Card (64GB)** | Optional storage expansion | $12.99 | [Amazon](https://www.amazon.com/) |
| 1 | **Heat Sink (for eval kit)** | Thermal management during development | $8.99 | [DigiKey](https://www.digikey.com/) |

---

## Total Cost Estimate

### Minimum Viable Prototype (Eval Kit Path)
- Variscite Eval Kit: **$269.00**
- Display (budget): **$9.99**
- Touch panel: **$8.36**
- Battery + charger: **$16.86**
- LoRa module: **$21.94**
- **Subtotal: ~$326.15**

### Premium Build (Custom Carrier Board)
- Variscite SoM: **$58.00**
- Premium display: **$54.80**
- Touch panel: **$8.36**
- Battery + charger: **$16.86**
- LoRa module: **$21.94**
- Custom enclosure: **$150-300**
- Custom carrier board (PCB fab): **$50-150**
- **Subtotal: ~$360-560** (plus design/fabrication time)

**Note:** Prices are approximate and subject to change. Custom enclosure and carrier board require significant design and fabrication work.

---

## Component Selection Notes

### Display Selection
- **Premium option**: 6.8" bar display with HDMI driver — better color, brightness
- **Budget option**: 6.8" TFT module — good for prototyping, verify MIPI DSI compatibility
- **Touch**: Separate capacitive overlay or integrated touch (verify compatibility)

### Power Management
- Variscite SoM includes integrated PMIC — may simplify power design
- USB-C PD charger recommended for faster charging (18W+)
- Battery protection circuit essential — never skip this

### Enclosure Considerations
- **Aluminum**: Better thermal performance, more expensive, harder to machine
- **Polycarbonate**: Easier to prototype, good impact resistance, lower thermal conductivity
- **IP67 rating**: Requires careful design — gaskets, bonding, sealed connectors

### Thermal Management
- SoM power draw: 2-6W depending on load
- Passive cooling via thermal pad to aluminum chassis
- May need graphite sheet for heat spreading under display
- Consider active cooling (fan) only if absolutely necessary

---

## Recommended Build Path

1. **Phase 1: Eval Kit Prototyping** ($326)
   - Start with Variscite eval kit
   - Test display and touch integration
   - Verify LoRa communication
   - Develop firmware and UI

2. **Phase 2: Custom Carrier Board** ($200-300)
   - Design phone-sized carrier board
   - Integrate battery management
   - Add LoRa module
   - Test in 3D-printed prototype enclosure

3. **Phase 3: Production Enclosure** ($150-300)
   - Design CNC-machined or injection-molded enclosure
   - IP67 waterproofing
   - Professional finish
   - Final assembly and testing

---

## Supplier Notes

- **Variscite**: Direct from manufacturer — best support, long-term availability
- **Display vendors**: Verify compatibility, shipping times, return policy
- **Battery suppliers**: Use reputable vendors — safety-critical component
- **Enclosure fabrication**: Get quotes from multiple vendors, consider prototyping services

---

## Verification Checklist

Before ordering, verify:
- [ ] Display resolution matches design requirements (480×1280)
- [ ] Touch controller interface (USB/I²C) compatible with SoM
- [ ] Battery capacity and form factor fits enclosure
- [ ] Charger board supports USB-C PD if desired
- [ ] LoRa module frequency matches region (915MHz US, 868MHz EU)
- [ ] Enclosure dimensions accommodate all components
- [ ] Thermal path from SoM to chassis is viable

---

*Prices and availability subject to change — verify all links before ordering. Last updated: 2024*
