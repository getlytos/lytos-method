---
id: ISS-0019
title: Migrate method's own kanban from issue-board/ to .lytos/
type: chore
priority: P2-normal
effort: S
complexity: light
skill: code-structure
status: 5-done
branch: chore/ISS-0019-migrate-kanban-to-lytos
depends: []
created: 2026-04-19
updated: 2026-04-19
---
# ISS-0019 — Migrate method's own kanban from issue-board/ to .lytos/

## What to do

Move the 13 tracking issues of the method repo from the top-level `issue-board/` directory into `.lytos/issue-board/`. Top-level stays for content that gets published to users (LYTOS.md, skills/, rules/, memory/, templates/, starter/).

The repo then follows its own convention: every Lytos project (including the method itself) keeps its kanban in `.lytos/`.

## Relevant files

- `issue-board/` → deleted
- `.lytos/issue-board/` → all active issues + `archive/2026-Q2/` for the 5 done issues
- `.lytos/LYTOS.md`, `.lytos/skills/`, `.lytos/rules/`, `.lytos/memory/`, `.lytos/templates/` → self-tracking copy of the method
- `CLAUDE.md` → new, points Claude Code at `.lytos/`

## Definition of done

- `issue-board/` at the repo root is removed
- All 13 issues exist under `.lytos/issue-board/` (7 active, 5 archived, 1 icebox)
- `lyt board` runs cleanly from the repo root
- Top-level published content (LYTOS.md, skills/, rules/…) untouched
