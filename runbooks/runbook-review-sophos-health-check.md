# Runbook: Review Sophos Firewall Health Check Findings

## Purpose

This runbook provides a repeatable workflow for reviewing Sophos Firewall Health Check findings.

## Step 1: Open the Health Check

Open Sophos WebAdmin:

    Überwachen & Analysieren
    Firewall-Health-Check

Record the summary:

    Total checks
    Compliant checks
    Non-compliant checks
    High severity findings
    Medium severity findings
    Low severity findings

## Step 2: Review High Severity Findings First

Start with high severity findings because they may affect administrative security, exposed services, prevention capabilities or critical baseline settings.

For each finding, document:

    Finding name
    Module
    Severity
    Status
    Security meaning
    Required dependency
    Decision
    Reason

## Step 3: Identify Scope-Dependent Findings

Some findings may depend on products or services outside the current deployment.

Examples:

    Sophos Central
    Sophos Endpoint
    Security Heartbeat
    Synchronized Application Control
    MDR
    NDR
    XDR

Do not mark these as fixed unless the dependency is actually implemented.

## Step 4: Identify Directly Actionable Findings

Directly actionable findings are settings that can be changed on the firewall itself without requiring additional products.

Examples:

    Admin password complexity
    Admin session timeout
    Hotfix settings
    Backup settings
    Logging settings
    Overly broad firewall rules
    IPS policy assignment

## Step 5: Decide the Handling

Use one of the following decisions:

| Decision | Meaning |
|---|---|
| Remediate | Change the configuration and validate the result. |
| Monitor | Keep under observation and revisit later. |
| Accepted lab limitation | Not implemented because it is outside lab scope. |
| Accepted risk | Known risk accepted with documented reason. |
| Not applicable | Finding does not apply to this environment. |

## Step 6: Validate Changes

After making changes, validate:

    Health Check status
    Firewall logs
    Client connectivity
    Relevant security feature status
    No unintended traffic impact

## Step 7: Document the Result

Document the outcome in a change note or repository evidence file.

Include:

    What was reviewed
    What was changed
    What was not changed
    Why it was not changed
    Validation result
    Remaining risk

## Operational Note

A Health Check is not only a checklist. It is an input into risk-based firewall administration.

Good administration means understanding the finding, validating the dependency and documenting the decision.
