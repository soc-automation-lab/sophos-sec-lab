# Sophos Management, Profile and Central Inventory

## Purpose

This document summarizes observed management, subscription, profile and Sophos Central integration areas of the Sophos Firewall lab.

## Subscription and Feature State

| Area | Observed State | Interpretation |
|---|---|---|
| Base Firewall | Evaluation active | Core firewall, VPN and wireless functions are available in the lab |
| Network Protection | Evaluation active | IPS, Sophos X-Ops and related network protection functions are available for review |
| Web Protection | Evaluation active | Web security, application control and web malware protection are available for review |
| Zero-Day Protection | Evaluation active | Sandbox and machine-learning based protection can be reviewed conceptually |
| Central Orchestration | Evaluation active | Central SD-WAN, VPN orchestration and reporting are available conceptually |
| DNS Protection | Not subscribed | DNS Protection is not implemented in the current lab state |
| NDR Essentials | Not subscribed | NDR is not implemented in the current lab state |
| Email Protection | Evaluation active | Email security features are available for review but not actively used in the lab |
| Web Server Protection | Evaluation active | WAF features are available for future DMZ/web publishing use cases |
| Enhanced Plus Support | Not subscribed | Enhanced Plus Support is not part of the current lab state |

## SNMP State

| Item | Observed State | Interpretation |
|---|---|---|
| SNMP agent | Disabled | The firewall is not currently monitored via SNMP |
| SNMPv3 users | No entries | Secure SNMP monitoring is not configured |
| SNMPv1/v2c | No entries | Legacy SNMP monitoring is not configured |
| MIB download | Available | Monitoring integration could be prepared if SNMP is enabled later |

## Profile Inventory

| Profile Area | Purpose | Observed State |
|---|---|---|
| Schedule | Defines time windows for rules and policies | Default schedules are available |
| Access time | Allows or denies access during defined periods | Default access time profiles are available |
| Surfing quota | Limits internet access time | Default quota profiles are available |
| Network traffic quota | Limits transferred data volume | Default quota profiles are available |
| Decryption profiles | Defines TLS inspection behavior | Standard decryption profiles are available |
| IPsec profiles | Defines VPN cryptographic parameters | Multiple default IPsec profiles are available |
| Appliance access profiles | Defines administrative access roles | Default admin role profiles are available |

## Important Operational Distinctions

Profiles are reusable policy objects.

They do not automatically change traffic behavior until they are assigned to firewall rules, VPN connections, authentication policies or other configuration areas.

The appliance access profiles define administrative roles and permissions.

They are different from zone-based appliance access settings, which define from which network zones firewall services such as HTTPS, SSH, DNS, Ping or VPN are reachable.

## Sophos Central State

| Feature | Observed State | Interpretation |
|---|---|---|
| Sophos Central registration | Not registered | Central-managed functions are not available in the current lab state |
| Security Heartbeat | Disabled | Requires Sophos Central and Sophos Endpoint integration |
| Synchronized Application Control | Disabled | Requires Sophos Endpoint and Sophos Central integration |
| Sophos Central services | Disabled | Central management, reporting and related services are not configured |
| ZTNA integration | Available conceptually | Requires Sophos Central and additional ZTNA configuration |

## Practical Use Cases Derived From This Inventory

| Use Case | Feasibility | Notes |
|---|---|---|
| Appliance access hardening review | High | Review management services, roles and reachable zones |
| SNMP monitoring readiness | Medium | Can be documented now; practical test requires monitoring target |
| Role-based administration concept | High | Can be documented based on available admin profiles |
| TLS decryption profile review | Medium | Conceptual review recommended before enabling full TLS inspection |
| IPsec profile review | High | Useful for VPN design and troubleshooting documentation |
| Sophos Central integration concept | High | Important for understanding Central, Heartbeat, SAC and ZTNA dependencies |

## Current Scope Decision

Management, profile and Sophos Central capabilities are documented as part of the M8 inventory.

SNMP, Sophos Central registration, Security Heartbeat and Synchronized Application Control are not enabled in the current lab state.
