# LoRax Security

## Overview

LoRax implements **defense-in-depth** security across all communication layers:

- **Physical**: Keychain-sized devices for stealth deployment
- **Network**: LoRa (no WiFi/BT emissions)
- **Cryptographic**: HMAC + AES-256 end-to-end encryption
- **Protocol**: Hop-by-hop authentication, replay protection

---

## Threat Model

### Adversaries

1. **Passive eavesdropper**: Can intercept LoRa packets
2. **Active attacker**: Can inject/modify packets
3. **Physical attacker**: Can capture/compromise devices
4. **Network defender**: Can detect WiFi/BT (but not LoRa)

### Attack Vectors

| Attack | Mitigation |
|--------|------------|
| Packet interception | AES-256-GCM encryption |
| Packet injection | HMAC-SHA256 authentication |
| Replay attacks | Sequence numbers + timestamps |
| DoS (jamming) | Frequency hopping (planned) |
| Physical compromise | Secure boot (planned) |

---

## Cryptographic Primitives

### HMAC-SHA256

- **Purpose**: Packet authentication
- **Key size**: 32 bytes (256 bits)
- **Output**: 32-byte MAC tag
- **Usage**: Every packet includes HMAC for hop-by-hop validation

### AES-256-GCM

- **Purpose**: Payload encryption (end-to-end)
- **Key size**: 32 bytes (256 bits)
- **Mode**: GCM (authenticated encryption)
- **Nonce**: 12 bytes (timestamp + random)
- **Usage**: Encrypts scan commands and results

### Key Derivation

```
Master Key → PBKDF2 → Device Keys
HMAC Key: PBKDF2(master, "HMAC", iterations=10000)
AES Key: PBKDF2(master, "AES", iterations=10000)
```

---

## Packet Security

### Packet Structure

```
┌────────────┬──────────┬─────────────────┐
│   HMAC     │  Header  │  Encrypted      │
│  (32 bytes)│  (5 bytes│  Payload        │
│            │          │  (AES-256-GCM)  │
└────────────┴──────────┴─────────────────┘
```

### Security Layers

1. **HMAC**: Validates packet integrity and authenticity
2. **Header**: Source ID, destination ID, hop count (unencrypted for routing)
3. **Payload**: Encrypted with AES-256-GCM (scan commands/results)

---

## Mesh Security

### Hop-by-Hop Authentication

Every relay node validates HMAC before forwarding:

```
Controller → [HMAC check] → Node A → [HMAC check] → Node B → Endpoint
```

- **Invalid HMAC**: Packet dropped, no forward
- **Valid HMAC**: Hop count incremented, packet forwarded

### Key Management

- **Shared mesh key**: All nodes in mesh share same HMAC key
- **Per-device AES keys**: Unique keys for each device pair (optional)
- **Key rotation**: Manual (planned: automatic key exchange)

---

## Deployment Security

### Physical Security

- **Stealth deployment**: Keychain-sized devices
- **Magnetic mounting**: Tree Nodes can attach to metal surfaces
- **Weather resistance**: Optional waterproofing for outdoor deployment

### Operational Security

- **Frequency selection**: 915MHz (North America) or 868MHz (Europe)
- **Low power**: No continuous emissions (deep sleep between operations)
- **No WiFi/BT**: LoRa is invisible to standard network scanners

---

## Known Limitations

### Current Limitations

1. **No key rotation**: Keys must be changed manually
2. **No secure boot**: Physical compromise can extract keys
3. **No forward secrecy**: Compromised key affects historical packets
4. **No frequency hopping**: Susceptible to jamming (planned feature)

### Planned Improvements

1. **Key exchange protocol**: Automatic key rotation
2. **Secure element**: Hardware key storage (optional)
3. **Frequency agility**: Adaptive frequency hopping
4. **Secure boot**: Verified firmware at startup

---

## Best Practices

### Key Management

- **Generate strong keys**: Use cryptographically secure RNG
- **Store securely**: Never commit keys to repository
- **Rotate regularly**: Change keys periodically (e.g., monthly)
- **Separate keys**: Use different keys per deployment

### Deployment

- **Change default keys**: Never use default/example keys
- **Deploy discretely**: Place devices where they won't be discovered
- **Monitor battery**: Low battery can expose devices during charging
- **Update firmware**: Keep firmware updated with security patches

### Operational

- **Use encrypted commands**: Always use AES-256 for sensitive commands
- **Validate responses**: Check HMAC on all received packets
- **Limit hop count**: Prevent routing loops (max 8 hops)
- **Monitor mesh health**: Check for unauthorized nodes

---

## Security Audits

### Recommended Audits

1. **Cryptographic review**: Verify implementation of HMAC/AES
2. **Protocol review**: Check for timing attacks, side channels
3. **Physical review**: Test resistance to physical compromise
4. **Network review**: Analyze LoRa traffic patterns

### Reporting Issues

If you discover a security vulnerability:

1. **Do not** create public issue
2. **Email** project maintainers privately
3. **Include**: Description, impact, proof-of-concept (if safe)
4. **Wait** for patch before disclosure

---

## References

- **AES-256**: NIST FIPS 197
- **HMAC-SHA256**: RFC 6234
- **AES-GCM**: NIST SP 800-38D
- **PBKDF2**: RFC 2898

---

*Built on KaliAssistant's Fox-Jack foundation — see `CREDITS.md`*

