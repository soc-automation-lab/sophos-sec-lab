# Use Case UC-10: Guest Network Isolation Concept

## Purpose

This conceptual-operational use case documents how guest network traffic should be separated from internal LAN resources.

## Operational Scenario

Guest users require internet access but must not reach internal clients, servers, management interfaces or administrative services.

## Isolation Model

| Traffic Path | Intended Policy |
|---|---|
| Guest to WAN | Allow only required internet services |
| Guest to LAN | Deny |
| Guest to DMZ | Deny unless explicitly required |
| Guest to firewall management | Deny WebAdmin and SSH |
| Guest to DNS | Allow only intended resolver path |

## Design Notes

- Place guest traffic in a separate zone or VLAN.
- Use dedicated DHCP scope for guest clients.
- Do not reuse internal DNS unless intentionally required.
- Block access to LAN and management networks.
- Log denied guest-to-internal attempts.
- Apply web filtering or application control if required.

## Validation Approach

A practical implementation would test guest internet access, blocked LAN access, blocked WebAdmin access and correct DNS behavior.

## Current Scope Decision

This use case is documented conceptually because the current lab does not include a second guest client or realistic access point setup.

## Result

Guest isolation is documented as a realistic network security design pattern without requiring additional wireless hardware.
