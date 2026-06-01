# Runbook - Sophos Initial Setup

## Ziel

Erstkonfiguration der Sophos Firewall Home Edition im lokalen Hyper-V-Lab.

## Schritte

1. Hyper-V-Switches prüfen.
2. Sophos VM starten.
3. LAN-IP erreichen: `https://10.10.10.1:4444` oder initial laut Konsole.
4. EULA akzeptieren.
5. Home-Edition-Registrierung durchführen.
6. WAN als DHCP oder statisch im WAN-NAT-Netz konfigurieren.
7. LAN als Gateway/DHCP für Testclients konfigurieren.
8. Basis-Firewallregel LAN -> WAN erstellen.
9. NAT/Masquerading aktivieren.
10. Logs prüfen.

## Sicherheitsnotiz

Keine Passwörter, Seriennummern oder Lizenzdaten ins Repository schreiben.
