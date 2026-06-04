# Runbook: Troubleshoot Client Internet Access

## Purpose

This runbook provides a repeatable workflow for troubleshooting client internet access through Sophos Firewall.

## Step 1: Validate Client Network Configuration

Run on the affected Windows client:

    Get-NetIPConfiguration
    Get-NetRoute -DestinationPrefix "0.0.0.0/0"

Expected result:

    Client IP: 10.10.10.x
    Default gateway: 10.10.10.1
    DNS server: 10.10.10.1 or approved resolver

## Step 2: Validate DNS

Run on the client:

    Resolve-DnsName example.com

If DNS fails but IP-based TCP tests work, focus on DNS configuration, DNS forwarding or DNS policy.

## Step 3: Validate Local Firewall Reachability

Run on the client:

    Test-NetConnection -ComputerName 10.10.10.1 -Port 4444 -InformationLevel Detailed

Expected result:

    TcpTestSucceeded: True

If this fails, check the LAN segment, client NIC, Sophos LAN interface and local endpoint firewall.

## Step 4: Validate HTTPS Internet Access

Run on the client:

    Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
    Invoke-WebRequest -Uri "https://example.com" -UseBasicParsing

Expected result:

    TcpTestSucceeded: True
    HTTP status: 200 OK

## Step 5: Validate Least-Privilege Behavior

Run on the client:

    Test-NetConnection -ComputerName 1.1.1.1 -Port 22 -InformationLevel Detailed

Expected result in this lab:

    TcpTestSucceeded: False

This indicates that the web-only allow rule does not broadly permit arbitrary outbound TCP services.

## Step 6: Validate Sophos Logs

Open Sophos WebAdmin:

    Protokollansicht
    Protokolltyp: Firewall
    Filter: Quell-IP ist 10.10.10.100

Verify:

    Action: Allowed
    Firewall rule: LAN_to_WAN_Web
    NAT rule: NAT_LAN_to_WAN_Web
    Incoming interface: PortA
    Outgoing interface: PortB
    Destination port: 443
    Protocol: TCP

## Step 7: Validate Sophos Diagnostics

Open Sophos WebAdmin:

    Überwachen & Analysieren
    Diagnose
    Tools

Run:

    Name resolution: example.com
    Ping: 1.1.1.1
    Route lookup: 1.1.1.1
    Optional traceroute: 1.1.1.1 or relevant VPN/internal target

## Decision Matrix

| Result | Next Action |
|---|---|
| Client has no valid IP | Check DHCP, switch/vSwitch, VLAN and interface assignment. |
| Client has no default gateway | Check DHCP option or client configuration. |
| DNS fails | Check DNS server assignment, DNS forwarding and DNS rules. |
| TCP/443 fails and Sophos logs deny | Check firewall rule, service object, source zone, destination zone and rule order. |
| TCP/443 fails and no Sophos log appears | Check whether traffic reaches Sophos at all. |
| Sophos logs allow but client receives no response | Check NAT, WAN, upstream routing and return path. |
| Sophos route lookup uses wrong interface | Check route table, VPN routes or policy-based routing. |

## Notes

ICMP ping is useful but not sufficient. For operational troubleshooting, TCP and HTTPS tests are often more meaningful because they validate the actual application path.
