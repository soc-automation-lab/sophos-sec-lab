# Troubleshooting Guide

## Purpose

This guide documents common network and firewall troubleshooting scenarios.

## Basic Test Order

1. Check IP configuration.
2. Check default gateway.
3. Check DNS resolution.
4. Check ICMP reachability.
5. Check TCP port reachability.
6. Check firewall logs.
7. Check NAT configuration.
8. Check rule order.

## Useful Windows Commands

| Command | Purpose |
|---|---|
| ipconfig /all | Show IP address, gateway and DNS settings |
| ping | Basic ICMP reachability test |
| nslookup | DNS resolution test |
| Test-NetConnection | TCP connectivity test |
| route print | Routing table inspection |
| tracert | Path analysis |

## Common Lab Issues

| Symptom | Possible Cause |
|---|---|
| Client has no internet | NAT missing, firewall rule missing, wrong gateway |
| DNS does not work | Wrong DNS server, blocked DNS, Sophos DNS config missing |
| WebAdmin unreachable | Wrong LAN IP, wrong Hyper-V switch, host management IP missing |
| HTTP works but HTTPS fails | Firewall service rule too narrow or TLS inspection issue |
| Ping works but website fails | DNS or TCP/443 problem |
