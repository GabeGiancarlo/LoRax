# LoRax Media Assets

This folder contains media assets used in documentation and build guides.

## Structure

- **`gifs/`** - Animated GIFs for documentation and tutorials
- **`videos/`** - Video demonstrations and tutorials
- **`images/`** - Static images, screenshots, diagrams, and photos
- **`audio/`** - Audio files for documentation (if needed)

## Usage

Media files in this folder are referenced in:
- Documentation files in `shared/docs/`
- Device build guides in `devices/*/build-journey/`
- README files throughout the project

## Adding Media

When adding media files:
1. Place files in the appropriate subfolder (gifs, videos, images, or audio)
2. Use descriptive filenames (e.g., `truffula-node-assembly.jpg`)
3. Reference the file in documentation using relative paths
4. Keep file sizes reasonable for GitHub hosting
5. Use formats that are widely supported:
   - Images: PNG, JPG, SVG
   - Videos: MP4, WebM
   - GIFs: GIF, WebP
   - Audio: MP3, OGG

## Build Documentation

Media files documenting the build process should be organized by device:
- `images/devices/truffula-node/` - Truffula Node build photos, PCB renders, components
- `images/devices/lorax/` - Lorax build photos, PCB renders, components
- `images/devices/bar-ba-loot/` - Bar-ba-loot build photos, PCB renders, components

## Current Images

### Device Images
- **Bar-ba-loot**: PCB top/bottom renders, Kailh Choc switch photos
- **Lorax**: (to be added)
- **Truffula Node**: (to be added)

### Reference Images
- The Lorax book/movie reference images (for branding/inspiration)
- Character references (Lorax, Bar-ba-loot, Truffula trees)

### Diagrams
- System architecture diagrams (to be added)
- Network topology diagrams (to be added)
- PCB layout diagrams (to be added)

## Image Guidelines

### File Naming
- Use lowercase with hyphens: `device-name-component.jpg`
- Be descriptive: `bar-ba-loot-pcb-top.jpg` not `img1.jpg`
- Include device name: `truffula-node-assembly-step-3.jpg`

### Image Sizes
- **Documentation images**: 800-1200px width (optimized for web)
- **PCB renders**: Full resolution (for detail)
- **Build photos**: 1200-1920px width (clear detail)
- **Diagrams**: SVG preferred, PNG fallback

### Optimization
- Compress images before committing (use tools like `optipng`, `jpegoptim`)
- Keep file sizes reasonable (< 500KB for most images)
- Use appropriate formats:
  - Photos: JPG
  - Screenshots: PNG
  - Diagrams: SVG or PNG
  - Icons: SVG or PNG

---

*Media assets for LoRax ecosystem documentation and build guides*

