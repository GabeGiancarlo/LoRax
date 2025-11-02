/**
 * @file lorax_crypto.h
 * @brief LoRax cryptographic functions for HMAC and AES-256
 * 
 * Shared cryptographic primitives used across all LoRax devices
 * for secure packet authentication and payload encryption.
 * 
 * Adapted from KaliAssistant's Fox-Jack (https://github.com/KaliAssistant/Fox-Jack)
 * 
 * Copyright (c) 2024 LoRax Project
 * Licensed under GPL v3
 */

#ifndef LORAX_CRYPTO_H
#define LORAX_CRYPTO_H

#include <stdint.h>
#include <stddef.h>

#define LORAX_HMAC_KEY_SIZE 32
#define LORAX_AES_KEY_SIZE 32
#define LORAX_HMAC_SIZE 32
#define LORAX_NONCE_SIZE 12

/**
 * @brief Generate HMAC-SHA256 for packet authentication
 * 
 * @param key HMAC key (32 bytes)
 * @param data Packet data
 * @param data_len Packet length
 * @param hmac_out Output buffer (32 bytes)
 * 
 * @return 0 on success, negative on error
 */
int lorax_hmac_sha256(const uint8_t *key, const uint8_t *data, size_t data_len, uint8_t *hmac_out);

/**
 * @brief Verify HMAC-SHA256 of packet
 * 
 * @param key HMAC key (32 bytes)
 * @param data Packet data
 * @param data_len Packet length
 * @param hmac_in Received HMAC (32 bytes)
 * 
 * @return 1 if valid, 0 if invalid
 */
int lorax_hmac_verify(const uint8_t *key, const uint8_t *data, size_t data_len, const uint8_t *hmac_in);

/**
 * @brief Encrypt payload with AES-256-GCM
 * 
 * @param key AES key (32 bytes)
 * @param plaintext Input data
 * @param plaintext_len Input length
 * @param nonce Nonce (12 bytes)
 * @param ciphertext Output buffer
 * @param tag_out Authentication tag (16 bytes)
 * 
 * @return 0 on success, negative on error
 */
int lorax_aes256_encrypt(const uint8_t *key, const uint8_t *plaintext, size_t plaintext_len,
                         const uint8_t *nonce, uint8_t *ciphertext, uint8_t *tag_out);

/**
 * @brief Decrypt payload with AES-256-GCM
 * 
 * @param key AES key (32 bytes)
 * @param ciphertext Encrypted data
 * @param ciphertext_len Encrypted length
 * @param nonce Nonce (12 bytes)
 * @param tag Authentication tag (16 bytes)
 * @param plaintext Output buffer
 * 
 * @return 0 on success, negative on error (invalid tag)
 */
int lorax_aes256_decrypt(const uint8_t *key, const uint8_t *ciphertext, size_t ciphertext_len,
                         const uint8_t *nonce, const uint8_t *tag, uint8_t *plaintext);

/**
 * @brief Generate secure random bytes
 * 
 * @param buf Output buffer
 * @param len Number of bytes to generate
 * 
 * @return 0 on success, negative on error
 */
int lorax_random_bytes(uint8_t *buf, size_t len);

#endif /* LORAX_CRYPTO_H */

