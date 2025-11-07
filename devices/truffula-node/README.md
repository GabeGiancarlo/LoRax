# Truffula Node — LoRa Mesh Relay

> *"Unless someone like you cares a whole awful lot, nothing is going to get better. It's not."*  
> — The Lorax

<div align="center">

![Truffula Tree](shared/media/images/reference/Truffla-tree-1.jpeg)
*The Truffula trees — extending the network, one hop at a time*

</div>

The **Truffula Node** is a **drop-and-forget LoRa relay** that extends your LoRax network by **3km per hop**.

---

## What It Is

A **keychain-sized, 20+ day battery, 10dBi antenna relay** that:

- Forwards HMAC-secured packets
- Auto-joins mesh via HELLO broadcasts
- Logs RSSI, battery, hop count
- Survives in trees, vents, under cars

---

## Why You Need It

| Problem | Truffula Node Solution |
|---------|--------------------|
| 500m urban range | **3km/hop** → 6km with 2 nodes |
| Dead zones | Drop in path → auto-routes |
| Battery anxiety | **25 days** on 500mAh |

---

## How It Works

1. **Wake** every 10s (ULP coprocessor)
2. **RX window** (100ms) → listen for LoRa
3. **Validate HMAC** → drop fakes
4. **Increment hop count** → forward
5. **Deep sleep** → 25µA average

> **Security**: Hop-by-hop HMAC, E2E AES-256 payload.

---

## Hardware

| Spec | Value |
|------|-------|
| MCU | Adafruit Feather ESP32-S3 |
| Radio | RFM95W 915MHz LoRa |
| Antenna | 19cm pop-out 10dBi |
| Size | 58×23×9mm |
| Weight | 14g |
| Battery | 500mAh LiPo |
| Runtime | 20–25 days |

---

## Firmware

The Truffula Node runs **Arduino-based firmware** with:

- **Mesh relay**: Auto-forwarding, hop count tracking
- **Deep sleep**: ULP wake, 25µA average draw
- **Battery monitoring**: MAX17048 fuel gauge
- **Status LED**: WS2812B for deployment feedback

---

## See Also

- [BOM.md](BOM.md) — Buy links
- [pcb/](pcb/) — KiCad design (Feather + RFM95W + MAX17048)
- [firmware/](firmware/) — Arduino mesh relay code
- [enclosures/](enclosures/) — 3D print files
- [build-journey/](build-journey/) — Step-by-step guide

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

