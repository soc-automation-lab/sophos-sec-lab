# Microsoft 365 Security Concept

## Purpose

This document summarizes Microsoft 365 security concepts that commonly complement firewall and network security operations.
The document is conceptual and does not require storing tenant IDs, user data, secrets or screenshots.

## Core Security Areas

| Area | Meaning | Operational Relevance |
|---|---|---|
| Identity security | Protecting user accounts and sign-ins | Many cloud attacks start with stolen credentials |
| MFA | Additional verification factor | Reduces password-only account compromise risk |
| Conditional Access | Access decisions based on conditions | Can restrict access by user, device, location or risk |
| Device compliance | Device state influences access | Helps prevent unmanaged devices from accessing data |
| Mail security | Protection for Exchange Online | Reduces phishing, malware and spoofing risk |
| Logging and alerting | Security events and audit data | Supports investigation and monitoring |
| Defender integration | Security signals and endpoint/cloud protection | Provides detection and response context |

## Firewall and Cloud-Security Relationship

Modern security operations combine network controls and identity-aware cloud controls.
A firewall can control network paths, NAT, VPN, segmentation and perimeter traffic.
Cloud-security controls help protect identities, SaaS access, mail flow, device posture and cloud activity.

## Example Control Mapping

| Risk | Network/Firewall Control | Cloud-Security Control |
|---|---|---|
| Stolen user password | VPN MFA, restricted remote access | MFA and Conditional Access |
| Unmanaged device access | VPN/device restrictions where available | Device compliance requirements |
| Phishing email | Mail security gateway or filtering | Exchange Online Protection / Defender policies |
| Lateral movement | VLAN segmentation and firewall rules | Identity monitoring and endpoint alerts |
| Suspicious sign-in | VPN logs and geo/IP review | Entra ID sign-in logs and risk alerts |

## Example Microsoft 365 Security Checklist

| Check | Purpose |
|---|---|
| MFA enforced for privileged users | Protect administrative accounts |
| MFA enforced for all users where feasible | Reduce password-only compromise risk |
| Conditional Access policies documented | Make access decisions transparent |
| Legacy authentication disabled where possible | Reduce weak authentication paths |
| Admin roles reviewed | Apply least privilege |
| Mail protection policies reviewed | Reduce phishing and malware exposure |
| Audit logging enabled | Support investigation and traceability |
| Security alerts reviewed regularly | Detect unusual activity |

## Operational Notes

- Cloud access should be treated as an identity and device security problem, not only as a network problem.
- Firewall logs and cloud sign-in logs can complement each other during investigations.
- Administrative access should be protected with MFA and least privilege.
- Documentation should avoid storing tenant-specific secrets, recovery codes or personal user data.

## Lab Extension Idea

A future extension can add a sanitized Microsoft 365 security checklist without tenant-specific details.
The goal would be to document identity, MFA, Conditional Access and logging concepts without exposing private information.
