# Technical Scope Mapping

## Purpose

This document maps the lab implementation to general firewall and network operations capabilities.

## Capability Mapping

| Capability | Project Evidence | Practical Meaning |
|---|---|---|
| Sophos firewall administration | Sophos Firewall Home Edition installed and configured | WebAdmin, zones, interfaces, rules, NAT and logs |
| Firewall rules | #Default_Network_Policy analyzed and logging enabled | Rule interpretation and rulebase improvement |
| NAT | #NAT_Default_Network_Policy verified | Source NAT/masquerading for LAN-to-WAN traffic |
| TCP/IP | Client IP, gateway, route and port tests validated | Structured network troubleshooting from endpoint to firewall |
| DNS | Client DNS via Sophos verified | Distinguishing DNS issues from routing or firewall issues |
| HTTP/S | HTTPS to example.com validated and logged | TCP/443 testing and firewall log interpretation |
| VPN fundamentals | Planned documentation module | SSL-VPN, IPsec, split tunnel, full tunnel and MFA concepts |
| VLAN concepts | Planned documentation module | Access ports, trunk ports and network segmentation |
| Troubleshooting | Test-NetConnection, Resolve-DnsName and Sophos logs | Methodical fault isolation instead of guessing |
| Documentation | Git, Markdown docs and evidence files | Change documentation and auditability |
| Cloud-security awareness | Planned concept module | MFA, Conditional Access, identity-centric security and logging |

## Transfer to Larger Environments

- Client networks must be segmented and routed through defined firewall interfaces.
- Firewall rules should be specific, documented and logged.
- NAT behavior must be understood and validated.
- DNS, DHCP, HTTP/S and routing issues must be troubleshot systematically.
- Logs must be used to confirm whether traffic is allowed, denied or misrouted.
- Changes should be documented with purpose, validation and rollback notes.

## Lab Boundary

The local Hyper-V implementation is a controlled lab platform.
It demonstrates technical workflows and operational logic without claiming to represent any specific production environment.
