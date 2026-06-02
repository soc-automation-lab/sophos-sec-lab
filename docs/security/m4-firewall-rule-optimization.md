# M4 Firewall Rule Optimization

## Purpose

This document describes the optimization of the initial Sophos LAN-to-WAN firewall policy.
The goal is to move from a broad any-service rule toward a more specific and documented rulebase.

## Initial Baseline

| Field | Initial Value |
|---|---|
| Firewall rule | #Default_Network_Policy |
| Source zone | LAN |
| Source networks | Any |
| Destination zone | WAN |
| Destination networks | Any |
| Services | Any |
| Action | Allow |
| NAT rule | #NAT_Default_Network_Policy |
| Logging | Enabled during M3 |

## Problem Statement

The initial default policy was functional but too broad for a security-oriented firewall rulebase.
A production-like firewall rule should be specific, documented, logged and testable.

## Implemented Rulebase Change

| Rule | Source | Destination | Service | Action | NAT | Logging | Status |
|---|---|---|---|---|---|---|---|
| LAN_to_WAN_Web | LAN / Any host | WAN / Any host | HTTP, HTTPS | Allow | NAT_LAN_to_WAN_Web / MASQ | Enabled | Active |
| #Default_Network_Policy | LAN / Any host | WAN / Any host | Any | Allow | #NAT_Default_Network_Policy / MASQ | Enabled | Disabled |
| Alle verwerfen | Any | Any | Any | Drop/Reject | None | Platform default | Active |

## Rule Order

Firewall rules are evaluated from top to bottom.
The specific LAN_to_WAN_Web rule must be placed above broader LAN-to-WAN rules.
After validation, the broad #Default_Network_Policy was disabled to avoid allowing any-service traffic from LAN to WAN.

## NAT Interpretation

MASQ means masquerading and is a dynamic source NAT method.
For outbound LAN-to-WAN traffic, the internal client source IP is translated to the firewall's outgoing WAN-side address.

| NAT Term | Meaning | Example Use |
|---|---|---|
| SNAT | Source NAT changes the source IP | Internal client traffic leaving through WAN |
| DNAT | Destination NAT changes the destination IP | Inbound port forwarding to an internal server |
| PAT | Port Address Translation changes a port | WAN port 8443 forwarded to internal 443 |
| MASQ | Dynamic SNAT using the outgoing interface address | LAN client traffic using Sophos PortB/WAN address |

## Validation Results

| Test | Result | Interpretation |
|---|---|---|
| HTTPS to example.com TCP/443 | Successful | Approved web traffic is allowed by LAN_to_WAN_Web |
| Sophos firewall log for HTTPS | Successful | LAN_to_WAN_Web and NAT_LAN_to_WAN_Web were matched |
| TCP/22 to 1.1.1.1 after disabling #Default_Network_Policy | Not successful | Non-web traffic is no longer broadly successful from the client perspective |
| DNS resolution for example.com | Successful | Client DNS via Sophos remains functional |

## Correction Note

A TCP/22 test performed before disabling #Default_Network_Policy was still shown as allowed by the broad default policy.
This was used as a validation finding and led to the controlled deactivation of #Default_Network_Policy.

## Operational Interpretation

The rulebase now follows a more specific allow-list approach for web traffic.
Instead of relying on a broad any-service LAN-to-WAN policy, HTTP and HTTPS are handled by a dedicated logged rule.
This improves troubleshooting because the matching rule is visible in Sophos logs and the intended service scope is clear.

## Rollback

The broad #Default_Network_Policy was disabled rather than deleted.
If required during troubleshooting, it can be re-enabled temporarily and then reviewed again.
