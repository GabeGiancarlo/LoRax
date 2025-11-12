# Lorax — IP Mesh MANET Radio

> *"I am the Lorax. I speak for the trees."*  
> — The Lorax

<div align="center">

![The Lorax](../../shared/media/images/reference/lorax-movie.avif)
*The Lorax — speaking for network security*

</div>

The **Lorax** is a **professional-grade IP Mesh MANET (Mobile Ad Hoc NETwork) radio** that forms self-organizing, self-healing wireless networks for voice, data, and video communication. Built with industrial-grade components and designed for rugged field deployment.

---

## What It Is

A **MANET radio** is a type of decentralized radio that forms a self-organizing, self-healing wireless network without the need for existing infrastructure, where each radio acts as a node and can function as a router to forward data to any other node. These systems enable robust, reliable communication by dynamically adjusting routing paths to maintain connectivity, even when nodes are added or lost.

The Lorax represents a modern approach to MANET networking, built on 2020s hardware and protocols rather than the 2010-2015 era hardware found in many current production units.

---

## Why You Need It

| Problem | Lorax Solution |
|---------|----------------|
| Outdated hardware (2010-2015) | **Modern i.MX 8M Plus** with 4GB RAM, 64GB storage |
| Limited wireless protocols | **WiFi 6/7 + LoRa/GPS** parallel operation |
| Single points of failure | **Self-healing mesh** automatically reroutes |
| Infrastructure required | **Ad-hoc networking** — no base stations needed |
| Limited temperature range | **Industrial grade** (-40°C to +85°C) |
| Short product lifecycle | **10+ year availability** guarantee |

---

## How It Works

### Self-Organizing and Self-Healing

MANETs can automatically configure and adapt to changes, such as the loss of nodes or the addition of new ones, rerouting data to maintain connectivity.

### Dynamic Routing

Algorithms ensure that data finds the most efficient path to its destination, even if some nodes are unavailable. When a user sends a message or data, it travels from node to node, with routing algorithms dynamically selecting the best path based on network conditions.

### Network Adaptation

If a node becomes unavailable, the network automatically reconfigures to use alternative paths, ensuring continuous communication.

### Robustness

The decentralized nature of MANETs means there are no single points of failure, making the network highly resistant to disruption.

---

## Hardware Specifications

### Single Board Computer (SBC)

| Spec | Value |
|------|-------|
| **Processor** | i.MX 8M Plus Quad-core (USA Manufactured) |
| **RAM** | 4GB |
| **Storage** | 64GB eMMC |
| **GPU** | 16 GFLOPS (high-precision) OpenGL® ES 3.1/3.0, Vulkan®, OpenCL™ 1.2 FP, OpenVG™ 1.1 |
| **3D Graphics** | GC7000UL |
| **2D Graphics** | GC520L |
| **VPU** | 1080p60 h.264 & h.265 decoder, 1080p60 h.264 & h.265 encoder |
| **Temperature Range** | Industrial (-40°C to +85°C) |
| **Availability** | Long-term guarantee (~10+ years) |

### Wireless Radio Module

| Spec | Value |
|------|-------|
| **WiFi** | 2.4GHz MU-MIMO 2x2, WPA3, 802.11ax (WiFi 6) |
| **Modulation** | 1024 QAM Wi-Fi 6, MCS 12 and 13 capable for 4096 QAM WiFi 7 |
| **Data Rate** | Up to 20% higher transmission rates with WiFi 7 modulation |
| **Antennas** | Custom ruggedized TNC male bend and stay gooseneck antennas included |
| **Future Options** | Sub-GHz 900-928MHz and 5GHz radio module options (upgradable) |

### Additional Features

| Feature | Description |
|---------|-------------|
| **LoRa/GPS** | Parallel LoRa/GPS radio module |
| **GPS** | U-blox M8 (ZOE-M8 series) with anti-jamming and anti-spoofing |
| **Security** | TPM 2.0 secure crypto-processor for system security/integrity |
| **Sensors** | 3-axis accelerometer |
| **Connectivity** | USB 3.0, mPCIe 3.0, 1GB Ethernet (IP68 4-pin data port) |
| **PTT** | 6-pin Hirose connector for full PTT functionality (conquers digital delay) |
| **Power** | Within maximum EIRP of 900MHz, 2.4GHz <36dB (4 watt), and 5GHz power spectral density (PSD) — unlicensed spectrum |

---

## Capabilities

### MANET Networking

- **Self-Organizing**: Automatically configures network topology
- **Self-Healing**: Automatically reroutes when nodes are lost
- **Dynamic Routing**: Optimal path selection based on network conditions
- **Multi-Hop**: Data travels through multiple nodes to reach destination

### Multi-Radio Operation

- **WiFi 6/7**: High-speed data transmission (2.4GHz)
- **LoRa**: Long-range, low-power communication
- **GPS**: Precise positioning with anti-jamming/anti-spoofing
- **Parallel Operation**: All radios operate simultaneously

### Industrial Grade

- **Ruggedized Components**: Designed for shock and vibration resistance
- **Wide Temperature Range**: -40°C to +85°C operation
- **Long-Term Availability**: 10+ year product lifecycle
- **USA Manufactured**: High-quality, reliable components

### Security

- **TPM 2.0**: Hardware security module for cryptographic operations
- **WPA3**: Latest WiFi security standard
- **Encrypted Mesh**: Secure mesh routing protocols
- **GPS Security**: Anti-jamming and anti-spoofing protection

### Modular Design

- **Upgradable Wireless**: Future sub-GHz and 5GHz modules available
- **User Installable**: Tutorials provided for module upgrades
- **No Full Replacement**: Upgrade modules without purchasing new unit

---

## Platform Options

### Linux (Default)

- **Custom Mesh Routing Firmware**: Optimized for MANET networking
- **Dynamic Routing Protocols**: OLSR, BATMAN, or custom implementations
- **Network Tools**: Full Linux networking stack
- **Application Support**: Voice, data, and video applications

### Future Options

- Additional platform support may be available
- Custom firmware development possible

---

## Regulatory Compliance

The Lorax operates within unlicensed spectrum limits:

- **900MHz**: Maximum EIRP compliance
- **2.4GHz**: <36dB (4 watt) maximum power
- **5GHz**: Power spectral density (PSD) compliance

All units are designed and tested to meet FCC Part 15 (or equivalent regional) requirements for unlicensed operation.

---

## Use Cases

### Emergency Communications

- **First Responders**: Reliable communication when infrastructure is damaged
- **Search & Rescue**: Ad-hoc networks in remote areas
- **Disaster Response**: Rapid deployment without infrastructure

### Military & Tactical

- **Field Operations**: Secure, decentralized communications
- **Mobile Units**: Vehicle-to-vehicle networking
- **Command & Control**: Distributed command networks

### Commercial & Industrial

- **Remote Sites**: Mining, oil & gas, construction
- **Event Networks**: Temporary communication infrastructure
- **IoT Mesh**: Large-scale sensor networks

### Educational & Research

- **Network Research**: MANET protocol development
- **Security Testing**: Authorized penetration testing
- **Learning**: Understanding mesh networking principles

---

## See Also

- [BOM.md](BOM.md) — Bill of materials and component sources
- [firmware/](firmware/) — Custom mesh routing firmware (when available)
- [pcb/](pcb/) — PCB design files (when available)
- [enclosures/](enclosures/) — Enclosure designs (when available)

---

## References

- **MorosX IP Mesh Unit**: [https://morosx.com/ols/products/ip-mesh-unit](https://morosx.com/ols/products/ip-mesh-unit)
- **MANET Standards**: IETF MANET working group specifications
- **i.MX 8M Plus**: NXP i.MX 8M Plus application processor documentation

---

*Built with industrial-grade components for professional MANET networking*

