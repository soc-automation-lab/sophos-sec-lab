# Technical Summary

## What this project demonstrates

This lab demonstrates a complete local Sophos Firewall traffic path from a Windows client to the internet.
The environment validates LAN/WAN separation, DHCP, DNS, NAT, HTTP/S connectivity and Sophos firewall logging.

## Confirmed Traffic Path

vm-win-client-01 -> Sophos PortA/LAN -> firewall policy -> NAT/MASQ -> Sophos PortB/WAN -> Windows WinNAT -> Internet

## Key Technical Points

- Sophos runs as a Generation 1 Hyper-V firewall appliance.
- The Windows client runs as a Generation 2 Hyper-V VM.
- Sophos provides DHCP and DNS service for the LAN client.
- Sophos acts as the default gateway for the LAN.
- LAN-to-WAN traffic is source-NATed using MASQ.
- HTTPS traffic is visible in Sophos firewall logs.
- Documentation and evidence are sanitized for repository use.

## Current Next Steps

- Create a service-specific LAN-to-WAN web rule.
- Add a linked NAT rule using MASQ where required.
- Validate allowed HTTP/HTTPS traffic.
- Validate blocked non-approved traffic.
- Document VLAN, VPN and cloud-security concepts as separate extension notes.
