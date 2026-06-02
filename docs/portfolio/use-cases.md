# Sophos Security Lab Use Cases

## Purpose

This document maps the local Sophos Security Lab to practical firewall and network security operations use cases.
The focus is on reproducible technical validation, network troubleshooting, firewall rule analysis and sanitized documentation.

## Use Case Overview

| ID | Use Case | Status | Demonstrated Skills |
|---|---|---|---|
| UC01 | Sophos Firewall VM deployment on Hyper-V | Completed | Virtual appliance setup, resource planning, interface mapping |
| UC02 | Hyper-V WAN/LAN network foundation | Completed | Internal switches, WinNAT, addressing plan, isolated lab design |
| UC03 | Sophos initial setup and WAN uplink | Completed | Static WAN IP, gateway, DNS and update reachability |
| UC04 | LAN client DHCP through Sophos | Completed | DHCP, default gateway, DNS assignment, client validation |
| UC05 | LAN-to-WAN internet access via NAT | Completed | NAT/MASQ, routing, client-to-internet traffic path |
| UC06 | Firewall log validation for HTTPS traffic | Completed | Rule logging, source/destination/port interpretation, allowed traffic analysis |
| UC07 | Rulebase optimization and least-privilege concept | In progress | Rule matrix, default policy review, service-specific allow rules |
| UC08 | Blocked traffic validation | Planned | Default-deny thinking, denied traffic logs, troubleshooting |
| UC09 | VLAN and switch integration concept | Planned documentation | Access ports, trunk ports, VLAN segmentation, firewall uplinks |
| UC10 | VPN and cloud-security concept | Planned documentation | SSL-VPN, IPsec, MFA, identity-aware access and cloud-security awareness |

## Completed Technical Evidence

| Area | Evidence |
|---|---|
| Hyper-V readiness | Hyper-V feature, host RAM, switches and WinNAT checked |
| Network foundation | vSwitch-sophos-wan-nat and vSwitch-sophos-lan created and documented |
| Sophos VM | vm-sophos-fw-01 created with PortA/LAN and PortB/WAN mapping |
| Sophos WebAdmin | WebAdmin reachable at https://10.10.10.1:4444 |
| Windows client | vm-win-client-01 installed and connected to Sophos LAN |
| DHCP | Client received 10.10.10.100/24 from Sophos |
| DNS | Client used Sophos 10.10.10.1 as DNS server |
| NAT/HTTPS | Client reached example.com over TCP/443 |
| Firewall logs | Sophos log showed allowed TCP/443 traffic from 10.10.10.100 to 104.20.23.154 |

## Operational Focus

This project focuses on operational firewall and network administration patterns.
Each use case follows a repeatable workflow: plan, implement, test, validate, document and version-control sanitized evidence.
