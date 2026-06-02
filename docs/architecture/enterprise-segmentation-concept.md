# Enterprise Segmentation Concept

## Purpose

This document describes a neutral segmentation model that can be applied to firewall-centric network designs.

## Segmentation Goals

- Reduce unnecessary communication between systems.
- Limit lateral movement paths.
- Separate user, server, guest and management traffic.
- Make firewall decisions visible through logs.
- Keep rule changes documented and reversible.

## Example Zone Model

| Zone | Typical Systems | Security Objective |
|---|---|---|
| WAN | Internet/upstream router | External connectivity |
| LAN_CLIENTS | User clients | Controlled outbound access |
| LAN_SERVERS | Internal services | Restricted application access |
| DMZ | Public-facing or semi-public services | Isolated exposure zone |
| MGMT | Admin workstations and management interfaces | Strongly restricted administration path |
| GUEST | Guest devices | Internet-only access |

## Example Traffic Matrix

| Source Zone | Destination Zone | Example Services | Default Decision |
|---|---|---|---|
| LAN_CLIENTS | WAN | HTTP, HTTPS | Allow with logging |
| LAN_CLIENTS | LAN_SERVERS | Required application ports | Allow only when documented |
| LAN_CLIENTS | MGMT | Any | Deny |
| GUEST | WAN | DNS, HTTP, HTTPS | Allow with restrictions |
| GUEST | LAN_CLIENTS | Any | Deny |
| GUEST | LAN_SERVERS | Any | Deny |
| MGMT | Firewall management | HTTPS, SSH if required | Allow from admin sources only |
| DMZ | LAN_SERVERS | Required backend ports only | Allow only when documented |
| Any | Any | Any | Deny by default |

## Why VLANs Alone Are Not Enough

A VLAN separates Layer 2 broadcast domains.
Security enforcement happens when traffic between VLANs is routed and filtered.
For security-sensitive environments, this routing should be controlled by firewall rules, not by unrestricted Layer 3 switching.

## Best-Practice Rule Principles

- Prefer specific source, destination and service definitions.
- Avoid broad any-to-any or any-service rules.
- Place specific rules above broad fallback rules.
- Enable logging where operationally useful.
- Keep rollback options for risky changes.
- Document why each rule exists.

## Suggested Future Lab Extension

A future extension can add an additional Hyper-V internal switch or Sophos VLAN interface to simulate a DMZ or server segment.
This would allow testing of client-to-server rules, guest isolation and management-zone access restrictions.
