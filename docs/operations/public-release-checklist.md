# Public Release Checklist

## Purpose

This checklist defines repository checks before pushing the lab to a public Git hosting platform.

## Repository Content Checks

| Check | Expected State |
|---|---|
| ISO files | Not tracked |
| VHD/VHDX files | Not tracked |
| ZIP installer files | Not tracked |
| Passwords | Not present |
| License keys | Not present |
| Serial numbers | Not present |
| Email addresses | Not present |
| Browser session parameters | Not present |
| Private screenshots | Not present |
| Local-only evidence | Excluded via .gitignore |

## Git Checks

Run before public push:

    git status --short
    git log --oneline --decorate -6
    git tag --list
    git ls-files

## Sensitive Term Review

Terms such as password, secret, token, license, serial, csrf, iso, vhd, vhdx, zip and email-like strings must be reviewed before public release.

## Public Documentation Requirements

- README explains the lab without exposing private data.
- Architecture is understandable from Markdown files.
- Evidence files are sanitized text, not private screenshots.
- Local-only files remain outside Git.
- Changes are committed and tagged.

## Current Public Release State

M6 prepares the repository for public release by adding an architecture overview and release checks.
