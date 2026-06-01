# Hyper-V Network Design

## Purpose

This document describes the Hyper-V network design for the local Sophos Security Lab.

## Confirmed Design

The lab uses two internal Hyper-V switches for the initial 2-NIC Sophos Firewall setup.

| Switch | Type | Host Adapter | Purpose |
|---|---|---|---|
| vSwitch-sophos-wan-nat | Internal | vEthernet (vSwitch-sophos-wan-nat) | Simulated Sophos WAN network |
| vSwitch-sophos-lan | Internal | vEthernet (vSwitch-sophos-lan) | Internal LAN behind Sophos |

## Traffic Flow

Windows LAN client -> Sophos LAN -> Sophos firewall policy -> Sophos NAT -> Sophos WAN -> Windows WinNAT -> Internet

## Current Host-Side Configuration

| Component | Value |
|---|---|
| WAN host IP | 172.30.10.1/24 |
| LAN host management IP | 10.10.10.254/24 |
| WinNAT name | nat-sophos-wan-lab |
| WinNAT prefix | 172.30.10.0/24 |

## Design Rationale

Internal Hyper-V switches are used to keep the lab isolated from the physical home network.
The Windows host provides upstream NAT only for the simulated WAN segment.
Sophos will later become the gateway and security enforcement point for the LAN.

## Optional Later Extension

A DMZ can be added later using an additional internal switch and a third Sophos interface.
The initial setup intentionally stays with WAN and LAN only to reduce complexity.
