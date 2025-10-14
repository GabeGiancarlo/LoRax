# LoRax Credits & Attribution

## Primary Attribution

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

This project is a remix and evolution of the excellent [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) by KaliAssistant, created with explicit permission for remix and attribution.

## Fox-Jack Components Used

The following components from Fox-Jack have been adapted for LoRax:

### Build System & SDK
- **build.sh**: Core build script framework
- **dep.sh**: Dependency management system  
- **SDK Integration**: Luckfox development environment setup

### System Framework
- **rootfs/rcS**: System startup and initialization logic
- **Mode System**: Modular task framework for device operations
- **Service Management**: Background service handling

### PCB Design
- **Component Selection**: Reference design files and part libraries
- **Layout Concepts**: Extension board design principles
- **Reference Files**: Original Fox-Jack PCB assets in `pcb/reference/`

## Permission & License

This remix is created with explicit written permission from KaliAssistant, as documented in email correspondence. The permission includes:

- Remix and build upon Fox-Jack
- Maintain proper attribution in README and file headers
- Include acknowledgment of reused components
- Preserve attribution on files that originate from Fox-Jack

## File Headers

All files adapted from Fox-Jack include the attribution header:
```
# Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
```

## Original Fox-Jack

- **Repository**: https://github.com/KaliAssistant/Fox-Jack
- **Creator**: KaliAssistant
- **License**: [Original Fox-Jack License]
- **Purpose**: Extension board for penetration testing tools

## LoRax Evolution

LoRax extends Fox-Jack with:
- **Dual-device architecture**: Endpoint + Controller
- **LoRa communication**: 915MHz wireless command/control
- **Network scanning**: Nmap, ARP, and custom tools
- **Stealth operation**: Keychain-sized discrete deployment
- **Power efficiency**: 2-3 day battery life

## Contact

For questions about attribution, licensing, or the relationship between LoRax and Fox-Jack, please contact the LoRax project maintainers.

---

*LoRax Credits - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
