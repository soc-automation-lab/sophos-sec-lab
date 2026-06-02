# Runbook: Firewall Rule Change

## Purpose

This runbook describes a controlled firewall rule change workflow for the Sophos Security Lab.

## Change Workflow

| Step | Action | Reason |
|---|---|---|
| 1 | Document current rulebase | Establish baseline before changes |
| 2 | Create specific allow rule above broad rules | Ensure the intended rule is matched first |
| 3 | Enable logging on the new rule | Make validation and troubleshooting possible |
| 4 | Create or verify linked NAT rule | Ensure outbound traffic is source-NATed correctly |
| 5 | Test allowed traffic | Confirm required connectivity still works |
| 6 | Check Sophos logs | Confirm which rule and NAT rule are matched |
| 7 | Disable broad fallback rule | Reduce unnecessary any-service access |
| 8 | Test non-approved traffic | Confirm broad access is no longer available |
| 9 | Document results and rollback | Keep the change auditable and reversible |

## M4 Implemented Rule

| Field | Value |
|---|---|
| Rule name | LAN_to_WAN_Web |
| Source zone | LAN |
| Destination zone | WAN |
| Services | HTTP, HTTPS |
| Action | Allow |
| Logging | Enabled |
| NAT rule | NAT_LAN_to_WAN_Web |
| Position | Above #Default_Network_Policy |

## Disabled Rule

| Field | Value |
|---|---|
| Rule name | #Default_Network_Policy |
| Previous scope | LAN to WAN, any service |
| Final status | Disabled, not deleted |
| Rollback | Re-enable if required for controlled troubleshooting |

## Validation Commands on Windows Client

`powershell
Invoke-WebRequest -Uri "https://example.com" -UseBasicParsing
Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
Test-NetConnection -ComputerName 1.1.1.1 -Port 22 -InformationLevel Detailed
Resolve-DnsName example.com
`",
      ",
      

| Test | Expected Result |
|---|---|
| HTTPS to example.com | Successful |
| Sophos log for HTTPS | LAN_to_WAN_Web matched |
| NAT log for HTTPS | NAT_LAN_to_WAN_Web matched |
| TCP/22 to 1.1.1.1 | Not successful from client perspective |
| DNS resolution | Successful |

## Troubleshooting Notes

- If HTTPS fails, verify that LAN_to_WAN_Web is enabled and placed above broader or deny rules.
- If HTTPS works but the wrong rule is matched, check firewall rule order.
- If traffic leaves without NAT, verify the linked NAT rule and MASQ configuration.
- If a broad rule still allows non-web traffic, disable or move the broad rule after testing.
- Do not delete fallback rules during lab validation; disabling preserves rollback.
