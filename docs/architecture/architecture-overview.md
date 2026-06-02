# Architecture Overview

## Purpose

This document summarizes the implemented Sophos Security Lab architecture.

## High-Level Traffic Path

`	ext
vm-win-client-01
  10.10.10.100/24
        |
        v
vSwitch-sophos-lan
        |
        v
Sophos PortA / LAN
  10.10.10.1/24
        |
        v
Firewall rule: LAN_to_WAN_Web
  HTTP, HTTPS allowed
  Logging enabled
        |
        v
NAT rule: NAT_LAN_to_WAN_Web
  MASQ / source NAT
        |
        v
Sophos PortB / WAN
  172.30.10.2/24
        |
        v
vSwitch-sophos-wan-nat
        |
        v
Windows Host WinNAT
  172.30.10.1/24
        |
        v
Internet
`",
      ",
      

| Component | Function |
|---|---|
| Windows host | Runs Hyper-V, internal switches and WinNAT |
| vSwitch-sophos-wan-nat | Simulated WAN segment for Sophos PortB |
| vSwitch-sophos-lan | Internal LAN segment for Sophos PortA and client VM |
| vm-sophos-fw-01 | Sophos Firewall Home Edition appliance |
| vm-win-client-01 | Windows client used for DHCP, DNS, HTTPS and port tests |

## Sophos Interface Mapping

| Sophos Interface | Lab Network | IP Address | Role |
|---|---|---|---|
| PortA | LAN | 10.10.10.1/24 | Client gateway, DHCP, DNS, WebAdmin access |
| PortB | WAN | 172.30.10.2/24 | Uplink toward Windows host WinNAT |

## Rulebase State

| Rule | Source | Destination | Services | Status | Purpose |
|---|---|---|---|---|---|
| LAN_to_WAN_Web | LAN | WAN | HTTP, HTTPS | Active | Permit normal web access |
| #Default_Network_Policy | LAN | WAN | Any | Disabled | Preserved as rollback fallback |
| Alle verwerfen | Any | Any | Any | Active | Default deny/drop fallback |

## NAT State

| NAT Rule | Type | Purpose |
|---|---|---|
| NAT_LAN_to_WAN_Web | MASQ / SNAT | Translate LAN client source IP to Sophos WAN-side address |

## Validation Summary

| Test | Result |
|---|---|
| Client DHCP from Sophos | Successful |
| Client DNS via Sophos | Successful |
| HTTPS to example.com | Successful |
| Sophos firewall log for HTTPS | Successful |
| TCP/22 after disabling broad rule | Not successful from client perspective |

## Extension Points

- Add DMZ/server segment.
- Add VLAN interface simulation.
- Add VPN remote-access test case.
- Add centralized log export or SIEM integration.
- Add configuration backup and restore procedure.
