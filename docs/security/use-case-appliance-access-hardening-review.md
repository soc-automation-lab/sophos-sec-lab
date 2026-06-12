# Use Case UC-05: Appliance Access Hardening Review

## Purpose

This use case reviews access to services running on the Sophos Firewall appliance itself.

## Operational Scenario

A firewall administrator must distinguish between traffic passing through the firewall and access to the firewall appliance itself.

## Key Distinction

| Control Type | Meaning | Example |
|---|---|---|
| Firewall rule | Controls traffic between zones | LAN client to internet on TCP/443 |
| Appliance access | Controls access to firewall-local services | WebAdmin HTTPS, SSH, DNS, Ping, SSL VPN |

## Observed Lab State

| Zone | Interpretation |
|---|---|
| LAN | Several local services are enabled for lab administration |
| WAN | Management exposure should remain disabled or tightly restricted |
| DMZ | Should only allow required firewall-local services |
| VPN | Should be restricted to required VPN and management scenarios |
| WiFi | Should be reviewed carefully, especially for guest networks |

## Hardening Principles

- Do not expose WebAdmin broadly to WAN.
- Keep SSH disabled unless required for troubleshooting.
- Allow DNS only for zones that intentionally use the firewall as resolver.
- Prefer trusted admin networks for HTTPS management.
- Use exceptions only when they are clearly documented.
- Review appliance access separately from normal firewall rules.

## Result

The appliance access model is documented and can be hardened later without confusing it with normal inter-zone firewall rules.
