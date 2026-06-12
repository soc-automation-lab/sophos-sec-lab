# Sophos System Services and Logging Inventory

## Purpose

This document summarizes observed Sophos Firewall system services, traffic shaping profiles and logging configuration areas.

## System Service State

| Service Area | Observed State | Operational Interpretation |
|---|---|---|
| Antispam | Stopped | Mail antispam processing is not active in the current lab state |
| Antivirus | Running | Malware scanning service is available |
| Authentication | Running | Authentication-related firewall functions are available |
| DNS server | Running | The firewall can provide DNS service to configured client zones |
| IPS | Running | Intrusion prevention engine is available |
| Web Proxy | Running | Proxy-related web functions are available |
| WAF | No web server configured | Web Application Firewall is not active because no protected web server is configured |
| DHCP server | Running | IPv4 DHCP service is active for configured scopes |
| DHCPv6 server | No DHCPv6 server configured | IPv6 DHCP is not part of the current lab scope |
| Router Advertisement service | No router advertisement server configured | IPv6 router advertisement is not part of the current lab scope |
| Hotspot | Running | Hotspot service is available but not a core lab scenario yet |
| Packet capture and live connections | Running | Diagnostic functions are available for troubleshooting |

## Traffic Shaping State

| Area | Observed State | Operational Interpretation |
|---|---|---|
| Rule-based traffic shaping profiles | Available | Can be assigned to firewall rules to limit or guarantee bandwidth |
| User-based traffic shaping profiles | Available | Can be used for user-aware bandwidth policies |
| Application-based traffic shaping profiles | Available | Useful for application-specific bandwidth control such as streaming traffic |

Traffic shaping profiles do not affect traffic by existing alone.

They must be assigned to firewall rules, users, groups or application-related policies before they influence traffic behavior.

## Syslog and Logging State

| Item | Observed State | Operational Interpretation |
|---|---|---|
| Syslog server | Not configured | Logs are not currently forwarded to a central log platform |
| Local firewall rule reporting | Enabled for selected firewall events | Useful for local troubleshooting and reporting |
| Invalid traffic logging | Enabled locally | Supports troubleshooting of malformed or unexpected traffic |
| IPS logging | Enabled for signature and anomaly-related events | Useful for security monitoring |
| Antivirus protocol logging | Enabled for multiple protocols | Useful for malware scanning visibility |
| Antispam logging | Enabled for mail protocols, but service is stopped | Logging settings exist even if service use is limited |
| Content filtering logging | Enabled for web, application and SSL/TLS filtering areas | Supports web and application visibility |
| Active Threat Response logging | Partially enabled | Relevant if threat feeds or response features are activated |
| Zero-Day Protection logging | Enabled for related events | Relevant when sandbox or zero-day features are used |
| SD-WAN logging | Enabled for selected SD-WAN profile and route events | Useful for later SD-WAN troubleshooting |

## Operational Distinction

Local logs are useful for direct troubleshooting on the firewall.

Syslog forwarding is used when events should be centralized, correlated, retained or analyzed by a SIEM, SOC or log management platform.

NetFlow is different from Syslog.

Syslog describes events and decisions, while NetFlow describes traffic metadata such as source, destination, port, protocol and volume.

## Practical Use Cases Derived From This Inventory

| Use Case | Feasibility | Notes |
|---|---|---|
| System service state review | High | Can be documented from the current lab state |
| Firewall logging review | High | Directly relevant for troubleshooting and evidence collection |
| Syslog forwarding concept | High | Important for SIEM/SOC integration planning |
| Practical syslog forwarding test | Medium | Requires an additional log receiver VM or existing collector |
| Traffic shaping concept | High | Can be documented now and tested later if needed |
| NetFlow collector integration | Medium | Requires a flow collector such as ntopng, ElastiFlow or similar |

## Current Scope Decision

System services and logging are documented as part of M8.

No syslog server, NetFlow collector or practical traffic shaping policy is enabled in the current lab state.
