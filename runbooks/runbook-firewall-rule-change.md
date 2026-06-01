# Runbook: Firewall Rule Change

## Purpose

This runbook describes a structured process for firewall rule changes.

## Change Steps

1. Define the business or lab requirement.
2. Identify source zone and source IP/network.
3. Identify destination zone and destination IP/network.
4. Identify required service or port.
5. Decide whether NAT is required.
6. Enable logging if the rule is relevant for troubleshooting.
7. Test the rule.
8. Document the result.
9. Define rollback steps.

## Rule Documentation Template

| Field | Value |
|---|---|
| Change ID | CHG-YYYYMMDD-001 |
| Source Zone | LAN |
| Source Network | 10.10.10.0/24 |
| Destination Zone | WAN |
| Destination | Any or specific target |
| Service | HTTP/HTTPS/DNS |
| NAT | Masquerading |
| Logging | Enabled |
| Test Method | Test-NetConnection, browser, Sophos logs |
| Rollback | Disable or remove rule |

## Security Principle

Firewall rules should be as specific as possible.
Broad allow rules are only acceptable for initial testing and should later be optimized.
