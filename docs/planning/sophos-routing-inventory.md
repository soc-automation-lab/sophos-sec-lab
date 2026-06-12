# Sophos Routing Inventory

## Purpose

This document summarizes the observed routing state of the Sophos Firewall lab.

## Gateway State

| Item | Value |
|---|---|
| Active IPv4 gateway | GW_WAN_WINNAT |
| Gateway IP | 172.30.10.1 |
| Gateway interface | PortB |
| Sophos PortB IP | 172.30.10.2/24 |
| Gateway status | Active / green |
| Health check | Enabled |

## Current Traffic Path

`	ext
vm-win-client-01
10.10.10.100
   -> Sophos PortA / LAN
      10.10.10.1
   -> Firewall policy and NAT
   -> Sophos PortB / WAN
      172.30.10.2
   -> GW_WAN_WINNAT
      172.30.10.1
   -> Windows Host WinNAT
   -> Internet
`",
  ",
  

| Feature | Observed State | Lab Interpretation |
|---|---|---|
| Gateways | One active IPv4 gateway configured | Required for WAN forwarding through WinNAT |
| SD-WAN routes | No entries | Not required with a single WAN path |
| SD-WAN profiles | No entries | Not required without multiple gateways |
| Static IPv4 routes | No entries | Directly connected networks and default gateway are sufficient |
| Static IPv6 routes | No entries | IPv6 is not part of the current lab scope |
| BGP | Not configured | Dynamic provider or datacenter routing is out of scope |
| OSPF / OSPFv3 | Not configured | Internal dynamic routing is out of scope |
| Upstream proxy | Disabled | Direct WAN path is used instead of parent proxy forwarding |

## Operational Interpretation

The current lab uses a simple and deterministic routing model.

The Sophos Firewall has directly connected LAN and WAN networks and forwards outbound traffic through the configured WAN gateway GW_WAN_WINNAT.

This is sufficient for client internet access, firewall rule validation, NAT troubleshooting and basic WAN diagnostics.

## Practical Use Cases Derived From Routing

| Use Case | Feasibility | Notes |
|---|---|---|
| WAN gateway validation | High | Can be validated with Sophos route lookup, ping and client connectivity tests |
| Client-to-internet path troubleshooting | High | Requires client view, firewall logs, NAT state and gateway state |
| Static route to additional internal network | Medium | Requires an additional router or server VM |
| SD-WAN failover concept | Medium | Practical test requires a second WAN path |
| VPN route concept | Medium | Practical test requires VPN peer or second firewall |
| BGP or OSPF lab | Low | Possible with router software, but not currently prioritized |

## Current Scope Decision

The routing inventory will be documented as part of M8.

Advanced dynamic routing with BGP or OSPF is not implemented because it would add artificial complexity to the current firewall administration lab.
