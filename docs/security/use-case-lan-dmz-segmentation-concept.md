# Use Case UC-09: LAN to DMZ Segmentation

## Purpose

This conceptual-operational use case documents controlled access between an internal LAN and a DMZ network.

## Operational Scenario

Internal clients or administrators need limited access to a server in the DMZ, while the DMZ must not have unrestricted access back into the LAN.

## Segmentation Principle

| Direction | Default Security Idea | Example Allowed Access |
|---|---|---|
| LAN to DMZ | Limited allow | Admin workstation to web server on SSH or HTTPS |
| DMZ to LAN | Default deny | Only explicitly required backend access |
| DMZ to WAN | Limited allow | Updates to trusted repositories |
| WAN to DMZ | Only published services | HTTP/HTTPS through DNAT or WAF |

## Rule Design Notes

- Use separate firewall rules per traffic direction.
- Avoid any-to-any access between LAN and DMZ.
- Document source, destination, service and business reason.
- Enable logging on segmentation rules.
- Review unused or overly broad rules.
- Prefer named hosts and groups over broad networks.

## Validation Approach

A practical test would validate allowed LAN-to-DMZ access and blocked DMZ-to-LAN access with client-side tests, firewall logs and server logs.

## Current Scope Decision

This use case is documented conceptually because the current lab does not yet include a dedicated DMZ interface and server.

## Result

The segmentation model is documented as a realistic firewall administration scenario for future DMZ expansion.
