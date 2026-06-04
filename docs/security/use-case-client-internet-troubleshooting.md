# Use Case: Client Internet Access Troubleshooting

## Purpose

This use case documents a structured method for troubleshooting client internet access through Sophos Firewall.

The goal is not only to prove that internet access works, but to show how to distinguish between client, DNS, firewall policy, NAT, routing and WAN problems.

## Lab Context

| Component | Value |
|---|---|
| Client VM | vm-win-client-01 |
| Client IP | 10.10.10.100 |
| Client gateway | 10.10.10.1 |
| Sophos LAN interface | PortA |
| Sophos LAN IP | 10.10.10.1/24 |
| Sophos WAN interface | PortB |
| Sophos WAN IP | 172.30.10.2/24 |
| Upstream lab router | 172.30.10.1 |
| Active web firewall rule | LAN_to_WAN_Web |
| Active NAT rule | NAT_LAN_to_WAN_Web |

## Method

The troubleshooting process uses three perspectives.

| Perspective | Purpose |
|---|---|
| Client perspective | Verifies IP configuration, default gateway, DNS resolution and real TCP/HTTPS reachability from the affected endpoint. |
| Firewall log perspective | Verifies which firewall rule, NAT rule and interfaces were used for the observed traffic. |
| Firewall diagnostic perspective | Verifies DNS, route lookup and WAN reachability from the firewall itself. |

## Client-Side Checks

The Windows client is checked first because user-impacting issues must be validated from the affected endpoint.

Recommended checks:

    Get-NetIPConfiguration
    Get-NetRoute -DestinationPrefix "0.0.0.0/0"
    Resolve-DnsName example.com
    Test-NetConnection -ComputerName 10.10.10.1 -Port 4444 -InformationLevel Detailed
    Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Detailed
    Invoke-WebRequest -Uri "https://example.com" -UseBasicParsing
    Test-NetConnection -ComputerName 1.1.1.1 -Port 22 -InformationLevel Detailed

## Expected Client-Side Results

| Check | Expected Result | Interpretation |
|---|---|---|
| Client IP | 10.10.10.100/24 or another valid LAN address | DHCP and LAN addressing work. |
| Default gateway | 10.10.10.1 | The client forwards non-local traffic to Sophos. |
| DNS resolution | example.com resolves successfully | DNS works from the client perspective. |
| Sophos WebAdmin TCP/4444 | Successful | The client can reach Sophos on the LAN interface. |
| HTTPS TCP/443 | Successful | Web access works through the firewall path. |
| HTTPS web request | HTTP 200 OK | Application-level HTTPS retrieval works. |
| TCP/22 to 1.1.1.1 | Not successful | Non-web traffic is not broadly allowed by the web-only rule. |

## Sophos Firewall Log Validation

In Sophos WebAdmin:

    Protokollansicht
    Protokolltyp: Firewall
    Filter: Quell-IP ist 10.10.10.100

Expected log indicators for HTTPS traffic:

| Field | Expected Value |
|---|---|
| Action | Allowed |
| Firewall rule | LAN_to_WAN_Web |
| NAT rule | NAT_LAN_to_WAN_Web |
| Incoming interface | PortA |
| Outgoing interface | PortB |
| Source IP | 10.10.10.100 |
| Destination port | 443 |
| Protocol | TCP |

This confirms that client traffic is not only working, but is also handled by the intended firewall and NAT policy.

## Sophos Diagnostic Checks

In Sophos WebAdmin:

    Überwachen & Analysieren
    Diagnose
    Tools

Recommended checks:

| Tool | Example Input | Purpose |
|---|---|---|
| Name resolution | example.com | Verifies DNS from the firewall perspective. |
| Ping | 1.1.1.1 | Verifies basic WAN reachability from the firewall perspective. |
| Route lookup | 1.1.1.1 | Verifies the firewall routing decision and outgoing path. |
| Traceroute | 1.1.1.1 or an internal VPN target | Helps identify the Layer-3 path if ICMP/TTL responses are not blocked. |

## Interpreting Failures

| Observation | Likely Area |
|---|---|
| Client has no valid IP address | DHCP, VLAN, switch, vSwitch, interface assignment |
| Client has IP but no default gateway | DHCP option or local client configuration |
| Client cannot reach 10.10.10.1 | LAN segment, client NIC, Sophos PortA, local firewall |
| DNS fails but IP-based tests work | DNS configuration, DNS forwarding, DNS policy |
| Sophos can reach the internet but the client cannot | Firewall rule, NAT, client route or client policy |
| Sophos route lookup shows the wrong interface | Routing problem |
| Sophos logs show denied traffic | Firewall rule, service, zone or rule order problem |
| Sophos logs show allowed traffic but the client gets no response | NAT, WAN, upstream routing or return path problem |
| Only some ports work | Firewall service definition or least-privilege policy is working as designed |

## Non-ICMP Connectivity Testing

ICMP ping is often blocked or rate-limited. A successful or failed ping alone is not a complete connectivity test.

More useful non-ICMP checks include:

| Test Type | Example |
|---|---|
| TCP handshake | Test-NetConnection target -Port 443 |
| HTTPS transaction | Invoke-WebRequest https://target |
| DNS query | Resolve-DnsName target |
| Application-specific check | TCP/443 to web app, TCP/445 to file server, TCP/3389 to RDP target |
| Agent heartbeat | Endpoint or monitoring agent reports status to central platform |

## Centralized Client or Branch Health Checks

A central site should not usually open inbound ports to every client only for testing.

A safer design is client-initiated or probe-based monitoring:

| Pattern | Description |
|---|---|
| Client-initiated check | The endpoint runs tests and sends results to a central HTTPS endpoint, SIEM, RMM or endpoint management platform. |
| Branch monitoring probe | A probe inside the branch network tests DNS, VPN, internal services and internet access. |
| Passive telemetry | Firewall, DNS, DHCP, VPN and endpoint logs are correlated centrally. |
| Synthetic transaction | A probe performs regular application-level checks, for example HTTPS login page reachability. |

This approach validates the real user path without relying on ICMP and without unnecessarily exposing inbound services on clients.

## Operational Summary

A strong troubleshooting workflow combines:

- Client-side IP, route, DNS and TCP/HTTPS tests.
- Sophos firewall logs filtered by client source IP.
- Sophos diagnostic tools for DNS, ping, route lookup and traceroute.
- Non-ICMP tests for application-relevant reachability.
- Clear interpretation of whether the issue is client-side, DNS-related, policy-related, NAT-related, routing-related or WAN-related.
