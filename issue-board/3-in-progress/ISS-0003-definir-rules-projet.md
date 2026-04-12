---
id: ISS-0003
title: "Define project-specific rules"
type: docs
priority: P1-high
effort: S
domain: [quality]
skill: documentation
status: 3-in-progress
depends: [ISS-0002]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# ISS-0003 — Define project-specific rules

## Context

Le Socle's default rules (`rules/default-rules.md`) cover universal best practices. But each project has its own constraints: function prefixes, CSS conventions, compatibility requirements, etc.

## Proposed solution

Create `.socle/rules/[project-name]-rules.md` with the project's own rules, following the format of the default rules.

## Definition of done

- [ ] Project-specific naming conventions identified
- [ ] Technical constraints identified
- [ ] Rules file written in table format
- [ ] Validated with the team / project owner

## Relevant files

- `.socle/rules/[project-name]-rules.md` (new)

## Notes

See `rules/README.md` for the expected format and examples of project-specific rules.
