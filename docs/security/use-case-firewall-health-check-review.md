# Use Case: Firewall Health Check Review

## Purpose

This use case documents how to review Sophos Firewall Health Check findings in a structured and operationally useful way.

The goal is not to blindly enable every feature, but to understand each finding, assess its relevance and document whether it should be remediated, monitored or accepted as a lab limitation.

## Lab Context

The Sophos Firewall Health Check provides a compliance-oriented overview of configuration findings.

Observed Health Check summary in the lab:

| Category | Observed Value |
|---|---|
| Total checks | 31 |
| Compliant checks | 9 |
| Non-compliant checks | 22 |
| High severity findings | 11 of 17 |
| Medium severity findings | 9 of 11 |
| Low severity findings | 2 of 3 |

## Review Method

Each finding should be reviewed using the same decision logic.

| Step | Question |
|---|---|
| Identify | What does the finding refer to? |
| Understand | Which security control is affected? |
| Assess | Is the finding relevant in this lab or production-like scenario? |
| Decide | Remediate, monitor, document as accepted risk or mark as not applicable. |
| Validate | Confirm whether the change improves the Health Check or operational security posture. |
| Document | Record the reasoning and avoid undocumented configuration drift. |

## Example Finding Categories

| Finding Area | Security Meaning | Typical Decision |
|---|---|---|
| IPS disabled | Intrusion Prevention can detect or block known exploit patterns. | Enable after policy and performance review. |
| Security Heartbeat disabled | Endpoint health information is not used by firewall policy decisions. | Requires Sophos Endpoint and Central integration. |
| Synchronized Application Control disabled | Unknown applications are not identified via endpoint telemetry. | Requires Sophos Endpoint integration. |
| MDR or NDR feeds disabled | Managed or network detection features are not active. | Depends on licensing and service scope. |
| Admin password complexity compliant | Administrative password policy meets the expected baseline. | Keep enabled and document. |
| Hotfix setting compliant | Firewall can receive important fixes. | Keep enabled and document. |
| Inactive session handling not compliant | Admin sessions may remain active longer than desired. | Review and adjust in production. |

## Lab-Specific Interpretation

Not every non-compliant finding means that the firewall is misconfigured.

In this lab, several findings depend on components that are intentionally not part of the current scope:

- Sophos Central management
- Sophos Endpoint or Intercept X
- MDR or NDR services
- Security Heartbeat
- Synchronized Application Control

These findings should be documented as scope-dependent rather than silently ignored.

## Production-Oriented Best Practice

In a production environment, Health Check findings should be handled through change management.

Recommended workflow:

1. Export or document the current finding state.
2. Classify findings by severity and operational relevance.
3. Identify dependencies such as license modules, endpoint agents or central management.
4. Prioritize high-impact controls such as IPS, admin security, backups and update settings.
5. Test changes in a maintenance window if they may affect traffic.
6. Validate the result using logs, Health Check state and functional tests.
7. Document residual risks and accepted exceptions.

## Priority Model

| Priority | Example | Reason |
|---|---|---|
| High | Admin security, update/hotfix settings, broadly permissive rules, missing IPS on exposed paths | Directly affects attack surface or administrative security. |
| Medium | Reporting, inactive session handling, policy hygiene | Improves operational security and accountability. |
| Conditional | Heartbeat, MDR, NDR, synchronized app control | Valuable, but may depend on external Sophos services or endpoint licensing. |
| Lab accepted | Features outside lab scope | Not ignored, but documented as intentionally not implemented. |

## Operational Value

A firewall administrator must be able to explain why a finding matters, whether it is applicable and how it should be handled.

This avoids two common mistakes:

- Treating every warning as an emergency without context.
- Ignoring Health Check findings without documenting the reason.

## Result Summary

The lab Health Check review demonstrates how to turn dashboard findings into operational decisions.

The review does not blindly enable all available features. Instead, it separates directly actionable baseline items from findings that depend on Sophos Central, Endpoint, MDR, NDR or additional licensing.
