# M2 Sophos Firewall Installation Notes

## Purpose

This file documents the local Sophos Firewall Hyper-V image preparation and initial VM setup.

## Image Source

| Item | Value |
|---|---|
| Installer type | Virtual Installer: Firewall OS for Hyper-V |
| Version used | SFOS 22.0.1 MR-1-Build490 after initial setup |
| Downloaded ZIP | VI-22.0.0_GA.HYV-411.zip |
| ZIP storage | .local/sophos-downloads, excluded from Git |
| Extracted VHD storage | .local/vhd/sophos-firewall, excluded from Git |

## VHD Files

| VHD | Purpose |
|---|---|
| PRIMARY-DISK.vhd | Sophos Firewall system disk |
| AUXILIARY-DISK.vhd | Auxiliary/reporting/logging data disk |

## VM Configuration

| Setting | Value |
|---|---|
| VM name | vm-sophos-fw-01 |
| Generation | 1 |
| vCPU | 2 |
| RAM | 6 GB static memory |
| Automatic checkpoints | Disabled |
| Automatic start action | Nothing |
| Automatic stop action | Save |

## Network Adapter Mapping

| Sophos Port | Hyper-V Adapter | Switch | Lab Role |
|---|---|---|---|
| PortA / Port 1 | Port1-LAN | vSwitch-sophos-lan | Internal LAN side |
| PortB / Port 2 | Port2-WAN | vSwitch-sophos-wan-nat | WAN side towards Windows WinNAT |

## Configured Interface Addresses

| Interface | IP Address | Gateway | Role |
|---|---:|---:|---|
| Sophos LAN / PortA | 10.10.10.1/24 | n/a | Gateway for internal lab clients |
| Sophos WAN / PortB | 172.30.10.2/24 | 172.30.10.1 | Upstream via Windows WinNAT |
| Host LAN management | 10.10.10.254/24 | n/a | Host access to Sophos WebAdmin |
| Host WAN NAT | 172.30.10.1/24 | n/a | WinNAT upstream gateway for Sophos WAN |

## Initial Setup Choices

- Firewall hostname configured as fw-sophos-sec-lab.lab.local.
- Time zone configured as Europe/Berlin.
- WAN configured statically on PortB.
- LAN configured on PortA as 10.10.10.1/24.
- DHCP enabled for the LAN with the planned client range 10.10.10.100-10.10.10.200.
- Sophos Central Cloud Management was not enabled for this local lab.
- Security profiles were not enabled during initial setup to keep the first baseline simple and easier to troubleshoot.
- Weekly configuration backup by email was not configured.

## Verification

- Sophos WebAdmin is reachable from the host at https://10.10.10.1:4444.
- Temporary initial setup IP 172.16.16.254 was removed from the host after setup.
- VM network adapters and hard disks were verified.
- No Sophos serial number, password, email address or registration data is stored in Git.

## Security Note

Do not commit ZIP, VHD, VHDX, license data, serial numbers, passwords, registration screenshots or screenshots containing browser tokens.
