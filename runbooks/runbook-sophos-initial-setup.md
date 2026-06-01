# Runbook: Sophos Initial Setup

## Purpose

This runbook documents the initial Sophos Firewall setup path for the local Hyper-V lab.

## Initial Access

| Item | Value |
|---|---|
| Initial setup URL | https://172.16.16.16:4444 |
| Temporary host IP used | 172.16.16.254/24 on vSwitch-sophos-lan |
| Final WebAdmin URL | https://10.10.10.1:4444 |

## Setup Order

1. Start the Sophos VM.
2. Add temporary host IP 172.16.16.254/24 to the LAN vEthernet adapter.
3. Open https://172.16.16.16:4444.
4. Accept the self-signed certificate warning in the browser.
5. Accept the end-user license terms.
6. Configure WAN on PortB with static IP 172.30.10.2/24, gateway 172.30.10.1 and public DNS resolvers.
7. Configure hostname and time zone.
8. Register or activate the Home Use license without documenting the serial number.
9. Configure LAN on PortA as 10.10.10.1/24.
10. Keep DHCP enabled for lab clients.
11. Leave optional security profiles disabled during the first baseline setup.
12. Skip Sophos Central Cloud Management for the local lab baseline.
13. Finish the wizard and wait for firmware/configuration tasks to complete.
14. Open the final WebAdmin URL https://10.10.10.1:4444.
15. Remove the temporary host IP 172.16.16.254 from the LAN vEthernet adapter.

## Important Network Mapping

| Sophos Port | Hyper-V Adapter | Switch | Role |
|---|---|---|---|
| PortA | Port1-LAN | vSwitch-sophos-lan | LAN gateway |
| PortB | Port2-WAN | vSwitch-sophos-wan-nat | WAN uplink |

## Troubleshooting Notes

- If 10.10.10.1:4444 is not reachable immediately after setup, wait several minutes because Sophos may still be applying firmware and service changes.
- ICMP ping may fail even when WebAdmin over TCP/4444 works.
- If the browser still points to 172.16.16.16 after the LAN change, manually open https://10.10.10.1:4444.
- Do not store passwords, serial numbers or registration screenshots in the repository.
