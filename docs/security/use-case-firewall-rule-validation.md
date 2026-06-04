# Use Case: Firewall Rule Validation and Least-Privilege Verification

## Purpose

This use case documents how to validate a firewall rule after a rulebase optimization.

The goal is to prove that the intended traffic is allowed, while unrelated traffic is not broadly permitted.

## Lab Context

| Component | Value |
|---|---|
| Client VM | vm-win-client-01 |
| Client IP | 10.10.10.100 |
| Client gateway | 10.10.10.1 |
| Sophos LAN interface | PortA |
| Sophos WAN interface | PortB |
| Active firewall rule | LAN_to_WAN_Web |
| Active NAT rule | NAT_LAN_to_WAN_Web |
| Allowed services | HTTP, HTTPS |
| Comparison service | TCP/22 |

## Validation Goal

The rulebase should allow web traffic from LAN to WAN, but should not allow arbitrary outbound TCP services.

Expected behavior:

| Test | Expected Result |
|---|---|
| TCP/443 to example.com | Successful |
| TCP/80 to example.com | Successful |
| TCP/22 to 1.1.1.1 | Not successful |

## Client-Side Validation

Run on the Windows client:

    Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
    Test-NetConnection -ComputerName example.com -Port 80 -InformationLevel Detailed
    Test-NetConnection -ComputerName 1.1.1.1 -Port 22 -InformationLevel Detailed

The client-side view confirms whether the endpoint can actually establish the tested TCP sessions.

## Firewall Log Validation

Open Sophos WebAdmin:

    Protokollansicht
    Protokolltyp: Firewall
    Filter: Quell-IP ist 10.10.10.100

Expected indicators for allowed HTTP/HTTPS traffic:

| Field | Expected Value |
|---|---|
| Action | Allowed |
| Firewall rule | LAN_to_WAN_Web |
| NAT rule | NAT_LAN_to_WAN_Web |
| Incoming interface | PortA |
| Outgoing interface | PortB |
| Source IP | 10.10.10.100 |
| Destination port | 80 or 443 |
| Protocol | TCP |

## Interpretation

If HTTP and HTTPS succeed while TCP/22 fails, the rulebase follows the least-privilege principle for this lab scenario.

The result means:

- Web traffic is explicitly allowed.
- The configured web rule is used.
- NAT is applied by the intended NAT rule.
- Non-web TCP/22 is not broadly allowed by the web rule.
- The disabled broad default network rule is not required for normal web access.

## Operational Relevance

This workflow is useful after firewall changes, rulebase cleanup, NAT changes and troubleshooting tasks.

A firewall administrator should not only check whether something works, but also whether only the intended traffic works.

## Common Failure Patterns

| Observation | Likely Cause |
|---|---|
| TCP/443 fails and no log entry appears | Traffic may not reach the firewall. |
| TCP/443 fails and log shows denied | Firewall rule, service object, zone or rule order issue. |
| TCP/443 succeeds but wrong rule is used | Rule order or overly broad rule issue. |
| TCP/443 succeeds but no NAT rule is visible | Linked NAT or NAT rule mapping should be reviewed. |
| TCP/22 succeeds unexpectedly | Rulebase may still contain an overly broad allow rule. |
| All tests fail | Client route, DNS, gateway, firewall interface or WAN issue. |

## Result Summary

The lab validation showed that HTTP and HTTPS traffic from the Windows client succeeded through Sophos Firewall, while TCP/22 to 1.1.1.1 did not succeed.

This confirms that the web allow rule supports the intended traffic scope without broadly permitting unrelated outbound services.
