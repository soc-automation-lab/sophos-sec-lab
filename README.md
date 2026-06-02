# Sophos Security Lab on Hyper-V

This repository documents a local IT security lab for firewall and network security practice.

## Goal

The goal of this project is to build a local Sophos Firewall Home Edition lab on Microsoft Hyper-V.
The lab is designed for practical firewall and network security operations in a controlled local environment.

Main learning areas:

- Sophos Firewall / XGS-like administration basics
- Firewall rule design
- NAT and masquerading
- Network segmentation
- DNS, DHCP, HTTP/S and TCP/IP troubleshooting
- VPN fundamentals
- Change documentation
- Evidence-based technical documentation

## Target Architecture

The lab uses internal Hyper-V virtual switches to avoid unnecessary exposure of the home network.

Planned networks:

| Network | Subnet | Gateway | Purpose |
|---|---:|---:|---|
| WAN-NAT | 172.30.10.0/24 | 172.30.10.1 | Simulated WAN via Windows host WinNAT |
| LAN | 10.10.10.0/24 | 10.10.10.1 | Internal client network behind Sophos |
| DMZ optional | 10.10.20.0/24 | 10.10.20.1 | Optional segmented server network |

## Planned Virtual Machines

| VM | Purpose |
|---|---|
| vm-sophos-fw-01 | Sophos Firewall Home Edition |
| vm-win-client-01 | Windows LAN test client |
| vm-ubuntu-srv-01 | Linux test server / web service target |
| vm-ubuntu-log-01 | Optional logging or monitoring VM |

## Milestones

| Milestone | Topic |
|---|---|
| M0 | Project start and repository structure |
| M1 | Hyper-V network design |
| M2 | Sophos Firewall VM installation |
| M3 | LAN client and internet access via Sophos |
| M4 | Firewall rulebase and segmentation |
| M5 | VPN and remote access fundamentals |
| M6 | Troubleshooting and operations |
| M7 | Public documentation and repository hardening |

## Security Boundaries

This is a private lab project. Do not commit:

- VHD/VHDX files
- ISO files
- ZIP installer packages
- passwords
- license keys
- registration data
- private screenshots
- personal information

## Repository Structure

docs/       Architecture, security and operations documentation
runbooks/   Step-by-step operational procedures
scripts/    PowerShell scripts for repeatable lab setup
evidence/   Sanitized command output and lab evidence
.local/     Local installers, ISOs and VHDs excluded from Git


