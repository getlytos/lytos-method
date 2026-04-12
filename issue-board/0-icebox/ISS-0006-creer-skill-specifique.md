---
id: ISS-0006
title: "Create a project-specific skill"
type: feat
priority: P2-normal
effort: M
domain: [method]
skill: documentation
status: 0-icebox
depends: [ISS-0004]
created: YYYY-MM-DD
---

# ISS-0006 — Create a project-specific skill

## Context

The skills provided by Le Socle (code-review, testing, documentation, git-workflow, code-structure, session-start) cover generic cases. But some projects have specific procedures that deserve to be formalized as skills: deployment, data migration, translation management, etc.

## Proposed solution

Identify a recurring process in the project and formalize it as a skill in `.socle/skills/`. The skill must be immediately operational — an agent can apply it without interpretation.

## Definition of done

- [ ] Recurring process identified
- [ ] Skill written in the standard format (title, when to invoke, procedure, checklist)
- [ ] Tested on a real case
- [ ] Adjusted and validated

## Notes

Examples of possible project-specific skills:
- `deployment.md` — project deployment procedure
- `migration.md` — how to perform a data migration
- `i18n.md` — how to manage translations
- `api-design.md` — how to design an API endpoint
