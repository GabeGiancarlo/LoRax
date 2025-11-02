/**
 * @file lorax_common.h
 * @brief LoRax common definitions and utilities
 * 
 * Shared constants, types, and helper functions used across all LoRax devices.
 * 
 * Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
 * 
 * Copyright (c) 2024 LoRax Project
 * Licensed under GPL v3
 */

#ifndef LORAX_COMMON_H
#define LORAX_COMMON_H

#include <stdint.h>
#include <stdbool.h>

#define LORAX_VERSION_MAJOR 1
#define LORAX_VERSION_MINOR 0
#define LORAX_VERSION_PATCH 0

#define LORAX_DEVICE_LORAX 0x01
#define LORAX_DEVICE_BARBA_LOOT 0x02
#define LORAX_DEVICE_TREE_NODE 0x03

#define LORAX_LORA_FREQ_915M 915000000  // North America
#define LORAX_LORA_FREQ_868M 868000000  // Europe

#define LORAX_BATTERY_CRITICAL 3.3f  // Volts
#define LORAX_BATTERY_LOW 3.5f
#define LORAX_BATTERY_FULL 4.2f

typedef enum {
    LORAX_STATUS_OK = 0,
    LORAX_STATUS_ERROR = -1,
    LORAX_STATUS_TIMEOUT = -2,
    LORAX_STATUS_INVALID = -3,
    LORAX_STATUS_AUTH_FAIL = -4,
} lorax_status_t;

typedef struct {
    float voltage;
    float percent;
    bool charging;
} lorax_battery_t;

typedef struct {
    int8_t rssi;
    float snr;
    uint8_t freq_error;
} lorax_rf_stats_t;

/**
 * @brief Get device type
 * 
 * @return Device ID (LORAX_DEVICE_*)
 */
uint8_t lorax_get_device_type(void);

/**
 * @brief Get device ID (unique per device)
 * 
 * @return Device ID (0-255)
 */
uint8_t lorax_get_device_id(void);

/**
 * @brief Get firmware version
 * 
 * @param major Major version
 * @param minor Minor version
 * @param patch Patch version
 */
void lorax_get_version(uint8_t *major, uint8_t *minor, uint8_t *patch);

/**
 * @brief Read battery status
 * 
 * @param battery Output battery structure
 * @return 0 on success, negative on error
 */
int lorax_battery_read(lorax_battery_t *battery);

/**
 * @brief Delay in milliseconds
 * 
 * @param ms Milliseconds to delay
 */
void lorax_delay_ms(uint32_t ms);

/**
 * @brief Get uptime in milliseconds
 * 
 * @return Uptime in milliseconds
 */
uint32_t lorax_uptime_ms(void);

#endif /* LORAX_COMMON_H */

