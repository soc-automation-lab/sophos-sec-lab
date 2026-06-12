# Runbook: Operational Firewall Use Case Review

## Purpose

This runbook provides a compact review workflow for operational Sophos Firewall use cases.

## Review Order

1. Check network and policy inventory.
2. Check client IP configuration.
3. Check DNS resolution.
4. Check firewall rule match.
5. Check NAT rule match.
6. Check WAN gateway and routing.
7. Check appliance access separately.
8. Check logging and reporting.
9. Document result and remaining risk.

## Evidence Sources

- PowerShell client tests
- Sophos firewall logs
- Sophos reports
- Rule and NAT usage counters
- Sanitized Markdown documentation
- Git commit and tag history

## Operational Note

A use case is considered useful when it helps isolate a real operational question and produces repeatable evidence.
