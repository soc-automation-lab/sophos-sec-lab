# Use Case UC-12: Syslog and SIEM Integration Concept

## Purpose

This conceptual-operational use case documents how Sophos Firewall logs can be forwarded to a central logging or SIEM platform.

## Operational Scenario

Firewall events should be retained, searched, correlated and alerted centrally instead of only being reviewed locally on the firewall.

## Log Integration Model

`	ext
Sophos Firewall
  -> Syslog forwarding
      -> Log collector / SIEM
          -> Search, dashboards, alerts and correlation
`",
  ",
  

| Event Area | Operational Value |
|---|---|
| Firewall rules | Shows allowed and denied traffic |
| NAT | Helps understand address translation behavior |
| IPS | Supports detection of exploit attempts |
| Web filtering | Shows category and policy decisions |
| Application control | Shows application visibility and control |
| VPN | Supports remote access and site-to-site troubleshooting |
| System events | Shows service, update and appliance state changes |
| Admin events | Supports auditability of configuration changes |

## Syslog Compared With NetFlow

| Data Type | Main Question Answered |
|---|---|
| Syslog | What event or policy decision happened? |
| NetFlow | Who communicated with whom, how much and over which protocol? |

## Future Practical Implementation

A practical implementation could add a lightweight log receiver such as Wazuh, Graylog, Elastic, Splunk Free or another syslog-capable collector.

## Current Scope Decision

This use case is documented conceptually because the current lab does not yet include a dedicated log receiver VM.

## Result

Syslog and SIEM integration are documented as realistic operational extensions for monitoring, troubleshooting and security operations.
