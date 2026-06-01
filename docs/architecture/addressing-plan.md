# Addressing Plan

## WAN-NAT-Lab

```text
Hyper-V Switch: vSwitch-sophos-wan-nat
Subnetz:        172.30.10.0/24
Host-Gateway:   172.30.10.1
Sophos WAN:     172.30.10.2
```

## LAN-Lab

```text
Hyper-V Switch: vSwitch-sophos-lan
Subnetz:        10.10.10.0/24
Host-Mgmt:      10.10.10.254
Sophos LAN:     10.10.10.1
DHCP Range:     10.10.10.100-10.10.10.199
```

## Optional DMZ

```text
Hyper-V Switch: vSwitch-sophos-dmz
Subnetz:        10.10.20.0/24
Sophos DMZ:     10.10.20.1
Server:         10.10.20.10
```
