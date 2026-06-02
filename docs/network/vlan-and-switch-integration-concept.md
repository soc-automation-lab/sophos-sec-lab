# VLAN and Switch Integration Concept

## Purpose

This document explains how the local Sophos Security Lab can be mapped to a larger switched network design.
The current lab uses Hyper-V internal switches instead of physical access switches.
The same security logic can be extended to VLAN-based environments.

## Key Concepts

| Term | Meaning | Practical Relevance |
|---|---|---|
| VLAN | Logical Layer 2 network segment | Separates clients, servers, management and guest systems |
| Access port | Switch port assigned to one VLAN | Used for endpoint devices such as clients or printers |
| Trunk port | Switch port carrying multiple VLANs | Used between switches, routers and firewalls |
| Native VLAN | Untagged VLAN on a trunk | Must be planned carefully to avoid misconfiguration |
| Inter-VLAN routing | Routing between VLANs | Should usually be controlled by firewall rules |
| Default gateway | Router/firewall IP used by clients for non-local traffic | Often placed on firewall VLAN interfaces |

## Example VLAN Plan

| VLAN | Name | Example subnet | Purpose | Gateway concept |
|---:|---|---|---|---|
| 10 | CLIENTS | 10.10.10.0/24 | User workstations | Sophos VLAN interface 10.10.10.1 |
| 20 | SERVERS | 10.10.20.0/24 | Internal servers | Sophos VLAN interface 10.10.20.1 |
| 30 | DMZ | 10.10.30.0/24 | Externally reachable services | Sophos VLAN interface 10.10.30.1 |
| 40 | MGMT | 10.10.40.0/24 | Administration interfaces | Sophos VLAN interface 10.10.40.1 |
| 50 | GUEST | 10.10.50.0/24 | Guest internet access | Sophos VLAN interface 10.10.50.1 |

## Access Port Example

An access port belongs to one VLAN only.
A client connected to an access port in VLAN 10 does not need to understand VLAN tagging.

`	ext
Client PC -> Cisco access port VLAN 10 -> Switch -> Firewall gateway 10.10.10.1
`",
      ",
      

A trunk port transports multiple VLANs by adding VLAN tags to Ethernet frames.
A firewall connected to a trunk can provide separate logical interfaces for multiple VLANs.

`	ext
Cisco switch trunk port
  VLAN 10 CLIENTS
  VLAN 20 SERVERS
  VLAN 30 DMZ
  VLAN 40 MGMT
        |
        v
Sophos physical interface / virtual interface with VLAN subinterfaces
`",
      ",
      

VLANs separate broadcast domains, but they do not automatically enforce security policy between networks.
The firewall should control traffic between VLANs based on source zone, destination zone, service and business need.

Example rule model:

| Source | Destination | Service | Action | Reason |
|---|---|---|---|---|
| CLIENTS | WAN | HTTP, HTTPS | Allow | Normal web access |
| CLIENTS | SERVERS | Required application ports only | Allow | Controlled business application access |
| GUEST | WAN | HTTP, HTTPS, DNS | Allow | Internet-only guest access |
| GUEST | CLIENTS/SERVERS/MGMT | Any | Deny | Prevent guest access to internal systems |
| MGMT | Sophos/Admin interfaces | HTTPS, SSH if required | Allow | Administration access |
| Any | Any | Any | Deny | Default-deny fallback |

## Relationship to the Current Lab

| Current Hyper-V Lab | Larger VLAN-Based Environment |
|---|---|
| vSwitch-sophos-lan | Client VLAN or internal access switch segment |
| vSwitch-sophos-wan-nat | WAN uplink or upstream provider edge |
| PortA / LAN | LAN interface or VLAN interface on Sophos |
| PortB / WAN | WAN interface on Sophos |
| vm-win-client-01 | Endpoint connected to a client VLAN access port |
| LAN_to_WAN_Web | Service-specific outbound firewall rule |

## Operational Notes

- VLAN IDs, subnets and gateway IPs must be documented consistently.
- Trunk ports must allow only the VLANs that are required.
- Management access should be separated from user and guest traffic.
- Firewall logs should be enabled for important allow and deny rules.
- Default-deny thinking should be applied between internal zones, not only at the internet edge.
