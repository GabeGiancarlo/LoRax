# Truffula Node Memory Analysis

## Current Memory Requirements

### Runtime Memory (SRAM)

| Component | Size | Notes |
|-----------|------|-------|
| **Packet Buffer** | ~279 bytes | 242B payload + 32B HMAC + 5B header |
| **Neighbor Table** | ~100-200 bytes | 10-20 nodes × ~10 bytes (ID, RSSI, hop count) |
| **Routing State** | ~50 bytes | Current path, hop count tracking |
| **Library Overhead** | ~20-30KB | RadioLib, MAX1704X, FastLED, Arduino core |
| **Stack Space** | ~8-16KB | Function calls, local variables |
| **Free Heap** | ~400KB+ | Available for dynamic allocation |

**Total Estimated Usage**: ~30-50KB of 512KB SRAM (6-10% utilization)

### Program Storage (Flash)

| Component | Size | Notes |
|-----------|------|-------|
| **Firmware Code** | ~50-100KB | Mesh relay logic, deep sleep handling |
| **Libraries** | ~200-300KB | RadioLib, MAX1704X, FastLED, ESP32 core |
| **Configuration** | ~1-2KB | HMAC keys, device ID, frequency settings |
| **Available** | ~3.7-7.7MB | Remaining flash space |

**Total Estimated Usage**: ~250-400KB of 4-8MB flash (5-10% utilization)

### Deep Sleep State (RTC Memory)

| Component | Size | Notes |
|-----------|------|-------|
| **Wake State** | ~100-200 bytes | ULP coprocessor state, wake counters |
| **RTC Variables** | ~50 bytes | Battery level, last RSSI, node count |
| **Available** | ~7.8KB | Remaining RTC memory |

**Total Estimated Usage**: ~150-250 bytes of 8KB RTC memory (2-3% utilization)

---

## Current Use Case: Simple Relay

The Truffula Node's current role is **stateless packet forwarding**:

1. **Wake** every 10s (ULP coprocessor)
2. **Listen** for 100ms (RX window)
3. **Validate** HMAC
4. **Forward** packet (increment hop count)
5. **Sleep** (25µA average)

**No persistent storage needed** because:
- ✅ Packets are forwarded immediately (no buffering)
- ✅ Neighbor table can be rebuilt on wake (HELLO broadcasts)
- ✅ No scan results to store (that's Lorax's job)
- ✅ No logging required (stateless relay)

---

## Future Features That May Need External Storage

### 1. Mesh Diagnostics & Logging

**Use Case**: Store packet forwarding statistics, RSSI history, battery trends

**Requirements**:
- Packet count: ~100-1000 entries
- Entry size: ~20 bytes (timestamp, RSSI, hop count, battery)
- Total: ~2-20KB

**Recommendation**: **Optional** - Could use EEPROM or external flash (SPI)

### 2. OTA Firmware Updates

**Use Case**: Receive firmware updates via mesh network

**Requirements**:
- Firmware binary: ~250-400KB
- Update staging: ~250-400KB (double buffering)
- Total: ~500-800KB

**Recommendation**: **External flash required** (SPI flash chip, 1-2MB minimum)

### 3. Extended Neighbor Tables

**Use Case**: Support larger meshes (50+ nodes)

**Requirements**:
- Neighbor entries: 50-100 nodes
- Entry size: ~15 bytes (ID, RSSI, last seen, hop count)
- Total: ~750 bytes - 1.5KB

**Recommendation**: **Onboard SRAM sufficient** (fits in 512KB)

### 4. Packet Buffering

**Use Case**: Queue packets during deep sleep for batch forwarding

**Requirements**:
- Buffer size: 5-10 packets
- Packet size: ~279 bytes
- Total: ~1.4-2.8KB

**Recommendation**: **Onboard SRAM sufficient** (fits in 512KB)

---

## External Storage Options

### Option 1: EEPROM (I2C)

**Pros**:
- ✅ Low power (~1mA active, ~1µA standby)
- ✅ Simple I2C interface
- ✅ Non-volatile (data survives power loss)
- ✅ Small footprint (SOIC-8 package)

**Cons**:
- ❌ Limited capacity (typically 1-64KB)
- ❌ Slow writes (5-10ms per page)
- ❌ Limited write cycles (1M cycles)

**Use Case**: Mesh diagnostics, configuration storage

**Example**: AT24C256 (32KB, $0.50)

### Option 2: SPI Flash (External)

**Pros**:
- ✅ Large capacity (1-16MB)
- ✅ Fast reads/writes
- ✅ Low power (~5mA active, ~10µA standby)
- ✅ OTA update support

**Cons**:
- ❌ Requires SPI interface (4 pins)
- ❌ Slightly larger footprint
- ❌ More complex driver

**Use Case**: OTA updates, extended logging

**Example**: W25Q16JV (2MB, $0.80) or W25Q32JV (4MB, $1.20)

### Option 3: SD Card (SPI)

**Pros**:
- ✅ Very large capacity (GB range)
- ✅ Removable (easy data retrieval)
- ✅ Standard interface

**Cons**:
- ❌ High power consumption (~50-100mA)
- ❌ Large physical size
- ❌ Not suitable for deep sleep applications

**Use Case**: **Not recommended** for Truffula Node (power constraints)

---

## Recommendation

### Current Design: **Onboard Memory Sufficient** ✅

The ESP32-S3's onboard memory is **more than adequate** for the current simple relay functionality:

- **512KB SRAM**: Plenty for packet buffers, neighbor tables, and library overhead
- **4-8MB Flash**: Ample for firmware and libraries
- **8KB RTC Memory**: Sufficient for deep sleep state preservation

**No external storage needed** for current use case.

### Future Considerations

If you plan to add these features, consider external storage:

1. **Mesh Diagnostics** → **EEPROM** (AT24C256, 32KB, ~$0.50)
   - Low power, simple interface
   - Good for small amounts of persistent data

2. **OTA Updates** → **SPI Flash** (W25Q32JV, 4MB, ~$1.20)
   - Required for firmware update staging
   - Fast enough for OTA operations

3. **Extended Logging** → **SPI Flash** (W25Q16JV, 2MB, ~$0.80)
   - Larger capacity than EEPROM
   - Better for frequent writes

### Design Flexibility

**Recommendation**: Design PCB with **optional** storage footprint:

- **EEPROM**: I2C pins (SDA, SCL) - can be populated later
- **SPI Flash**: SPI pins (MOSI, MISO, SCK, CS) - can be populated later
- **Power gating**: Use AP22802 load switch (already in design) to power gate external storage during deep sleep

This allows you to:
- ✅ Start with minimal design (no external storage)
- ✅ Add storage later if needed (populate components)
- ✅ Maintain power efficiency (gate unused components)

---

## Power Impact

### Current (No External Storage)
- **Deep Sleep**: ~25µA
- **Active RX**: ~100mA

### With EEPROM (AT24C256)
- **Deep Sleep**: ~26µA (+1µA standby)
- **Active**: ~101mA (+1mA active)

### With SPI Flash (W25Q32JV)
- **Deep Sleep**: ~35µA (+10µA standby, gated)
- **Active**: ~105mA (+5mA active)

**Conclusion**: External storage has **minimal power impact** if properly power-gated during deep sleep.

---

## Cost Analysis

| Option | Component | Cost | Use Case |
|--------|-----------|------|----------|
| **None** | - | $0 | Current simple relay |
| **EEPROM** | AT24C256 | $0.50 | Diagnostics, config |
| **SPI Flash** | W25Q32JV | $1.20 | OTA updates, logging |

**Recommendation**: Start without external storage, add later if needed.

---

## Conclusion

**For the current Truffula Node design (simple relay):**

✅ **Onboard memory is sufficient** - No external storage needed

The ESP32-S3's 512KB SRAM and 4-8MB flash provide plenty of headroom for:
- Packet forwarding
- Neighbor table management
- Deep sleep operation
- Library overhead

**For future features:**

Consider adding external storage only if you need:
- Mesh diagnostics logging
- OTA firmware updates
- Extended packet buffering

**Design recommendation**: Include optional storage footprints on PCB (EEPROM I2C, SPI Flash) but don't populate initially. This maintains design flexibility while keeping current costs and complexity low.

---

*Last updated: 2024*

