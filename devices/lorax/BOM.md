# Lorax — Bill of Materials

> **Note**: The Lorax is built with industrial-grade components. Some components may require custom sourcing or industrial suppliers. This BOM is based on the MorosX IP Mesh Unit specifications.

---

## Core Components

### Single Board Computer (SBC)

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | i.MX 8M Plus SBC | Quad-core, 4GB RAM, 64GB eMMC | USA Manufactured, Industrial grade |
| 1 | USB 3.0 Port | Standard USB 3.0 | Integrated on SBC |
| 1 | mPCIe 3.0 Slot | Mini PCIe 3.0 | For wireless module |
| 1 | 1GB Ethernet Port | Gigabit Ethernet | IP68 4-pin data port connector |

**Note**: The specific SBC model may be a custom or industrial variant. Research i.MX 8M Plus based SBCs from manufacturers like:
- **Variscite**: VAR-SOM-MX8M-PLUS
- **Boundary Devices**: Nitrogen8M Plus
- **Compulab**: Fitlet3 (if compatible)
- **Custom Industrial**: May require direct manufacturer contact

---

### Wireless Radio Module

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | WiFi 6/7 Module | 2.4GHz MU-MIMO 2x2, WPA3, 802.11ax | MCS 12/13 capable (WiFi 7) |
| 1 | LoRa/GPS Module | Parallel LoRa + GPS | Integrated module |
| 2 | WiFi Antennas | Custom TNC male gooseneck | Ruggedized, bend-and-stay |
| 1 | LoRa Antenna | 915MHz (or regional) | SMA/TNC connector |
| 1 | GPS Antenna | Active GPS antenna | U-blox M8 compatible |

**WiFi Module Options**:
- **Intel AX200/AX210**: WiFi 6, may need custom firmware for WiFi 7 features
- **Qualcomm QCN9074**: WiFi 6E/7 capable (may require custom integration)
- **Custom Module**: May be proprietary or require NDA

**LoRa/GPS Module Options**:
- **RAK Wireless RAK3172**: LoRa + GPS combo module
- **Semtech SX1262 + U-blox M8**: Separate modules combined
- **Custom Module**: May be integrated solution

---

### GPS Module

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | U-blox M8 GPS | ZOE-M8 series | Anti-jamming, anti-spoofing |

**U-blox M8 Options**:
- **U-blox ZOE-M8B**: Standalone GPS module
- **U-blox M8N**: Popular variant (may need anti-jamming firmware)
- **U-blox M8Q**: Multi-constellation (GPS, GLONASS, BeiDou, Galileo)

**Sources**:
- [U-blox Official](https://www.u-blox.com/)
- [DigiKey](https://www.digikey.com/) - Search "u-blox M8"
- [Mouser](https://www.mouser.com/) - Search "u-blox M8"

---

### Security Module

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | TPM 2.0 Module | Secure crypto-processor | System security/integrity |

**TPM 2.0 Options**:
- **Infineon SLB9670**: TPM 2.0 SPI module
- **STMicroelectronics ST33**: TPM 2.0 module
- **Nuvoton NPCT750**: TPM 2.0 module

**Sources**:
- [DigiKey](https://www.digikey.com/) - Search "TPM 2.0"
- [Mouser](https://www.mouser.com/) - Search "TPM 2.0"
- May be integrated on SBC

---

### Sensors

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | 3-Axis Accelerometer | I2C/SPI interface | Motion detection, orientation |

**Accelerometer Options**:
- **ADXL345**: 3-axis, I2C/SPI, popular choice
- **LSM6DS3**: 3-axis accelerometer + gyro
- **MPU6050**: 6-axis (accelerometer + gyro)
- May be integrated on SBC

---

### Connectors

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | 6-Pin Hirose Connector | PTT functionality | Conquers digital delay |
| 1 | IP68 4-Pin Data Port | Ethernet connection | Waterproof connector |
| 2 | TNC Male Connectors | Antenna connections | For gooseneck antennas |
| 1 | SMA/TNC Connector | LoRa antenna | 915MHz (or regional) |

**Hirose Connector Options**:
- **Hirose DF13 Series**: 6-pin connector
- **Hirose DF40 Series**: High-density option
- **Custom**: May be specific PTT connector

**IP68 4-Pin Connector Options**:
- **Amphenol IP68 Series**: Waterproof Ethernet connectors
- **TE Connectivity IP68**: Industrial connectors
- **Custom**: May be proprietary design

**Sources**:
- [DigiKey](https://www.digikey.com/) - Search "Hirose DF13" or "IP68 4-pin"
- [Mouser](https://www.mouser.com/) - Search connector types
- [Amphenol](https://www.amphenol.com/)
- [TE Connectivity](https://www.te.com/)

---

### Antennas

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 2 | WiFi Gooseneck Antennas | TNC male, ruggedized | Custom bend-and-stay design |
| 1 | LoRa Antenna | 915MHz (or 868MHz EU) | SMA/TNC connector |
| 1 | GPS Antenna | Active GPS antenna | U-blox M8 compatible |

**Antenna Sources**:
- **Custom**: May require custom manufacturing
- **L-com**: Industrial antennas
- **Taoglas**: GPS and wireless antennas
- **Pulse Electronics**: Industrial antenna solutions

---

### Enclosure & Mechanical

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | Enclosure | Ruggedized, IP-rated | Industrial grade |
| 1 | Mounting Hardware | M3/M4 screws, standoffs | As needed |
| 1 | Thermal Management | Heatsink/fan (if needed) | For SBC cooling |

**Enclosure Options**:
- **Custom Design**: 3D printed or machined
- **Hammond Manufacturing**: Industrial enclosures
- **Polycase**: IP-rated enclosures
- **Bud Industries**: Industrial enclosures

---

### Power Supply

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | Power Adapter | 12V/24V DC input | Industrial power supply |
| 1 | Battery Pack (Optional) | LiPo/LiFePO4 | For portable operation |
| 1 | Power Management | DC-DC converter | 5V/3.3V regulation |

**Power Supply Options**:
- **Mean Well**: Industrial power supplies
- **TDK-Lambda**: Industrial DC-DC converters
- **Custom**: May be integrated on SBC

---

## Optional/Future Components

### Sub-GHz Radio Module (Future)

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | 900-928MHz Module | Sub-GHz radio | User-installable upgrade |

**Sub-GHz Options**:
- **Semtech SX1276**: LoRa sub-GHz
- **Texas Instruments CC1310**: Sub-GHz SoC
- **Custom Module**: May be proprietary

---

### 5GHz Radio Module (Future)

| Qty | Part | Specification | Notes |
|-----|------|--------------|-------|
| 1 | 5GHz WiFi Module | WiFi 6E/7 | User-installable upgrade |

**5GHz Options**:
- **Intel AX210**: WiFi 6E
- **Qualcomm QCN9074**: WiFi 6E/7
- **Custom Module**: May require custom integration

---

## Estimated Costs

> **Note**: Industrial components and custom designs significantly impact pricing. Costs are estimates based on similar components.

| Category | Estimated Cost Range |
|----------|---------------------|
| **SBC (i.MX 8M Plus)** | $200 - $500 |
| **WiFi 6/7 Module** | $50 - $150 |
| **LoRa/GPS Module** | $30 - $80 |
| **TPM 2.0 Module** | $10 - $30 |
| **Connectors** | $20 - $50 |
| **Antennas** | $30 - $100 |
| **Enclosure** | $50 - $200 |
| **Power Supply** | $30 - $100 |
| **Miscellaneous** | $50 - $150 |
| **Total (Estimated)** | **$470 - $1,460** |

**Note**: 
- Custom components may increase costs significantly
- Volume pricing may reduce costs
- Industrial-grade components command premium pricing
- Some components may require NDA or custom manufacturing agreements

---

## Sourcing Notes

### Industrial Suppliers

- **DigiKey**: [www.digikey.com](https://www.digikey.com)
- **Mouser Electronics**: [www.mouser.com](https://www.mouser.com)
- **Newark**: [www.newark.com](https://www.newark.com)
- **Arrow Electronics**: [www.arrow.com](https://www.arrow.com)

### Component Manufacturers

- **NXP Semiconductors**: i.MX 8M Plus processor
- **U-blox**: GPS modules
- **Semtech**: LoRa modules
- **Infineon/STMicro**: TPM modules
- **Intel/Qualcomm**: WiFi modules

### Custom Manufacturing

Some components (antennas, enclosures, integrated modules) may require:
- Custom design and manufacturing
- Minimum order quantities (MOQ)
- Non-disclosure agreements (NDA)
- Long lead times

---

## Assembly Notes

1. **SBC Integration**: Ensure proper thermal management and power regulation
2. **Antenna Placement**: Follow RF design guidelines for optimal performance
3. **IP68 Sealing**: Proper gaskets and sealing for outdoor use
4. **EMI/EMC**: Shielding and filtering for industrial environments
5. **Testing**: Comprehensive RF and environmental testing required

---

## References

- **MorosX IP Mesh Unit**: [https://morosx.com/ols/products/ip-mesh-unit](https://morosx.com/ols/products/ip-mesh-unit)
- **NXP i.MX 8M Plus**: [https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-processors/i-mx-8m-plus-applications-processor-arm-cortex-a53-cortex-m7-i-mx-8m-plus](https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-processors/i-mx-8m-plus-applications-processor-arm-cortex-a53-cortex-m7-i-mx-8m-plus)
- **U-blox M8**: [https://www.u-blox.com/en/product/neo-m8-series](https://www.u-blox.com/en/product/neo-m8-series)

---

*Prices and availability subject to change. Verify all specifications before ordering.*

