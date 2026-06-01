# Runbook: Connectivity Test

## Purpose

This runbook describes how to validate basic LAN-to-WAN connectivity through Sophos Firewall.

## Test Environment

| Component | Value |
|---|---|
| Client VM | vm-win-client-01 |
| Client network | Sophos LAN |
| Expected client IP | 10.10.10.100-10.10.10.200 |
| Expected gateway | 10.10.10.1 |
| Expected DNS server | 10.10.10.1 |

## Windows Client Commands

Run the following commands on the Windows test client:

`powershell
ipconfig /all
route print -4
Test-NetConnection -ComputerName 10.10.10.1 -InformationLevel Detailed
Test-NetConnection -ComputerName 10.10.10.1 -Port 4444 -InformationLevel Detailed
Resolve-DnsName example.com
Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
Invoke-WebRequest -Uri "https://example.com" -UseBasicParsing
`",
      ",
      

| Check | Expected Result |
|---|---|
| DHCP | Client receives 10.10.10.x address from Sophos |
| Default route | 0.0.0.0/0 via 10.10.10.1 |
| Gateway reachability | Ping or TCP-based reachability works |
| DNS | example.com resolves successfully |
| HTTPS | TCP/443 succeeds |
| Web request | HTTP status 200 OK for example.com |

## Sophos Log Validation

1. Open Sophos WebAdmin.
2. Go to Protokollansicht.
3. Select Firewall logs.
4. Filter for source IP 10.10.10.100.
5. Verify an allowed TCP/443 entry through #Default_Network_Policy.

## Troubleshooting

- If no log entries appear, enable firewall traffic logging on the matching firewall rule.
- If DHCP fails, check the Sophos LAN DHCP configuration.
- If DNS fails, check the DNS server assigned to the client and Sophos DNS forwarding.
- If TCP/443 fails, check firewall rule, NAT rule and WAN reachability.
- ICMP ping can be blocked while TCP tests still succeed.
