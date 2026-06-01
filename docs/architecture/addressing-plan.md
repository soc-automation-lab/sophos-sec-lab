# Addressing Plan

## Purpose

This document defines the IP addressing plan for the local Sophos Security Lab on Hyper-V.

## Confirmed Lab Networks

| Network | Subnet | Gateway / Host IP | Hyper-V Switch | Purpose |
|---|---:|---:|---|---|
| Sophos WAN-NAT | 172.30.10.0/24 | 172.30.10.1 | vSwitch-sophos-wan-nat | Simulated WAN behind Windows WinNAT |
| Sophos LAN | 10.10.10.0/24 | 10.10.10.254 host mgmt / 10.10.10.1 Sophos later | vSwitch-sophos-lan | Internal client network behind Sophos |

## Planned Sophos Interface Addresses

| Sophos Interface | Planned IP | Zone | Meaning |
|---|---:|---|---|
| WAN | 172.30.10.2/24 | WAN | Upstream side towards Windows host WinNAT |
| LAN | 10.10.10.1/24 | LAN | Default gateway for internal clients |

## Planned Client Addresses

| System | Planned IP | Gateway | Purpose |
|---|---:|---:|---|
| vm-win-client-01 | DHCP or 10.10.10.100/24 | 10.10.10.1 | Windows LAN test client |
| vm-ubuntu-srv-01 | 10.10.10.10/24 or later DMZ address | 10.10.10.1 | Linux test server |

## Existing Non-Sophos Lab Networks

The host also contains older Hyper-V lab networks from previous work.
They are not part of this project and do not overlap with the Sophos lab networks.

| Existing Network | Subnet | Status |
|---|---:|---|
| VULN-NAT | 192.168.66.0/24 | Existing, no overlap |
| VULN-SCAN | 192.168.67.0/24 | Existing, no overlap |

## Notes

- The Sophos WAN side uses Windows WinNAT.
- The Sophos LAN side is an isolated internal Hyper-V network.
- The Windows host management address on the LAN is 10.10.10.254.
- Sophos will later use 10.10.10.1 as the LAN gateway.
