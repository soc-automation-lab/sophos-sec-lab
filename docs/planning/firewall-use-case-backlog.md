# Firewall Use Case Backlog

## Purpose

This backlog collects realistic Sophos Firewall use cases derived from common firewall, network and security administration responsibilities.

The backlog is intentionally iterative. Use cases may be implemented, refined or marked as conceptual depending on lab feasibility, licensing requirements and available infrastructure.

## Selection Principles

| Principle | Meaning |
|---|---|
| Practical relevance | The use case should reflect realistic firewall or network administration work. |
| Evidence-driven | The result should be validated with CLI output, firewall logs, runbooks or sanitized documentation. |
| Least privilege | Access should be scoped to required sources, destinations and services. |
| No artificial complexity | Additional components should only be added when they enable meaningful operational scenarios. |
| Public-safe documentation | Screenshots with session parameters, serial numbers, account identifiers or private data should not be committed. |

## Implemented Use Cases

| ID | Use Case | Status | Evidence |
|---|---|---|---|
| UC-01 | Client internet access troubleshooting | Implemented | M7.1 |
| UC-02 | Firewall rule validation and least-privilege verification | Implemented | M7.2 |
| UC-03 | Firewall Health Check review | Implemented | M7.3 |

## Planned Practical Use Cases

| ID | Use Case | Lab Feasibility | Why It Matters |
|---|---|---|---|
| UC-04 | Network and policy inventory | High | Documents interfaces, zones, WAN gateway, DNS, DHCP, NAT, firewall rules and TLS inspection state. |
| UC-05 | Appliance access hardening review | High | Reviews which firewall management services are reachable from which zones. |
| UC-06 | DHCP and DNS troubleshooting | High | Validates client addressing, gateway assignment, DNS forwarding and name resolution. |
| UC-07 | NAT rule review and cleanup | High | Reviews active, unused and linked NAT rules and explains MASQ/SNAT behavior. |
| UC-08 | DMZ web server publishing | Medium | Demonstrates DNAT, firewall policy, segmentation and optional webserver protection. Requires an additional server VM. |
| UC-09 | LAN to DMZ segmentation | Medium | Demonstrates controlled east-west access between zones. Requires an additional DMZ network and server. |
| UC-10 | Guest network isolation concept | Medium | Demonstrates separation between guest access and internal LAN. Practical implementation may require an additional client or wireless/AP simulation. |
| UC-11 | DNS architecture with internal resolver | Medium | Demonstrates why clients use internal DNS while the resolver forwards external queries. May require a server VM. |
| UC-12 | Syslog and SIEM integration concept | Medium | Demonstrates central log forwarding and operational monitoring. Requires a logging target. |
| UC-13 | Backup, firmware and rollback procedure | High | Documents operational maintenance and recovery procedures. |
| UC-14 | VPN and branch connectivity concept | Medium | Documents remote access and site-to-site concepts. Practical testing may require additional endpoint or peer infrastructure. |
| UC-15 | Microsoft 365 and cloud application visibility | Medium | Uses application and web reporting to explain cloud application traffic visibility and policy options. |

## Currently Out of Scope or Conditional

| Area | Reason |
|---|---|
| MDR, NDR and XDR services | Subscription- or service-dependent. |
| Security Heartbeat | Requires Sophos Endpoint and Sophos Central integration. |
| Synchronized Application Control | Requires Sophos Endpoint integration. |
| Full TLS decryption | Requires certificate rollout, exception handling and legal or organizational review. |
| Mobile WAN | Requires supported mobile WAN hardware or service. |
| Sophos wireless production scenario | Requires compatible Sophos access points for realistic implementation. |

## Candidate Additional Lab Components

| Component | Purpose | Priority |
|---|---|---|
| Linux web server VM | DMZ, DNAT, web publishing and segmentation use cases. | High |
| Windows Server or DNS VM | Internal DNS, DHCP relay and enterprise name resolution use cases. | Medium |
| Second Windows client VM | Client segmentation and guest/LAN comparison. | Medium |
| Lightweight logging VM | Syslog and SIEM integration concept. | Medium |

## Next Recommended Milestones

| Milestone | Topic |
|---|---|
| M8 | Sophos network and policy inventory |
| M9 | Appliance access hardening review |
| M10 | DHCP and DNS troubleshooting |
| M11 | DMZ web server publishing and segmentation |
| M12 | Syslog and SIEM integration concept |

## Notes

This backlog is not a promise to implement every feature. It is a structured planning artifact used to select realistic, evidence-driven firewall administration scenarios.
