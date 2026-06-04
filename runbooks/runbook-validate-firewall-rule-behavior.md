# Runbook: Validate Firewall Rule Behavior

## Purpose

This runbook provides a repeatable workflow for validating firewall rule behavior after a rule change or rulebase optimization.

## Step 1: Identify the Rule Scope

Document the intended scope.

    Source zone: LAN
    Destination zone: WAN
    Source network: client LAN
    Destination network: any WAN host
    Services: HTTP and HTTPS
    Action: Allow
    Logging: Enabled
    NAT: Enabled through linked or matching NAT rule

## Step 2: Test Allowed Web Traffic

Run on the affected or test Windows client:

    Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
    Test-NetConnection -ComputerName example.com -Port 80 -InformationLevel Detailed

Expected result:

    TcpTestSucceeded: True

## Step 3: Test a Non-Web Comparison Port

Run on the same client:

    Test-NetConnection -ComputerName 1.1.1.1 -Port 22 -InformationLevel Detailed

Expected result in this lab:

    TcpTestSucceeded: False

This verifies that the web rule does not permit unrelated outbound TCP services.

## Step 4: Validate Sophos Firewall Logs

Open Sophos WebAdmin:

    Protokollansicht
    Protokolltyp: Firewall
    Filter: Quell-IP ist 10.10.10.100

Verify that HTTP and HTTPS traffic use:

    Firewall rule: LAN_to_WAN_Web
    NAT rule: NAT_LAN_to_WAN_Web
    Incoming interface: PortA
    Outgoing interface: PortB
    Action: Allowed

## Step 5: Interpret the Result

| Result | Interpretation |
|---|---|
| HTTP and HTTPS succeed | Intended web traffic is allowed. |
| TCP/22 fails | Non-web traffic is not broadly allowed by the web rule. |
| Logs show LAN_to_WAN_Web | The intended firewall rule is used. |
| Logs show NAT_LAN_to_WAN_Web | The intended NAT behavior is used. |
| Another rule is shown | Rule order or broad allow rules must be reviewed. |

## Step 6: Document the Change

Document:

    Business or technical reason for the rule
    Source and destination zones
    Allowed services
    NAT behavior
    Log validation
    Rollback option
    Test results

## Operational Note

A successful firewall change is not only validated by allowed traffic. It should also be validated by proving that unrelated traffic is not unintentionally allowed.
