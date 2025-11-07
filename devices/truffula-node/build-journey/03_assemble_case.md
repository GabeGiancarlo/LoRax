# Step 3: Assemble Case

## Files Required

- `enclosures/truffula-node_long.stl` (top)
- `enclosures/truffula-node_long_bottom.stl` (bottom)

## 3D Printer Settings

### FDM (PLA/PETG)

- **Layer height**: 0.2mm
- **Infill**: 20% (lightweight for deployment)
- **Supports**: None (if printed upright)
- **Walls**: 3 perimeters
- **Temperature**: Per material spec

### Design Notes

- **Long form factor**: Accommodates 19cm antenna (collapsed)
- **Antenna slot**: Allows pop-out extension
- **Magnet pocket**: N42 magnet recess in bottom

## Post-Processing

1. **Remove supports**
2. **Sand** edges smooth
3. **Test fit**: PCB should slide in
4. **Antenna test**: Ensure pop-out mechanism works
5. **Drill**: Holes for USB-C and LED if needed

## Assembly Steps

1. **Install PCB** into bottom case
2. **Route antenna**: Through case slot, ensure clearance
3. **Secure PCB**: M2 screws or clips
4. **Install magnet** (optional): Epoxy into pocket
5. **Snap top** and bottom together
6. **Test antenna** pop-out mechanism

## Waterproofing (Optional)

For outdoor deployment:

- **Silicone sealant**: Apply to case seams
- **Antenna seal**: Use O-ring or gasket
- **USB port**: Cover with rubber plug
- **Test**: Submerge in shallow water before field deployment

## Deployment Features

- **Magnetic mount**: Attach to metal surfaces
- **Antenna extension**: Pop out for 3km range
- **Low profile**: Fits in vents, under cars
- **Weather resistant**: Optional sealing

## Final Check

- ✅ PCB secured
- ✅ Antenna extends/retracts smoothly
- ✅ USB port accessible (for updates)
- ✅ LED visible (status indicator)
- ✅ Magnet installed (if using)

## Next Steps

Case complete? Test range and mesh functionality in [Step 4: Test Range](04_test_range.md)

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

