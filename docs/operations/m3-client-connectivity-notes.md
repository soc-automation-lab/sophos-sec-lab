# M3 Windows Client Connectivity Notes

## Purpose

This document summarizes the Windows client connectivity validation through Sophos Firewall.

## Test Client

| Item | Value |
|---|---|
| VM name | vm-win-client-01 |
| Operating system | Windows 11 Enterprise Evaluation |
| Hyper-V switch | vSwitch-sophos-lan |
| Addressing | DHCP from Sophos Firewall |

## Verified Client Network Configuration

| Parameter | Value |
|---|---|
| IPv4 address | 10.10.10.100/24 |
| Default gateway | 10.10.10.1 |
| DHCP server | 10.10.10.1 |
| DNS server | 10.10.10.1 |

## Verified Connectivity

| Test | Result |
|---|---|
| Ping to Sophos LAN gateway 10.10.10.1 | Successful |
| TCP/4444 to Sophos WebAdmin | Successful |
| DNS resolution for example.com | Successful |
| HTTPS to example.com TCP/443 | Successful |
| HTTP response from https://example.com | 200 OK |

## Verified Sophos Firewall Log

| Field | Value |
|---|---|
| Source IP | 10.10.10.100 |
| Destination IP | 104.20.23.154 |
| Destination port | 443 |
| Protocol | TCP |
| Action | Allowed |
| Firewall rule | #Default_Network_Policy |
| NAT rule | #NAT_Default_Network_Policy |
| Incoming interface | PortA |
| Outgoing interface | PortB |

## Confirmed Traffic Path

vm-win-client-01 -> Sophos PortA/LAN -> #Default_Network_Policy -> #NAT_Default_Network_Policy -> Sophos PortB/WAN -> Windows WinNAT -> Internet

## Operational Learning

- DHCP validation confirms that Sophos acts as the LAN network service for clients.
- Gateway validation confirms that the client forwards non-local traffic to Sophos.
- DNS validation confirms that name resolution works through the firewall path.
- TCP/443 validation confirms real internet connectivity from the client perspective.
- Firewall log validation confirms that the traffic is visible and attributable in Sophos.
- Enabling logging on the rule is required for useful troubleshooting evidence.
