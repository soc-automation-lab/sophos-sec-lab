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
