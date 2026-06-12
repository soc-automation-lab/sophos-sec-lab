# Sophos VPN Inventory

## Purpose

This document summarizes the observed VPN feature state of the Sophos Firewall lab.

## VPN Areas

| Area | Purpose | Observed State |
|---|---|---|
| Remote access VPN | Allows individual users to connect to the firewall remotely | Not configured |
| Site-to-site IPsec VPN | Connects networks or locations through IPsec tunnels | Not configured |
| Site-to-site SSL-VPN | Alternative VPN-based site-to-site connectivity | Not configured |
| Amazon VPC VPN | Cloud connectivity template for AWS scenarios | Not configured |

## Remote Access VPN Observations

| Feature | Observed State | Interpretation |
|---|---|---|
| SSL-VPN policies | No entries | No remote access users or groups are currently enabled |
| SSL-VPN client download | Available area | Client distribution would be relevant after configuration |
| SSL-VPN logs | Available area | Used for troubleshooting connection attempts |
| IPsec remote access | Disabled | Requires interface, authentication, users/groups and client IP range |
| L2TP / PPTP | Available tabs | Legacy options; PPTP should generally be avoided |
| Clientless SSL-VPN policy | Available tab | Useful for browser-based access to selected internal resources |

## Global SSL-VPN Settings

| Option | Security Meaning |
|---|---|
| Use as default gateway | Enables full-tunnel behavior if used |
| Allowed network resources | Defines which internal networks are reachable through the tunnel |
| Send Security Heartbeat through tunnel | Requires Sophos endpoint integration |
| Allow users to save username and password | Convenience option with security implications |
| Require 2FA token | Strongly recommended for production remote access |
| Run AD logon script | Relevant in Active Directory environments |
| Auto-connect tunnel | Useful for managed endpoint scenarios |
| Assign client DNS suffix | Helps resolve internal hostnames |

## Site-to-Site VPN Observations

| Feature | Observed State | Interpretation |
|---|---|---|
| IPsec connections | No entries | No branch or peer tunnel is configured |
| IPsec failover groups | No entries | No redundant VPN path is configured |
| IPsec profiles | Available | Profiles define encryption and negotiation parameters |
| Device access warning | Present | IPsec must be allowed from the WAN zone if inbound VPN is required |
| Site-to-site SSL-VPN server/client | No entries | Not used in the current lab |

## Production-Oriented Design Notes

Remote access VPN should not be treated as a simple connectivity feature only.

A production design should include:

- named users or groups
- multi-factor authentication
- least-privilege firewall rules from VPN to internal networks
- internal DNS and DNS suffix assignment
- logging and alerting
- user offboarding process
- documented split-tunnel or full-tunnel decision

Site-to-site VPN should include:

- local and remote network definitions
- routing and firewall policies
- tunnel monitoring
- failover design if required
- key or certificate management
- change documentation

## Lab Feasibility

| Use Case | Feasibility | Notes |
|---|---|---|
| Remote access VPN concept | High | Can be documented without exposing services |
| Remote access VPN practical test | Medium | Requires a WAN-side test client and user/authentication configuration |
| Site-to-site VPN concept | High | Very relevant for branch connectivity planning |
| Site-to-site VPN practical test | Medium | Requires a second VPN peer such as another firewall, strongSwan or cloud peer |
| VPN troubleshooting runbook | High | Can be built around logs, firewall rules, routes and expected ports |

## Current Scope Decision

VPN is documented as part of the M8 inventory.

No VPN tunnel is enabled in the current lab because the environment does not yet include a realistic external VPN client, authentication backend or second site-to-site peer.
