# NAT and Segmentation Design

## Purpose

This document describes how NAT and segmentation are used in the local Sophos Hyper-V lab.

## NAT Concept

The lab uses two NAT layers:

1. Windows host WinNAT for the simulated Sophos WAN network.
2. Sophos Firewall masquerading for LAN clients accessing the WAN side.

## Security Meaning

NAT is not a firewall by itself.
Firewall rules decide whether traffic is allowed.
NAT translates addresses so that traffic can be routed between networks.

## Segmentation Concept

| Segment | Purpose |
|---|---|
| LAN | Client systems |
| DMZ | Server systems reachable through controlled rules |
| WAN | Simulated external network |

## Design Principle

- deny by default
- allow only required traffic
- enable logging for important rules
- document source, destination, service, NAT and test method
