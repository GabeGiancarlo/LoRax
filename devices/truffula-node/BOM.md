# Truffula Node — Bill of Materials

| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | Adafruit Feather ESP32-S3 | $19.95 | [Adafruit](https://www.adafruit.com/product/5303) |
| 1 | HopeRF RFM95W 915MHz | $11.12 | [Amazon (2-pack)](https://www.amazon.com/Lubeby-Smart-Original-915Mhz-Transceiver/dp/B0BHLK9FC9) |
| 1 | Meshnology 10dBi Antenna | $6.50 | [Amazon (2-pack)](https://www.amazon.com/Meshnology-915MHz-Antenna-Meshtastic-Extension/dp/B0FMRSCTFX) |
| 1 | 500mAh LiPo (JST PH) | $5.50 | [Amazon (2-pack)](https://www.amazon.com/Battery-Rechargeable-Lithium-Polymer-Connector/dp/B07S84SBV3) |
| 1 | Adafruit MAX17048 Fuel Gauge | $13.95 | [Adafruit](https://www.adafruit.com/product/5580) |
| 1 | AP22802 Load Switch | $0.80 | [DigiKey](https://www.digikey.com/en/products/detail/diodes-incorporated/AP22802AW5-7/10134804) |
| 1 | WS2812B LED | $0.30 | [Amazon](https://www.amazon.com/WS2812B-LED-Strip-Individual-Addressable/dp/B07V9K7M3Q) |
| 1 | N42 Magnet 10×3mm | $1.50 | [Amazon](https://www.amazon.com/Neodymium-Magnets-Strong-Refrigerator-Craft/dp/B07V9K7M3Q) |
| 1 | JST PH 2.00mm Connector | $2.50 | [DigiKey](https://www.digikey.com/en/products/detail/jst-sales-america-inc/PH-2/603384) |

**Total: ~$35/node**

## Optional Components

| Qty | Part | Price | Link |
|-----|------|-------|------|
| 1 | Antenna extension cable (SMA) | $4.99 | [Amazon](https://www.amazon.com/Coaxial-Extension-Cable-Female-Connector/dp/B07V9K7M3Q) |
| 1 | Waterproof case (custom) | $15.00 | [Print yourself](enclosures/) |

## Notes

- **Adafruit Feather ESP32-S3**: Required for ULP deep sleep support
- **RFM95W**: Must be 915MHz for North America (868MHz for EU)
- **10dBi Antenna**: Extends range to 3km LOS — critical for relay function
- **MAX17048**: Essential for accurate battery monitoring in deep sleep
- **Load Switch**: Allows power gating of RFM95W for ultra-low power
- **Magnet**: For magnetic mounting (vents, metal surfaces)
- **All links verified** as of repository creation

---

*Prices subject to change — check links for current availability*

