# Use Case UC-15: Microsoft 365 and Cloud Application Visibility

## Purpose

This use case documents how Sophos Firewall can provide visibility into cloud application traffic such as Microsoft 365.

## Operational Scenario

A firewall administrator needs to understand which cloud applications are used and whether traffic should be allowed, restricted, prioritized or reported.

## Observed Lab State

| Area | Observed State |
|---|---|
| Application reporting | Available |
| Cloud application visibility | Office 365 observed in application view |
| Firewall logs | Show HTTP/HTTPS traffic from client |
| Traffic shaping profiles | Available but not assigned in current lab |

## Practical Interpretation

Cloud application visibility does not automatically mean blocking or controlling an application. It first provides classification and reporting.

## Possible Administrative Actions

- Monitor application usage.
- Create application-aware firewall rules.
- Apply traffic shaping for selected applications.
- Review risky or unexpected cloud applications.
- Correlate application visibility with firewall logs.

## Result

The lab documents cloud application visibility as a realistic firewall administration use case, especially for Microsoft 365 and browser-based SaaS traffic.
