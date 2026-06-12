# Sophos Administrative Access and Observability Inventory

## Purpose

This document summarizes observed administrative access, API access, notification, NetFlow and message configuration areas of the Sophos Firewall lab.

## Appliance Access State

| Area | Observed State | Operational Interpretation |
|---|---|---|
| LAN appliance access | Multiple local firewall services are enabled from the LAN zone | Acceptable for lab use, but should be reviewed and minimized in production |
| WAN appliance access | No major local services appear to be enabled from the WAN zone | Good security baseline because management services should not be broadly exposed to WAN |
| DMZ appliance access | Limited services are enabled | Should be restricted to required services only |
| VPN appliance access | Limited services are enabled | Should be scoped to administrative requirements |
| WiFi appliance access | Multiple services are enabled from the WiFi zone | Should be reviewed carefully, especially for guest or less trusted wireless networks |
| ZSL exception rules | No entries observed | No exception-based local service access override is currently documented |

## Important Appliance Access Distinction

Appliance access controls access to services running on the firewall itself.

This is different from firewall rules, which control traffic passing through the firewall between zones.

Examples of appliance-local services include HTTPS WebAdmin, SSH, DNS, Ping, SSL VPN, IPsec, User Portal, SMTP Relay, Web Proxy and SNMP.

## API Access State

| Item | Observed State | Operational Interpretation |
|---|---|---|
| API access | Disabled | Secure default state while no automation is implemented |
| Allowed IP hosts | No entries observed | No automation host is currently authorized |

## Notification State

| Item | Observed State | Operational Interpretation |
|---|---|---|
| Notification transport | Integrated mail server selected | Sufficient for basic lab alerting tests |
| Sender address | Configured | Should be documented without exposing the real address publicly |
| Recipient address | Configured | Should use a team mailbox or distribution group in production |
| Test email function | Available | Useful for verifying alert delivery |

## NetFlow State

| Item | Observed State | Operational Interpretation |
|---|---|---|
| NetFlow server | Not configured | No flow collector currently receives traffic metadata |
| NetFlow port | Default field shows 2055 | Common NetFlow collector port |

## Message Configuration State

| Message Area | Purpose | Observed State |
|---|---|---|
| Authentication | User-facing or system authentication messages | Available for customization |
| SMTP | Mail-related messages | Available for customization |
| Management | Administration-related messages | Available for customization |
| SMS customization | SMS-related message templates | Available for customization |

## Operational Security Notes

- WAN management exposure should remain disabled unless a tightly controlled management design exists.
- HTTPS WebAdmin should be restricted to trusted administrative networks.
- SSH should be disabled or limited to temporary troubleshooting from trusted hosts.
- DNS should only be enabled for zones that intentionally use the firewall as resolver or forwarder.
- SNMP should use SNMPv3 and authorized monitoring hosts if enabled.
- API access should only be enabled for known automation systems.
- Notification addresses should not expose private user addresses in public documentation.
- NetFlow is useful for traffic visibility but does not replace firewall logging or SIEM correlation.

## Practical Use Cases Derived From This Inventory

| Use Case | Feasibility | Notes |
|---|---|---|
| Appliance access hardening review | High | Directly relevant and practical in the current lab |
| API automation readiness review | High | API can remain disabled while documenting secure enablement requirements |
| Notification delivery test | Medium | Possible, but public documentation must not expose real email addresses |
| NetFlow integration concept | Medium | Practical implementation requires a flow collector VM or external collector |
| SNMP monitoring readiness | Medium | Practical implementation requires a monitoring target and SNMPv3 configuration |

## Current Scope Decision

Administrative access and observability capabilities are documented as part of M8.

No API access, NetFlow export or SNMP monitoring is enabled in the current lab state.
