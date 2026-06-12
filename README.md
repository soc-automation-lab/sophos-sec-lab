# Sophos Security Lab on Hyper-V

This repository documents a local Sophos Firewall Home Edition lab on Microsoft Hyper-V for practical firewall, network security and operations scenarios.

## Project Status

**Status:** Completed initial project scope at 1.0-use-case-completion.

The project documents 15 Sophos Firewall use cases:

| Category | Count |
|---|---:|
| Practical / operational use cases | 9 |
| Conceptual / operational use cases | 6 |
| Total documented use cases | 15 |

The lab intentionally avoids artificial complexity. Use cases that require additional infrastructure, such as a DMZ server, internal DNS server, syslog collector, NetFlow collector or VPN peer, are documented conceptually and can be implemented later as separate expansion milestones.

## Goal

The goal of this project is to build and document a local Sophos Firewall Home Edition lab for practical firewall and network security operations in a controlled environment.

Main learning and documentation areas:

- Sophos Firewall / XGS-like administration basics
- Firewall rule design and least-privilege validation
- NAT, MASQ/SNAT and outbound web access
- DHCP, DNS, HTTP/S and TCP/IP troubleshooting
- Routing, gateway validation and WAN path analysis
- Appliance access, API access and management-plane hardening
- VPN and branch connectivity concepts
- DMZ, guest isolation and segmentation concepts
- Syslog, SIEM, NetFlow and monitoring readiness
- Backup, firmware and rollback planning
- Evidence-based technical documentation

## Target Architecture

The lab uses Hyper-V virtual switches and a local Sophos Firewall VM to avoid unnecessary exposure of the home network.

| Network | Subnet | Gateway | Purpose |
|---|---|---|---|
| WAN-NAT | 172.30.10.0/24 | 172.30.10.1 | Simulated WAN via Windows host WinNAT |
| LAN | 10.10.10.0/24 | 10.10.10.1 | Internal client network behind Sophos |
| DMZ | optional / future | optional / future | Optional segmented server network |

## Virtual Machines

| VM | Purpose | Status |
|---|---|---|
| vm-sophos-fw-01 | Sophos Firewall Home Edition | Implemented |
| vm-win-client-01 | Windows LAN test client | Implemented |
| Additional DMZ / DNS / logging / VPN peer VM | Future expansion | Not required for initial v1.0 scope |

## Documented Use Cases

| ID | Use Case | Type |
|---|---|---|
| UC-01 | Client internet access troubleshooting | Practical / operational |
| UC-02 | Firewall rule validation and least-privilege verification | Practical / operational |
| UC-03 | Firewall Health Check review | Practical / operational |
| UC-04 | Network and policy inventory | Practical / operational |
| UC-05 | Appliance access hardening review | Practical / operational |
| UC-06 | DHCP and DNS troubleshooting | Practical / operational |
| UC-07 | NAT rule review and cleanup | Practical / operational |
| UC-08 | DMZ web server publishing | Conceptual / operational |
| UC-09 | LAN to DMZ segmentation | Conceptual / operational |
| UC-10 | Guest network isolation concept | Conceptual / operational |
| UC-11 | DNS architecture with internal resolver | Conceptual / operational |
| UC-12 | Syslog and SIEM integration concept | Conceptual / operational |
| UC-13 | Backup, firmware and rollback procedure | Practical / operational |
| UC-14 | VPN and branch connectivity concept | Conceptual / operational |
| UC-15 | Microsoft 365 and cloud application visibility | Practical / operational |

## Key Documentation

| Area | Document |
|---|---|
| Use case completion | docs/planning/use-case-completion-matrix.md |
| Use case backlog | docs/planning/firewall-use-case-backlog.md |
| Routing inventory | docs/planning/sophos-routing-inventory.md |
| VPN inventory | docs/planning/sophos-vpn-inventory.md |
| Management and profiles inventory | docs/planning/sophos-management-profiles-inventory.md |
| Administrative access and observability | docs/planning/sophos-administrative-access-observability-inventory.md |
| System services and logging | docs/planning/sophos-system-services-logging-inventory.md |
| Future expansion | runbooks/runbook-future-firewall-expansion.md |

## Milestones

| Milestone | Topic |
|---|---|
| M0 | Project start and repository structure |
| M1 | Hyper-V network design |
| M2 | Sophos Firewall VM installation |
| M3 | LAN client and internet access via Sophos |
| M4 | Firewall rulebase and segmentation |
| M5 | Rulebase optimization and network security concepts |
| M6 | Operational network security concepts |
| M7 | Operational firewall use cases |
| M8 | Firewall use case planning and inventory |
| M9 | Operational use case expansion |
| M10 | Conceptual use case completion |

## Repository Structure

| Path | Purpose |
|---|---|
| docs/ | Architecture, security, planning and operations documentation |
| runbooks/ | Step-by-step operational procedures |
| scripts/ | PowerShell scripts for repeatable lab setup and checks |
| evidence/ | Sanitized command output and lab evidence |
| .local/ | Local installers, ISOs and VHDs excluded from Git |

## Security Boundaries

This is a local lab project. Do not commit:

- VHD/VHDX files
- ISO files
- ZIP installer packages
- passwords
- license keys
- registration data
- private screenshots
- personal information
- configuration backups containing secrets

## Future Expansion Options

- DMZ server publishing with a dedicated server VM
- LAN-to-DMZ segmentation validation
- Guest network isolation with an additional client or AP simulation
- Internal DNS resolver with Windows Server or Linux DNS
- Syslog/SIEM integration with a logging VM
- NetFlow analysis with a flow collector
- Practical VPN testing with an external client or second VPN peer
- Ansible or API-based firewall automation
