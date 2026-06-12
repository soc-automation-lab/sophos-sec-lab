# Use Case UC-06: DHCP and DNS Troubleshooting

## Purpose

This use case documents how DHCP and DNS problems are isolated in the Sophos Firewall lab.

## Operational Scenario

A client reports that internet access does not work. The administrator must determine whether the problem is IP addressing, gateway assignment, DNS resolution, firewall policy, NAT, routing or WAN connectivity.

## Observed Lab State

| Area | Observed State |
|---|---|
| DHCP server | Active on PortA / LAN |
| DHCP range | 10.10.10.100 - 10.10.10.200 |
| Client IP | 10.10.10.100 |
| Client gateway | 10.10.10.1 |
| Sophos DNS | Static upstream DNS: 1.1.1.1 and 8.8.8.8 |
| DNS service | Running |

## Troubleshooting Chain

| Step | Test | Meaning |
|---|---|---|
| 1 | Check client IP configuration | Verifies DHCP assignment |
| 2 | Ping or test gateway 10.10.10.1 | Verifies local LAN reachability |
| 3 | Resolve a domain name | Verifies DNS path |
| 4 | Test TCP/443 to an internet host | Verifies routed web connectivity |
| 5 | Check firewall logs | Verifies matching firewall rule and NAT rule |
| 6 | Check Sophos route lookup | Verifies WAN routing path |

## Result

DHCP and DNS are treated as separate troubleshooting layers before firewall rules, NAT and WAN routing are evaluated.
