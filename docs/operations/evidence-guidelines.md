# Evidence Guidelines

## Purpose

Evidence files prove that the lab was built and tested in a reproducible way.

## Allowed Evidence

- sanitized PowerShell command output
- sanitized Hyper-V switch status
- sanitized NAT status
- sanitized VM configuration output
- screenshots without private data

## Private Evidence

Store private or sensitive files only in:

evidence/local-private/

This folder is excluded from Git.

## Do Not Commit

- license keys
- serial numbers
- passwords
- public IP addresses if not required
- personal account data
- installer files
- VHD/VHDX/ISO files
