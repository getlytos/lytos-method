---
id: ISS-0001
title: "Install Le Socle in the project"
type: chore
priority: P0-critical
effort: XS
skill: ~
status: 5-done
depends: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# ISS-0001 — Install Le Socle in the project

## What to do

Add Le Socle as a Git submodule in the `.socle/` folder at the project root.

```bash
git submodule add https://github.com/le-socle/socle .socle
```

## Relevant files

- `.gitmodules`
- `.socle/` (new folder)

## Definition of done

The `.socle/` folder exists at the project root with the full Le Socle structure: skills, rules, templates, issue-board.
