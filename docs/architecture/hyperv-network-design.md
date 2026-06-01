# Hyper-V Network Design

## Ziel

Das Lab bildet eine kleine Firewall-Infrastruktur nach.

```text
Internet
  |
Windows Host / WinNAT
  |
vSwitch-sophos-wan-nat
  |
Sophos Firewall
  |
vSwitch-sophos-lan
  |
Windows Client / Ubuntu Server
```

## Sicherheitsprinzipien

- Kein Bridging des LAN-Lab direkt ins Heimnetz.
- Sophos ist Default Gateway für Lab-Clients.
- Management zuerst nur lokal über Host/LAN-Lab.
- DMZ nur optional und nach erfolgreichem Basisbetrieb.
