# Use Case UC-08: DMZ Web Server Publishing

## Purpose

This conceptual-operational use case documents how a web server would be published through the Sophos Firewall from a DMZ network.

## Operational Scenario

An internal web application should be reachable from an external network without placing the server directly in the LAN.

## Target Architecture

| Component | Example | Purpose |
|---|---|---|
| WAN interface | PortB | External ingress path |
| DMZ interface | Future PortC or DMZ segment | Isolated server network |
| DMZ web server | Future Linux or Windows server VM | Published application endpoint |
| DNAT rule | WAN to DMZ web server | Translates public-facing destination to internal DMZ host |
| Firewall rule | WAN to DMZ HTTP/HTTPS | Allows only required inbound services |
| Optional WAF | Web Server Protection | Adds application-layer protection if configured |

## Required Controls

- Use DNAT only for required services.
- Do not publish management ports.
- Keep the web server outside the LAN zone.
- Log inbound access.
- Restrict source networks if possible.
- Use TLS and valid certificates for production traffic.
- Consider WAF only when the application and certificate model are understood.

## Validation Approach

A practical implementation would be validated with an external-side client, firewall logs, DNAT rule counters, web server logs and packet capture if required.

## Current Scope Decision

This use case is documented conceptually because the current lab does not yet include a dedicated DMZ server VM.

## Result

The DMZ publishing design is documented without exposing unnecessary services or adding artificial lab complexity.
