---
id: ISS-0005
title: "Configure the project's AI adapter"
type: chore
priority: P1-high
effort: XS
skill: ~
status: 1-backlog
depends: [ISS-0002]
created: YYYY-MM-DD
---

# ISS-0005 — Configure the project's AI adapter

## What to do

Configure the AI tool used on the project so that it automatically loads Le Socle's manifest, memory, and rules at the start of each session.

Depending on the tool:
- **Claude Code** → create `CLAUDE.md` (see `.socle/adapters/claude-code/`)
- **Cursor** → create `.cursorrules` (see `.socle/adapters/cursor/`)
- **OpenAI** → configure the system instructions (see `.socle/adapters/openai/`)

## Relevant files

- `CLAUDE.md` or `.cursorrules` (new, at the project root)

## Definition of done

The AI tool automatically loads the manifest and memory at each new session. Test: start a session and ask "What project are we working on?" — the agent must answer correctly.
