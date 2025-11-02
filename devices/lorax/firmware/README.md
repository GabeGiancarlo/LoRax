# LoRax Firmware

This directory contains the firmware for both LoRax devices.

## Structure

- `endpoint/` - Luckfox Pico Max firmware (C/C++, build system)
- `controller/` - TTGO LoRa32 Arduino sketches (C++)

## Development

### Endpoint Firmware
- Based on Luckfox SDK
- Network scanning tools (Nmap, ARP)
- LoRa communication stack
- Battery management and telemetry

### Controller Firmware  
- Arduino-based for TTGO LoRa32
- OLED display interface
- Tactile button handling
- LoRa command transmission

## Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

The endpoint firmware builds upon the Fox-Jack SDK and mode framework, with appropriate attribution maintained in individual source files.

---

*LoRax Firmware - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
