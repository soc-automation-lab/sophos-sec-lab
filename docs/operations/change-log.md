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
