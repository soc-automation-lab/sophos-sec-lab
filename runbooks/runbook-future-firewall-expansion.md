# Runbook: Future Firewall Expansion

## Purpose

This runbook documents how the lab can be expanded after the initial Sophos Firewall use case project is completed.

## Expansion Candidates

| Expansion | Required Component | Related Use Cases |
|---|---|---|
| DMZ server publishing | Additional server VM and DMZ interface | UC-08, UC-09 |
| Guest isolation test | Additional client or wireless simulation | UC-10 |
| Internal DNS | Windows Server or Linux DNS VM | UC-11 |
| Syslog or SIEM | Log receiver VM | UC-12 |
| NetFlow analysis | Flow collector | UC-12 and observability backlog |
| VPN practical test | External client or second VPN peer | UC-14 |
| Ansible automation | API access, automation host and safe credentials handling | Firewall automation expansion |

## Expansion Principles

- Add infrastructure only when it enables a realistic operational scenario.
- Keep public evidence free of secrets, private addresses and session data.
- Prefer least privilege over broad connectivity.
- Validate with repeatable tests and logs.
- Commit documentation before creating tags.

## Closure Note

The initial project can be considered complete once all 15 use cases are documented and the repository has a clean final tag.
