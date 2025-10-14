# LoRax: A keychain-sized LoRa system for remote scans

**LoRax** is a dual-device LoRa-based penetration testing tool inspired by the Fox-Jack foundation:
- **Endpoint**: Luckfox Pico Max (256MB) runs Nmap/ARP via 915MHz LoRa
- **Controller**: TTGO LoRa32 with OLED sends commands
- **Security**: Secure HMAC packets, tactile buttons, 500mAh LiPo (~2-3d)
- **Hardware**: Includes AutoCAD STLs/STEP, Arduino/Luckfox firmware
- **Goal**: Build your stealthy network tool!

## Project Structure

```
LoRax/
├── pcb/
│   ├── A_endpoint/          # Slim, discrete device for network scanning
│   ├── B_controller/        # Fun, expandable remote controller
│   └── reference/           # Fox-Jack reference design files
├── firmware/
│   ├── endpoint/            # Luckfox Pico Max firmware
│   └── controller/          # TTGO LoRa32 Arduino sketches
├── enclosures/              # 3D printed case designs
└── docs/                    # Documentation and guides
```

## Quick Start

1. **Hardware**: Order components (~$135 from Adafruit/Amazon)
2. **Firmware**: Flash Arduino sketches to TTGO, build Luckfox image
3. **Assembly**: 3D print enclosures, solder components
4. **Usage**: Pair devices, send scan commands via LoRa

## Features

- **Discrete Operation**: Keychain-sized endpoint for stealthy deployment
- **Remote Control**: OLED interface with tactile feedback
- **Network Scanning**: Nmap, ARP, and custom network tools
- **Secure Communication**: HMAC-authenticated LoRa packets
- **Power Efficient**: 2-3 day battery life with 500mAh LiPo
- **Expandable**: Modular design for future enhancements

## Fox-Jack Integration

**Built on KaliAssistant's Fox-Jack – core SDK and mode system.**

This project integrates the complete [Fox-Jack](https://github.com/KaliAssistant/Fox-Jack) repository as a submodule, providing access to:

### 📁 **Fox-Jack Components Available**
- **`fox-jack/`** - Complete Fox-Jack repository (submodule)
- **`build.sh.foxjack`** - Original Fox-Jack build script
- **`dep.sh.foxjack`** - Original Fox-Jack dependency script  
- **`src.foxjack/`** - Fox-Jack source code and drivers
- **`enclosures/fox-jack-reference/`** - Original Fox-Jack 3D models

### 🔧 **Key Fox-Jack Files**
- **Build System**: Docker-based Luckfox SDK build environment
- **Source Code**: Battery management, LED control, mode switching
- **PCB Design**: Complete KiCad project files and Gerbers
- **3D Models**: Original Fox-Jack enclosure STL files

### 📋 **Attribution**
Special thanks to KaliAssistant for the open-source foundation and explicit permission to remix with proper attribution.

## License

This project builds upon the Fox-Jack foundation with appropriate attribution. See individual file headers for specific licensing details.

## Contributing

We welcome contributions! Please see our contributing guidelines and ensure proper attribution is maintained for any Fox-Jack derived components.

---

*LoRax - LoRa-based Penetration Testing Tool*
*Inspired by Fox-Jack by KaliAssistant*
