# Use Case UC-04: Network and Policy Inventory

## Purpose

This use case documents the current Sophos Firewall network and policy state.

## Operational Scenario

A firewall administrator must be able to quickly understand which interfaces, zones, gateways, DNS settings, DHCP scopes, firewall rules and NAT rules are active.

## Observed Lab State

| Area | Observed State |
|---|---|
| LAN interface | PortA, 10.10.10.1/24 |
| WAN interface | PortB, 172.30.10.2/24 |
| WAN gateway | GW_WAN_WINNAT, 172.30.10.1 |
| Client network | 10.10.10.0/24 |
| Test client | vm-win-client-01, 10.10.10.100 |
| Main firewall rule | LAN_to_WAN_Web |
| Main NAT rule | NAT_LAN_to_WAN_Web |
| Allowed web services | HTTP and HTTPS |
| Default broad network policy | Disabled and kept as fallback |
| Default deny rule | Active |

## Validation Approach

Validation is performed with client-side connectivity tests, Sophos firewall logs and review of rule and NAT usage counters.

## Operational Value

This inventory creates a baseline for troubleshooting, audits, firewall migration preparation and rulebase optimization.

## Result

The current lab has a simple and controlled LAN-to-WAN design with explicit web access and MASQ/SNAT-based outbound NAT.
