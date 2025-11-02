# Step 4: Test Range & Mesh

## Prerequisites

- Assembled Tree Node (from [Step 3](03_assemble_case.md))
- Bar-ba-loot controller (paired)
- Lorax endpoint (optional, for full mesh test)
- Open field or clear line-of-sight

## Initial Setup

1. **Power on Tree Node**:
   - LED should blink (initializing)
   - Then go dark (deep sleep active)

2. **Check serial output** (115200 baud):
   ```
   Tree Node v1.0
   Battery: 4.1V (100%)
   RFM95W initialized
   Entering deep sleep...
   ```

## Range Test Procedure

### Test 1: Direct Range (No Relay)

1. **Position Bar-ba-loot** at starting point (Point A)
2. **Position Lorax endpoint** at distance (Point B)
3. **Send test packet** from controller
4. **Walk away** from endpoint, test maximum range
5. **Record**: Maximum reliable range (typically 500-800m urban)

### Test 2: Single Hop (Tree Node Relay)

1. **Position Tree Node** halfway between controller and endpoint
2. **Power on Tree Node** → should auto-join mesh
3. **Send test packet** from controller
4. **Tree Node should forward** → endpoint receives
5. **Record**: Extended range (should reach 2-3km)

### Test 3: Multi-Hop (Multiple Tree Nodes)

1. **Deploy 2 Tree Nodes** in chain:
   - Controller → Node 1 (1.5km) → Node 2 (1.5km) → Endpoint
2. **Send test packet** → verify hop count
3. **Check serial logs**: Each node should show hop increment
4. **Record**: Maximum chain distance

## RSSI Monitoring

Tree Nodes log RSSI values:

```
RSSI: -95 dBm (weak)
RSSI: -80 dBm (good)
RSSI: -65 dBm (excellent)
```

**Target**: Maintain RSSI > -100 dBm for reliable forwarding

## Mesh Verification

### Check Mesh Status

1. **Send HELLO packet** from controller
2. **All nodes should respond** with:
   - Node ID
   - Battery level
   - Hop count
   - RSSI

3. **Verify routing**:
   - Controller → Node 1 → Endpoint (2 hops)
   - Controller → Node 2 → Node 1 → Endpoint (3 hops)

## Troubleshooting

### No Response from Node

- **Check power**: Battery voltage > 3.5V
- **Verify antenna**: Fully extended, properly connected
- **Check frequency**: All devices on same frequency (915MHz)
- **HMAC key**: Must match across all devices

### Intermittent Connectivity

- **Obstacles**: Buildings, trees reduce range
- **Antenna orientation**: Vertical polarization optimal
- **Interference**: Check for other LoRa devices
- **Hop limit**: Too many hops degrade signal

## Deployment Tips

1. **Elevation**: Higher = better range (trees, buildings)
2. **Line-of-sight**: Clear path between nodes
3. **Spacing**: 1-2km per hop optimal (3km max with 10dBi antenna)
4. **Stealth**: Place discreetly (vents, under cars, in foliage)

## Next Steps

Range verified? Tree Node is ready for deployment! See mesh deployment guide in main docs.

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

