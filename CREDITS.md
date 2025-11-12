# LoRax Credits & Attribution

## Primary Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

This project is a remix and evolution of the excellent [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) by KaliAssistant, created with explicit permission for remix and attribution.

---

## Fox-Jack Components Used

The following components from Fox-Jack have been adapted for LoRax:

### Build System & SDK

- **build.sh**: LoRax build script (adapts Fox-Jack build framework)
- **dep.sh**: LoRax dependency management (adapts Fox-Jack dependency system)
- **SDK Integration**: Luckfox development environment setup

### System Framework

- **rootfs/rcS**: System startup and initialization logic
- **Mode System**: Modular task framework for device operations
- **Service Management**: Background service handling

### PCB Design

- **Component Selection**: Reference design files and part libraries
- **Layout Concepts**: Extension board design principles
- **Reference Files**: Original Fox-Jack PCB assets in `shared/reference/`

---

## Fox-Jack Reference Files

The following files are preserved for reference and attribution:

### Reference Scripts

- **`shared/build/build.sh.foxjack`**: Original Fox-Jack build script (GNU GPL v3)
- **`shared/build/dep.sh.foxjack`**: Original Fox-Jack dependency script (GNU GPL v3)

### Reference Repository

- **`devices/oncler/fox-jack-reference/`**: Complete Fox-Jack repository (GNU GPL v3)
  - Source code: `fox-jack-reference/src/` (battery management, LED control, mode switching)
  - PCB files: `fox-jack-reference/pcb/` (KiCad projects and Gerbers)
  - 3D models: `fox-jack-reference/3dp/` (enclosure STL files)
  - Build system: `fox-jack-reference/build.sh`, `fox-jack-reference/dep.sh`
  
  **Note**: Located in the Oncler device folder since Oncler is built on the Fox-Jack foundation (same hardware platform - Luckfox Pico Max).

### Reference Assets

- **`shared/reference/fox-jack-reference/`**: Fox-Jack 3D models for reference
- **`shared/reference/`**: Fox-Jack PCB reference files

---

## Permission & License

This remix is created with explicit written permission from KaliAssistant, as documented in email correspondence. The permission includes:

- Remix and build upon Fox-Jack
- Maintain proper attribution in README and file headers
- Include acknowledgment of reused components
- Preserve attribution on files that originate from Fox-Jack

---

## File Headers

All files adapted from Fox-Jack include the attribution header:

```
// Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
```

---

## Original Fox-Jack

- **Repository**: https://github.com/KaliAssistant/Fox-Jack
- **Creator**: KaliAssistant
- **License**: GNU GPL v3
- **Purpose**: Extension board for penetration testing tools

---

## LoRax Evolution

LoRax extends Fox-Jack with:

- **Multi-device architecture**: Lorax (endpoint) + Bar-ba-loot (controller) + Truffula Node (relay)
- **LoRa communication**: 915MHz wireless command/control with mesh relay
- **Network scanning**: Nmap, ARP, and custom tools
- **Stealth operation**: Keychain-sized discrete deployment
- **Extended range**: Multi-hop mesh networking via Truffula Nodes
- **Power efficiency**: 2-3 day battery life (endpoints/controller), 20+ days (relay)

---

## Contributors

### LoRax Project Maintainers

- **GabeGiancarlo**: Project creator, repository restructuring, ecosystem expansion

### Acknowledgments

- **KaliAssistant**: Original Fox-Jack foundation and permission for remix
- **Luckfox Technology**: Hardware platform and SDK support
- **LoRa Alliance**: LoRaWAN specification and reference designs

---

## Contact

For questions about attribution, licensing, or the relationship between LoRax and Fox-Jack, please contact the LoRax project maintainers via GitHub Issues.

---

*LoRax Credits - LoRa-based Penetration Testing Ecosystem*  
*Inspired by Fox-Jack by KaliAssistant*
