# Use Case UC-07: NAT Rule Review and Cleanup

## Purpose

This use case documents NAT rule review and explains how outbound internet access is translated in the Sophos Firewall lab.

## Operational Scenario

A firewall administrator reviews whether NAT rules are specific, still used and linked to the intended firewall rules.

## Observed Lab State

| NAT Rule | Purpose | Interpretation |
|---|---|---|
| NAT_LAN_to_WAN_Web | MASQ/SNAT for LAN web traffic | Main active outbound NAT rule |
| #NAT_Default_Network_Policy | MASQ/SNAT for default policy | Kept as fallback but should not be primary rule |
| Auto added NAT rule for MTA | Mail-related NAT | Not relevant for current web use case |
| Default SNAT IPv4 | Generic default SNAT | Should be reviewed before production use |

## NAT Concept

MASQ is a form of source NAT. The internal client address is translated to the firewall WAN-side address for outbound traffic.

## Review Criteria

- Is the NAT rule still used?
- Is it linked to the correct firewall rule?
- Is the source too broad?
- Is the service scope too broad?
- Is the outgoing interface correct?
- Is the rule order understandable?
- Is an old fallback rule still needed?

## Result

The lab uses explicit outbound NAT for LAN web traffic and documents additional NAT rules as review candidates.
