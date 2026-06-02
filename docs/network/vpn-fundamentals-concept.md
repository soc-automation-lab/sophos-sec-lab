# VPN Fundamentals Concept

## Purpose

This document summarizes VPN concepts relevant to firewall and network security operations.
The current lab does not yet implement a full VPN scenario, but the design notes define how VPN use cases can be added safely later.

## VPN Types

| VPN Type | Typical Use | Key Technical Points |
|---|---|---|
| Remote Access VPN | Individual users connect from outside | User authentication, MFA, client software, assigned VPN IP pool |
| Site-to-Site VPN | Two networks or locations are connected | IPsec tunnel, peer gateways, encryption domains, routing |
| SSL-VPN | Remote access over TLS/SSL | Often easier for user access and client deployment |
| IPsec VPN | Network-to-network or remote access VPN | Strong standard for site connectivity and routing scenarios |

## Remote Access VPN Design Notes

| Design Item | Recommended Approach | Reason |
|---|---|---|
| Authentication | Use named users and MFA where possible | Reduces risk from stolen passwords |
| VPN address pool | Use a dedicated VPN subnet | Easier routing and logging |
| Access scope | Permit only required internal services | Avoids unnecessary broad access |
| Logging | Log authentication and connection events | Supports troubleshooting and auditability |
| Split tunnel vs full tunnel | Decide based on security and bandwidth requirements | Controls whether internet traffic also flows through VPN |

## Site-to-Site VPN Design Notes

| Design Item | Recommended Approach | Reason |
|---|---|---|
| Local networks | Document all local subnets | Prevents routing and encryption-domain mistakes |
| Remote networks | Document all remote subnets | Required for tunnel policy matching |
| Pre-shared key / certificates | Store securely and never commit to Git | Prevents credential exposure |
| Routing | Define static or dynamic routes clearly | Ensures traffic uses the intended tunnel |
| Monitoring | Track tunnel status and logs | Supports operational troubleshooting |

## Example Remote Access Traffic Matrix

| Source | Destination | Service | Default Decision | Reason |
|---|---|---|---|---|
| VPN_USERS | MGMT | HTTPS to firewall/admin tools | Allow only for admin users | Controlled administration access |
| VPN_USERS | LAN_SERVERS | Required application ports | Allow only when documented | Business application access |
| VPN_USERS | GUEST | Any | Deny | No reason for VPN users to access guest network |
| VPN_USERS | WAN | Any | Depends on split/full tunnel policy | Defined by VPN architecture |

## Troubleshooting Checklist

| Symptom | Check |
|---|---|
| VPN login fails | User, password, MFA, group membership, certificate validity |
| VPN connects but no internal access | VPN pool, firewall rules, routes, DNS, allowed networks |
| Site tunnel is down | Peer IP, phase 1/phase 2 settings, PSK/certificates, NAT traversal |
| Tunnel up but no traffic | Encryption domains, routing, firewall rules, return path |
| DNS fails over VPN | Assigned DNS server, split DNS, internal resolver reachability |

## Lab Extension Idea

A future extension can add a remote-access VPN test case with a dedicated VPN user group and a restricted rule set.
The goal would be to validate user authentication, VPN IP assignment, allowed internal access and denied non-required access.
