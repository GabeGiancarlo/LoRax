# Tree Node Enclosures

## Files

- **tree-node_long.stl** - Top case (accommodates 19cm antenna when collapsed)
- **tree-node_long_bottom.stl** - Bottom case with magnet pocket

## Design Notes

- **Long form factor**: Accommodates extended antenna (collapsed when stored)
- **Antenna slot**: Allows pop-out extension for 3km range
- **Magnet pocket**: N42 magnet recess in bottom for magnetic mounting
- **USB-C access**: Port accessible for firmware updates
- **LED window**: Clear section for status LED visibility

## Print Settings

### FDM (PLA/PETG)

- **Layer height**: 0.2mm
- **Infill**: 20% (lightweight for deployment)
- **Supports**: None (if printed upright)
- **Walls**: 3 perimeters
- **Temperature**: Per material spec

### SLA (Resin)

- **Layer height**: 0.05mm
- **Exposure**: Per resin spec (typically 2-3s)
- **Supports**: Light supports on overhangs

## Post-Processing

1. **Remove supports**
2. **Sand** edges smooth (320 → 600 grit)
3. **Test fit**: PCB should slide in smoothly
4. **Drill**: Antenna hole if needed (2.5mm)
5. **Waterproofing** (optional): Silicone sealant for outdoor deployment

## Assembly

See [build-journey/03_assemble_case.md](../build-journey/03_assemble_case.md) for step-by-step assembly instructions.

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

