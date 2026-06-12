# Use Case UC-14: VPN and Branch Connectivity Concept

## Purpose

This conceptual-operational use case documents how VPN and branch connectivity would be planned around the Sophos Firewall.

## Operational Scenario

Remote users, administrators or branch networks require secure connectivity to internal resources without exposing those resources directly to the internet.

## Connectivity Types

| Type | Typical Use |
|---|---|
| Remote access SSL-VPN | Individual users or administrators connect remotely |
| Remote access IPsec | Alternative user VPN approach |
| Site-to-site IPsec | Branch office or cloud network connects to headquarters |
| Site-to-site SSL-VPN | Alternative site-to-site VPN model |

## Design Requirements

- Define local and remote networks.
- Decide split tunnel or full tunnel.
- Use named users and groups.
- Require multi-factor authentication for user VPN where possible.
- Define least-privilege firewall rules from VPN to LAN or DMZ.
- Configure internal DNS for remote clients.
- Monitor VPN logs and tunnel state.
- Document routing and failover behavior.

## Troubleshooting Chain

| Layer | Example Check |
|---|---|
| Authentication | User, group, MFA and certificate or key state |
| Tunnel establishment | VPN log, peer reachability and negotiation parameters |
| Routing | Local and remote networks, route lookup and tunnel routes |
| Firewall policy | VPN-to-LAN or VPN-to-DMZ rules |
| DNS | Internal name resolution over VPN |
| Application | Target service and server-side firewall |

## Current Scope Decision

This use case is documented conceptually because the current lab does not yet include a realistic external VPN client, authentication backend or second site-to-site peer.

## Result

VPN and branch connectivity are documented as realistic firewall administration scenarios for future practical expansion.
