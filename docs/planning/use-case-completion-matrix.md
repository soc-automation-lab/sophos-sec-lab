# Use Case Completion Matrix

## Purpose

This matrix summarizes the documented Sophos Firewall use cases in the lab project.

## Completion State

| ID | Use Case | Documentation State | Implementation Type |
|---|---|---|---|
| UC-01 | Client internet access troubleshooting | Documented | Practical / operational |
| UC-02 | Firewall rule validation and least-privilege verification | Documented | Practical / operational |
| UC-03 | Firewall Health Check review | Documented | Practical / operational |
| UC-04 | Network and policy inventory | Documented | Practical / operational |
| UC-05 | Appliance access hardening review | Documented | Practical / operational |
| UC-06 | DHCP and DNS troubleshooting | Documented | Practical / operational |
| UC-07 | NAT rule review and cleanup | Documented | Practical / operational |
| UC-08 | DMZ web server publishing | Documented | Conceptual / operational |
| UC-09 | LAN to DMZ segmentation | Documented | Conceptual / operational |
| UC-10 | Guest network isolation concept | Documented | Conceptual / operational |
| UC-11 | DNS architecture with internal resolver | Documented | Conceptual / operational |
| UC-12 | Syslog and SIEM integration concept | Documented | Conceptual / operational |
| UC-13 | Backup, firmware and rollback procedure | Documented | Practical / operational |
| UC-14 | VPN and branch connectivity concept | Documented | Conceptual / operational |
| UC-15 | Microsoft 365 and cloud application visibility | Documented | Practical / operational |

## Summary

| Category | Count |
|---|---:|
| Total documented use cases | 15 |
| Practical / operational use cases | 9 |
| Conceptual / operational use cases | 6 |

## Scope Decision

The project intentionally avoids artificial complexity.

Use cases that require additional infrastructure, such as a DMZ server, internal DNS server, syslog collector or VPN peer, are documented conceptually and can be implemented later as separate expansion milestones.
