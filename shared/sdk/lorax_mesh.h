/**
 * @file lorax_mesh.h
 * @brief LoRax mesh networking protocol
 * 
 * Mesh relay and routing functions for multi-hop LoRa communication
 * across Lorax, Bar-ba-loot, and Tree Node devices.
 * 
 * Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
 * 
 * Copyright (c) 2024 LoRax Project
 * Licensed under GPL v3
 */

#ifndef LORAX_MESH_H
#define LORAX_MESH_H

#include <stdint.h>
#include <stddef.h>

#define LORAX_MESH_MAX_HOPS 8
#define LORAX_MESH_PACKET_MAX_SIZE 242
#define LORAX_MESH_HELLO_INTERVAL 30000  // 30 seconds

#define LORAX_MESH_CMD_HELLO 0x01
#define LORAX_MESH_CMD_SCAN 0x02
#define LORAX_MESH_CMD_RESULT 0x03
#define LORAX_MESH_CMD_ROUTE 0x04

typedef struct {
    uint8_t cmd;
    uint8_t src_id;
    uint8_t dst_id;
    uint8_t hop_count;
    uint8_t seq;
    uint8_t payload[LORAX_MESH_PACKET_MAX_SIZE];
    size_t payload_len;
} lorax_mesh_packet_t;

/**
 * @brief Initialize mesh stack
 * 
 * @param device_id Unique device ID (0-255)
 * @param hmac_key HMAC key (32 bytes)
 * 
 * @return 0 on success, negative on error
 */
int lorax_mesh_init(uint8_t device_id, const uint8_t *hmac_key);

/**
 * @brief Send packet via mesh
 * 
 * @param packet Packet structure
 * @return 0 on success, negative on error
 */
int lorax_mesh_send(const lorax_mesh_packet_t *packet);

/**
 * @brief Receive packet from mesh
 * 
 * @param packet Output packet structure
 * @param timeout_ms Timeout in milliseconds
 * @return 0 on success, negative on timeout/error
 */
int lorax_mesh_recv(lorax_mesh_packet_t *packet, uint32_t timeout_ms);

/**
 * @brief Forward packet (for relay nodes)
 * 
 * @param packet Packet to forward
 * @return 0 on success, negative on error
 */
int lorax_mesh_forward(const lorax_mesh_packet_t *packet);

/**
 * @brief Broadcast HELLO packet
 * 
 * Announces node presence in mesh network
 * 
 * @return 0 on success, negative on error
 */
int lorax_mesh_hello(void);

/**
 * @brief Get node statistics
 * 
 * @param nodes_seen Number of nodes detected
 * @param packets_forwarded Packets relayed
 * @param avg_rssi Average RSSI received
 */
void lorax_mesh_stats(uint8_t *nodes_seen, uint16_t *packets_forwarded, int8_t *avg_rssi);

#endif /* LORAX_MESH_H */

