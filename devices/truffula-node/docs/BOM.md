# Truffula Node — Bill of Materials

## Core Components (Both Versions)

| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | Adafruit Feather ESP32-S3 | $19.95 | [Adafruit](https://www.adafruit.com/product/5303) |
| 1 | HopeRF RFM95W 915MHz | $11.12 | [Amazon (2-pack)](https://www.amazon.com/Lubeby-Smart-Original-915Mhz-Transceiver/dp/B0BHLK9FC9) |
| 1 | 915MHz 5dBi SMA Antenna (recommended) | $6-10 | See notes below |
| 1 | 915MHz 10dBi SMA Antenna (optional, larger) | $7-12 | See notes below |
| 1 | Adafruit MAX17048 Fuel Gauge | $13.95 | [Adafruit](https://www.adafruit.com/product/5580) |
| 1 | AP22802 Load Switch | $0.80 | [DigiKey](https://www.digikey.com/en/products/detail/diodes-incorporated/AP22802AW5-7/10134804) |
| 1 | WS2812B LED | $0.30 | [Amazon](https://www.amazon.com/WS2812B-LED-Strip-Individual-Addressable/dp/B07V9K7M3Q) |
| 1 | RAK12500 WisBlock GNSS Location Module | $24.99 | [RAKwireless](https://store.rakwireless.com/products/wisblock-gnss-location-module-rak12500) |
| 1 | RAK18001 WisBlock Buzzer Module | $4.99 | [RAKwireless](https://store.rakwireless.com/products/wisblock-buzzer-module-rak18001) |

## Battery Options

### Slim/Professional Version
| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | 500mAh LiPo (JST PH) | $5.50 | [Amazon (2-pack)](https://www.amazon.com/Battery-Rechargeable-Lithium-Polymer-Connector/dp/B07S84SBV3) |
| 1 | JST PH 2.00mm Connector | $2.50 | [DigiKey](https://www.digikey.com/en/products/detail/jst-sales-america-inc/PH-2/603384) |

### Round/Tree Trunk Version (21700 Battery System)
| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | 21700 Lithium-Ion Cell (5000mAh) | $8-12 | [18650 Battery Store](https://www.18650batterystore.com/collections/21700-batteries) |
| 1 | 21700 Battery Holder | $3-5 | [Amazon](https://www.amazon.com/s?k=21700+battery+holder) |
| 1 | Battery Protection Circuit Module (BMS) | $2-4 | [Amazon](https://www.amazon.com/s?k=21700+bms+protection) |

## Optional Components

| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | Antenna extension cable (SMA) | $4.99 | [Amazon](https://www.amazon.com/Coaxial-Extension-Cable-Female-Connector/dp/B07V9K7M3Q) |
| 1 | N42 Magnet 10×3mm (for slim version) | $1.50 | [Amazon](https://www.amazon.com/Neodymium-Magnets-Strong-Refrigerator-Craft/dp/B07V9K7M3Q) |

**Total (Slim Version): ~$60/node**  
**Total (Round Version): ~$65/node**

## Notes

- **Adafruit Feather ESP32-S3**: Required for ULP deep sleep support
- **RFM95W**: Must be 915MHz for North America (868MHz for EU)
- **5dBi Antenna** (recommended): ~12cm length, ~2km range — good balance of size and range
  - **Specs**: 915MHz, SMA male connector, 5dBi gain, ~12cm whip
  - **Sources**: Search "915MHz SMA antenna 5dBi" on Amazon, DigiKey, or Adafruit
  - **Alternative**: Make quarter-wave wire antenna (~82mm wire)
- **10dBi Antenna** (optional): ~19cm length, ~3km range — best range but larger form factor
  - **Specs**: 915MHz, SMA male connector, 10dBi gain, ~19cm whip
  - **Sources**: Search "915MHz SMA antenna 10dBi" on Amazon, DigiKey, or specialty RF suppliers
- **MAX17048**: Essential for accurate battery monitoring in deep sleep
- **Load Switch**: Allows power gating of RFM95W for ultra-low power
- **RAK12500 GPS Module**: GNSS location module with I2C interface. Connects to Feather via I2C (SDA/SCL pins)
- **RAK18001 Buzzer Module**: Piezo buzzer module with I2C interface. Connects to Feather via I2C (SDA/SCL pins)
- **21700 Battery**: For round version - provides longer runtime (5000mAh vs 500mAh). Requires BMS for protection
- **Magnet**: For magnetic mounting (slim version only)
- **Link verification**: Some links may become unavailable; use search terms provided to find alternatives

---

*Prices subject to change — check links for current availability*

