# Contributing to LoRax

## Welcome!

Thank you for considering contributing to LoRax! This document provides guidelines for contributing code, documentation, hardware designs, and more.

---

## Code of Conduct

- **Be respectful**: Treat everyone with respect and kindness
- **Be inclusive**: Welcome contributors of all backgrounds
- **Be constructive**: Provide helpful feedback and suggestions
- **Follow attribution**: Maintain proper credit for Fox-Jack foundation

---

## How to Contribute

### Reporting Issues

- **Bug reports**: Include device type, firmware version, steps to reproduce
- **Feature requests**: Describe use case and proposed solution
- **Security issues**: **Do not** create public issue — email maintainers privately

### Pull Requests

1. **Fork** the repository
2. **Create branch**: `git checkout -b feature/your-feature-name`
3. **Make changes**: Follow coding standards (below)
4. **Test**: Verify changes work on your hardware
5. **Commit**: Use clear commit messages
6. **Push**: Push to your fork
7. **Open PR**: Describe changes and link related issues

---

## Coding Standards

### Code Style

- **C/C++**: Follow device-specific style (e.g., ESP-IDF for ESP32, Linux kernel for Luckfox)
- **Python**: PEP 8 (for build scripts)
- **Documentation**: Markdown format, clear and concise

### Attribution

- **Fox-Jack derived code**: Include attribution header:
```c
// Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
```

- **New code**: No attribution header needed (but welcome to credit sources)

### Commit Messages

Use clear, descriptive messages:

```
feat: add Tree Node relay support
fix: correct HMAC validation on hop forwarding
docs: update BOM links for RFM95W
refactor: split crypto functions into separate module
```

---

## Directory Structure

### Adding New Devices

Follow the **identical structure** for every device:

```
devices/
└── your-device/
    ├── README.md          # Device overview
    ├── BOM.md             # Bill of materials with links
    ├── pcb/               # KiCad PCB files
    ├── firmware/          # Device-specific firmware
    ├── enclosures/        # 3D models (STL/STEP)
    └── build-journey/     # Step-by-step build guide
        ├── 01_prepare_parts.md
        ├── 02_solder_pcb.md
        └── ...
```

### Modifying Shared Code

- **SDK**: Update `shared/sdk/` files for changes affecting all devices
- **Docs**: Update `shared/docs/` for ecosystem-wide changes
- **Build tools**: Modify `shared/build/` scripts for build system changes

---

## Hardware Contributions

### PCB Designs

- **KiCad**: Preferred format (.kicad_pcb, .kicad_sch)
- **Component libraries**: Include sources for custom footprints
- **BOM links**: Verify all component links are current
- **Gerber files**: Include for production (optional)

### 3D Models

- **STL files**: Required for printing
- **STEP files**: Preferred for CAD editing
- **Print settings**: Include recommended settings in build-journey
- **Test fit**: Verify parts fit before submission

### Bill of Materials

- **Direct links**: Amazon, Adafruit, DigiKey preferred
- **Verify availability**: Check links before PR
- **Price accuracy**: Update prices periodically (note date in file)
- **Alternatives**: Include compatible alternatives if available

---

## Firmware Contributions

### Device-Specific Firmware

- **Lorax (Luckfox)**: C/C++ with Luckfox SDK
- **Bar-ba-loot (ESP32)**: Arduino framework
- **Tree Node (ESP32-S3)**: Arduino framework with deep sleep

### Shared SDK

- **Header files**: Document all functions with DocC comments
- **Backward compatibility**: Maintain API compatibility when possible
- **Testing**: Include unit tests (when applicable)

### Security

- **No hardcoded keys**: Use configuration files or environment variables
- **Secure defaults**: Strong keys, encryption enabled by default
- **Security review**: Request review for crypto changes

---

## Documentation

### README Files

Every device README should include:

- **What It Is**: Device purpose and capabilities
- **Why You Need It**: Use cases and problems solved
- **How It Works**: Technical overview
- **Hardware**: Specifications table
- **See Also**: Links to BOM, firmware, etc.

### Build Guides

- **Step-by-step**: Numbered, sequential steps
- **Photos**: Include photos of key steps (optional but helpful)
- **Troubleshooting**: Common issues and solutions
- **Verification**: How to verify each step completed correctly

---

## Testing

### Before Submitting

- **Test on hardware**: Verify changes work on actual device
- **Test edge cases**: Empty packets, invalid HMAC, etc.
- **Test mesh**: Multi-hop routing if applicable
- **Check compilation**: All platforms (if shared code)

### Test Coverage

- **Unit tests**: For SDK functions (when applicable)
- **Integration tests**: For mesh routing (when applicable)
- **Hardware tests**: Build and deploy on physical device

---

## License

- **Code**: GPL v3 (see LICENSE)
- **Hardware**: CC-BY-SA 4.0 (schematics, PCB layouts)
- **Documentation**: CC-BY-SA 4.0 (build guides, READMEs)

By contributing, you agree to license your contributions under the same license as the project.

---

## Attribution

### Maintaining Fox-Jack Attribution

- **Derived code**: Always include attribution header
- **Reference files**: Keep Fox-Jack reference files intact
- **CREDITS.md**: Keep Fox-Jack entry accurate and prominent

### New Contributors

- **CREDITS.md**: Add your name if you contribute significant code/hardware
- **Commit messages**: Credit co-authors in commits when applicable

---

## Questions?

- **GitHub Issues**: For general questions
- **Discussions**: For design discussions (if enabled)
- **Email**: For security issues or private questions

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

