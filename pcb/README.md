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

### B_controller/ (Lorax Remote)
**Purpose**: Fun, expandable controller (~65x30x15mm) for command and control
**Design Goal**: Interactive interface, room for future emulation features

## Fox-Jack Reference

This PCB design is inspired by and builds upon the [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) extension board design by KaliAssistant. The reference files in the `reference/` directory contain the original Fox-Jack design files that served as inspiration for the LoRax architecture.

**Attribution**: Built on KaliAssistant's Fox-Jack – core PCB design and component selection.

## References

- **Fox-Jack Foundation**: [Original Extension Board Design](https://github.com/KaliAssistant/Fox-Jack)
- **Luckfox Pico Max**: [Datasheet](https://www.luckfox.com/luckfox-pico/)
- **TTGO LoRa32**: [Documentation](https://github.com/Xinyuan-LilyGO/TTGO-LoRa-Series)
- **Adafruit Components**: [Product Pages](https://www.adafruit.com/)

---

*Last Updated: $(date)*
*Project: LoRax - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
