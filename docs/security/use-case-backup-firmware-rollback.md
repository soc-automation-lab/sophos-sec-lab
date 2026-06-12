# Use Case UC-13: Backup, Firmware and Rollback Procedure

## Purpose

This use case documents operational maintenance principles for Sophos Firewall backup, firmware and rollback planning.

## Operational Scenario

Before firewall changes, migrations or firmware updates, an administrator must ensure that the firewall can be restored to a known good state.

## Backup and Rollback Checklist

| Step | Purpose |
|---|---|
| Export configuration backup | Enables restore after faulty changes |
| Document current firmware version | Establishes technical baseline |
| Record current rule and NAT state | Supports rollback verification |
| Schedule maintenance window | Reduces business disruption |
| Validate access after change | Confirms WebAdmin and network reachability |
| Validate client traffic | Confirms production-relevant traffic still works |
| Keep rollback decision point | Avoids uncontrolled troubleshooting during outage |

## Lab Interpretation

The lab uses Git documentation and evidence files for change traceability. Sophos configuration backups should not be committed to the public repository because they may contain sensitive data.

## Result

Backup, firmware and rollback are documented as operational firewall administration responsibilities.
