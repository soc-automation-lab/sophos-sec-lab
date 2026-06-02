# Change Log

## CHG-M1-HYPERV-NETWORK-FOUNDATION

| Field | Value |
|---|---|
| Change type | Network foundation |
| Scope | Hyper-V internal switches, host IP addressing, Windows WinNAT |
| Risk | Medium |
| Result | Successful |

## Implemented Changes

- Created internal Hyper-V switch vSwitch-sophos-wan-nat.
- Created internal Hyper-V switch vSwitch-sophos-lan.
- Assigned host WAN-side IP address 172.30.10.1/24.
- Assigned host LAN management IP address 10.10.10.254/24.
- Created Windows WinNAT nat-sophos-wan-lab for 172.30.10.0/24.
- Collected sanitized evidence in evidence/cli-outputs.

## Validation

- Hyper-V switches exist and are internal.
- vEthernet adapters are up.
- WinNAT is active.
- Local reachability tests to 172.30.10.1 and 10.10.10.254 succeeded.

## Rollback Concept

If rollback is required, remove the Sophos WinNAT entry first, then remove the Sophos Hyper-V switches.
Do not remove unrelated switches such as Default Switch, WSL-External, VULN-NAT or VULN-SCAN.

## CHG-M2-SOPHOS-FIREWALL-VM-INSTALLATION

| Field | Value |
|---|---|
| Change type | Firewall VM installation |
| Scope | Sophos Hyper-V VHD preparation, VM creation, initial setup, WebAdmin verification |
| Risk | Medium |
| Result | Successful |

## Implemented Changes

- Downloaded the Sophos Firewall Hyper-V virtual installer ZIP locally.
- Extracted PRIMARY-DISK.vhd and AUXILIARY-DISK.vhd.
- Created vm-sophos-fw-01 as Generation 1 Hyper-V VM.
- Configured 2 vCPU and 6 GB static RAM.
- Connected Port1-LAN to vSwitch-sophos-lan.
- Connected Port2-WAN to vSwitch-sophos-wan-nat.
- Attached the primary and auxiliary Sophos VHD files.
- Started the VM and completed the initial Sophos setup wizard.
- Configured Sophos LAN as 10.10.10.1/24.
- Configured Sophos WAN as 172.30.10.2/24 with gateway 172.30.10.1.
- Removed temporary host setup IP 172.16.16.254 after successful WebAdmin access.

## Validation

- VM state is Running.
- Hyper-V adapters are mapped correctly.
- Sophos WebAdmin is reachable at https://10.10.10.1:4444.
- Temporary initial setup IP was removed from the host.
- No license key, serial number, email address or password was stored in Git.

## Rollback Concept

If rollback is required, shut down vm-sophos-fw-01 and remove only this VM and its local .local/hyperv working directory.
Do not remove the Sophos lab switches or WinNAT unless rolling back Meilenstein 1 as well.

## CHG-M3-WINDOWS-CLIENT-LAN-INTERNET

| Field | Value |
|---|---|
| Change type | Client connectivity validation |
| Scope | Windows test client VM, DHCP, DNS, HTTPS, Sophos firewall logging |
| Risk | Low to Medium |
| Result | Successful |

## Implemented Changes

- Created vm-win-client-01 as a Generation 2 Windows 11 test client VM.
- Connected the VM to vSwitch-sophos-lan.
- Installed Windows 11 Enterprise Evaluation.
- Verified DHCP from Sophos Firewall.
- Verified client default gateway and DNS via Sophos.
- Verified HTTPS internet connectivity through Sophos and Windows WinNAT.
- Enabled firewall traffic logging on #Default_Network_Policy.
- Verified a Sophos firewall log entry for client HTTPS traffic.

## Validation

- Client IP address: 10.10.10.100/24.
- Default gateway: 10.10.10.1.
- DNS server: 10.10.10.1.
- HTTPS to example.com TCP/443 succeeded.
- Sophos firewall log showed allowed TCP/443 traffic from 10.10.10.100 to 104.20.23.154.
- Traffic matched #Default_Network_Policy and #NAT_Default_Network_Policy.

## Rollback Concept

If rollback is required, shut down and remove only vm-win-client-01 and its local .local/hyperv working directory.
Do not remove Sophos Firewall VM, Sophos switches or WinNAT unless rolling back earlier milestones.

## CHG-M4-RULEBASE-OPTIMIZATION

| Field | Value |
|---|---|
| Change type | Firewall rulebase optimization |
| Scope | LAN-to-WAN web allow rule, linked NAT rule, broad default rule deactivation |
| Risk | Medium |
| Result | Successful |

## Implemented Changes

- Created a dedicated firewall rule named LAN_to_WAN_Web.
- Allowed only HTTP and HTTPS from LAN to WAN through the dedicated web rule.
- Enabled firewall traffic logging on LAN_to_WAN_Web.
- Created and validated the linked NAT rule NAT_LAN_to_WAN_Web using MASQ.
- Placed LAN_to_WAN_Web above the broad default LAN-to-WAN policy.
- Disabled #Default_Network_Policy after successful validation.
- Kept #Default_Network_Policy disabled rather than deleted to preserve rollback capability.

## Validation

- HTTPS to example.com remained successful after disabling #Default_Network_Policy.
- Sophos logs showed allowed TCP/443 traffic through LAN_to_WAN_Web.
- Sophos logs showed NAT_LAN_to_WAN_Web for allowed web traffic.
- TCP/22 to 1.1.1.1 was no longer successful from the client perspective after disabling the broad rule.
- DNS resolution for example.com remained successful.

## Correction Note

A previous TCP/22 test was still shown as allowed by #Default_Network_Policy.
This confirmed that the broad rule was still active at that time.
The rule was then disabled and the tests were repeated.

## Rollback Concept

If approved troubleshooting requires temporary broad LAN-to-WAN access, #Default_Network_Policy can be re-enabled.
The rule was intentionally disabled instead of deleted.

## CHG-M5-NETWORK-SECURITY-CONCEPTS

| Field | Value |
|---|---|
| Change type | Network and security architecture documentation |
| Scope | VLAN, switch integration, segmentation, VPN fundamentals, Microsoft 365 security concepts |
| Risk | Low |
| Result | Successful |

## Implemented Documentation

- Added VLAN and switch integration concept documentation.
- Added enterprise segmentation concept documentation.
- Added VPN fundamentals concept documentation.
- Added Microsoft 365 security concept documentation.
- Added evidence files for the created M5 documentation artifacts.

## Technical Focus

- VLANs, access ports, trunk ports and firewall uplinks.
- Firewall-centric segmentation with zones and traffic matrices.
- Remote-access VPN and site-to-site VPN design notes.
- Microsoft 365 security concepts such as MFA, Conditional Access, mail security, logging and identity-aware access.

## Validation

- Documentation files were created under docs/architecture, docs/network and docs/cloud-security.
- Evidence files were created under evidence/cli-outputs.
- Repository wording was checked for configured public-context terms before commit.

## Rollback Concept

If the concept documentation needs to be revised, update or remove only the M5 documentation files.
No firewall runtime configuration was changed during M5.
