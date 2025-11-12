# Truffula Node Breadboarding Guide

This guide helps you breadboard both versions of the Truffula Node to verify all components work before soldering to the custom PCB.

## Prerequisites

- All components from [BOM.md](BOM.md)
- Breadboard (full-size recommended)
- Jumper wires (male-to-male, male-to-female)
- USB-C cable for programming/power
- Multimeter (optional, for verification)

## Component Overview

Both versions use the same core components:
- Adafruit Feather ESP32-S3
- HopeRF RFM95W (915MHz LoRa)
- Adafruit MAX17048 (battery fuel gauge)
- RAK12500 (GPS module)
- RAK18001 (buzzer module)
- WS2812B LED (status indicator)

**Difference**: Battery system
- **Slim version**: 500mAh LiPo with JST PH connector
- **Round version**: 21700 cell with BMS (test with 21700 or use LiPo for initial testing)

## Breadboard Setup

### Step 1: Power Distribution

1. **Place Feather ESP32-S3** on breadboard
2. **Create power rails**:
   - Connect `3.3V` from Feather to breadboard power rail (red)
   - Connect `GND` from Feather to breadboard ground rail (blue)
   - Use jumper wires to extend power/ground rails across breadboard

### Step 2: I2C Bus Setup

All I2C devices share the same bus:

1. **Connect I2C bus**:
   - **SDA** (Pin 6) → Connect to I2C data line (yellow wire recommended)
   - **SCL** (Pin 7) → Connect to I2C clock line (green wire recommended)
   - Connect **pull-up resistors** (4.7kΩ) from SDA to 3.3V and SCL to 3.3V

2. **Connect MAX17048**:
   - VCC → 3.3V
   - GND → GND
   - SDA → I2C SDA line
   - SCL → I2C SCL line

3. **Connect RAK12500 GPS**:
   - VCC → 3.3V
   - GND → GND
   - SDA → I2C SDA line
   - SCL → I2C SCL line
   - **Note**: RAK modules may need adapter or jumper wires if they have WisBlock connectors

4. **Connect RAK18001 Buzzer**:
   - VCC → 3.3V
   - GND → GND
   - SDA → I2C SDA line
   - SCL → I2C SCL line

### Step 3: SPI Bus Setup (RFM95W)

1. **Connect RFM95W**:
   - VCC → 3.3V
   - GND → GND
   - MOSI → Pin 35
   - MISO → Pin 37
   - SCK → Pin 36
   - CS → Pin 33
   - RST → Pin 38
   - DIO0 → Pin 39

2. **Connect Antenna**:
   - **IMPORTANT**: Always connect antenna before powering on RFM95W
   - Screw 915MHz SMA antenna into RFM95W's SMA connector

### Step 4: Status LED (WS2812B)

1. **Connect WS2812B**:
   - VCC → 3.3V (or 5V if available)
   - GND → GND
   - Data → Pin 8 (or any available GPIO)

### Step 5: Battery Connection

#### Slim Version (500mAh LiPo)
1. Connect LiPo battery to Feather's JST PH connector
2. Battery will charge when USB-C is connected

#### Round Version (21700 with BMS)
1. **If testing with 21700**:
   - Connect BMS to 21700 cell (observe polarity!)
   - Connect BMS output to Feather's battery connector (via adapter)
   - **WARNING**: Ensure BMS is properly configured for 3.7V output

2. **For initial testing** (recommended):
   - Use 500mAh LiPo instead to verify functionality
   - Test 21700 system separately once core functionality is verified

## Testing Procedure

### 1. Power On Test

1. Connect USB-C cable to Feather
2. Verify power LED on Feather lights up
3. Check 3.3V rail with multimeter (should read ~3.3V)

### 2. I2C Device Scan

Upload this test sketch to scan I2C bus:

```cpp
#include <Wire.h>

void setup() {
  Serial.begin(115200);
  Wire.begin();
  Serial.println("I2C Scanner");
}

void loop() {
  byte error, address;
  int nDevices = 0;
  
  Serial.println("Scanning...");
  for(address = 1; address < 127; address++) {
    Wire.beginTransmission(address);
    error = Wire.endTransmission();
    
    if (error == 0) {
      Serial.print("I2C device found at address 0x");
      if (address < 16) Serial.print("0");
      Serial.print(address, HEX);
      Serial.println();
      nDevices++;
    }
  }
  
  if (nDevices == 0) Serial.println("No I2C devices found");
  else Serial.print("Found ");
  Serial.print(nDevices);
  Serial.println(" device(s)");
  
  delay(5000);
}
```

**Expected addresses**:
- MAX17048: `0x36`
- RAK12500: `0x42` (verify in datasheet)
- RAK18001: `0x58` (verify in datasheet)

### 3. MAX17048 Test

Test battery fuel gauge:

```cpp
#include <Adafruit_MAX1704X.h>

Adafruit_MAX17048 maxlipo;

void setup() {
  Serial.begin(115200);
  if (!maxlipo.begin()) {
    Serial.println("MAX17048 not found!");
    while (1) delay(10);
  }
  Serial.println("MAX17048 found!");
}

void loop() {
  Serial.print("Battery: ");
  Serial.print(maxlipo.cellVoltage(), 2);
  Serial.print("V, ");
  Serial.print(maxlipo.cellPercent(), 1);
  Serial.println("%");
  delay(1000);
}
```

### 4. RFM95W Test

Test LoRa communication (requires second node or gateway):

```cpp
#include <RadioLib.h>

RFM95 radio = new Module(33, 39, 38, 36);

void setup() {
  Serial.begin(115200);
  int state = radio.begin(915.0);
  if (state == ERR_NONE) {
    Serial.println("RFM95W initialized!");
  } else {
    Serial.print("RFM95W init failed: ");
    Serial.println(state);
  }
}

void loop() {
  String str = "Hello LoRa!";
  int state = radio.transmit(str);
  if (state == ERR_NONE) {
    Serial.println("Transmitted!");
  }
  delay(5000);
}
```

### 5. GPS Test (RAK12500)

Test GPS module (requires outdoor/open sky for best results):

```cpp
#include <Wire.h>

void setup() {
  Serial.begin(115200);
  Wire.begin();
  // Initialize RAK12500 via I2C
  // Check RAK12500 datasheet for initialization commands
}

void loop() {
  // Read GPS data via I2C
  // Implementation depends on RAK12500 library/commands
  delay(1000);
}
```

**Note**: RAK12500 may require specific initialization sequence. Check RAKwireless documentation.

### 6. Buzzer Test (RAK18001)

Test buzzer module:

```cpp
#include <Wire.h>

void setup() {
  Serial.begin(115200);
  Wire.begin();
  // Initialize RAK18001 via I2C
}

void loop() {
  // Trigger buzzer via I2C command
  // Check RAK18001 datasheet for command format
  delay(2000);
}
```

**Note**: RAK18001 may require specific I2C commands. Check RAKwireless documentation.

### 7. Status LED Test

Test WS2812B LED:

```cpp
#include <FastLED.h>

#define LED_PIN 8
#define NUM_LEDS 1

CRGB leds[NUM_LEDS];

void setup() {
  FastLED.addLeds<WS2812, LED_PIN, GRB>(leds, NUM_LEDS);
}

void loop() {
  leds[0] = CRGB::Red;
  FastLED.show();
  delay(500);
  leds[0] = CRGB::Green;
  FastLED.show();
  delay(500);
  leds[0] = CRGB::Blue;
  FastLED.show();
  delay(500);
}
```

## Troubleshooting

### I2C Devices Not Found
- Check wiring (SDA/SCL swapped?)
- Verify pull-up resistors (4.7kΩ) are connected
- Check power connections (3.3V and GND)
- Verify I2C addresses match datasheets

### RFM95W Not Working
- **CRITICAL**: Ensure antenna is connected before powering on
- Check SPI connections (MOSI, MISO, SCK, CS)
- Verify frequency matches your region (915MHz for NA, 868MHz for EU)
- Check RST and DIO0 connections

### GPS Not Getting Fix
- GPS requires clear view of sky (test outdoors)
- Initial fix can take 5-15 minutes (cold start)
- Verify I2C communication first
- Check RAK12500 documentation for initialization

### Buzzer Not Working
- Verify I2C communication
- Check RAK18001 documentation for correct I2C commands
- Test with simple I2C write command

### Battery Issues (Round Version)
- If using 21700, ensure BMS is properly configured
- Test with LiPo first to isolate battery system issues
- Verify BMS output voltage (should be ~3.7V)
- Check polarity on all connections

## Next Steps

Once all components are verified on breadboard:

1. **Order custom PCB** (if not already done)
2. **Solder components** to PCB following pinout
3. **Test again** on PCB to ensure no soldering issues
4. **Design enclosure** for your chosen version (slim or round)
5. **Flash final firmware** and deploy

## Safety Notes

- ⚠️ **Never power on RFM95W without antenna** - will damage module
- ⚠️ **Observe battery polarity** - reversed polarity can damage components
- ⚠️ **21700 batteries** - handle with care, use proper BMS protection
- ⚠️ **I2C pull-ups** - required for proper communication

---

*Test thoroughly before moving to PCB assembly!*

