---
id: ISS-0018
title: "Reorganize repo root — move agents/ and adapters/ into docs/, reference 5 pillars in LYTOS.md and MANIFESTO.md"
type: chore
priority: P1-high
effort: S
complexity: standard
skill: documentation
status: 1-backlog
branch: "chore/ISS-0018-reorg-repo-and-pillars"
depends: []
created: 2026-04-18
---

# ISS-0018 — Reorganize repo root — move agents/ and adapters/ into docs/, reference 5 pillars in LYTOS.md and MANIFESTO.md

## Context

The lytos-method repo root currently mixes two things:
- The **method itself** (the 5 pillars: `manifest.md`, `skills/`, `rules/`, `issue-board/`, `memory/`)
- **Documentation about the method** (`agents/`, `adapters/`)

This creates confusion: a first-time visitor (or an AI agent) reading the repo cannot tell what is part of the method vs what is explanatory documentation. The `agents/` folder in particular looks like a 6th pillar, but it's not — it's documentation explaining how agents consume the method.

Additionally, while README.md and docs/fr/README.md already document the 5 pillars explicitly (done as part of the earlier rewrite), the LYTOS.md file — which is installed inside every `.lytos/` directory of every Lytos project — does not mention them. Neither does MANIFESTO.md. This means AI agents reading LYTOS.md during a session don't get the pillar vocabulary, and the manifesto doesn't reinforce the method's structure.

This issue was originally filed as `lytos-cli/ISS-0016` but misplaced — all the work happens in lytos-method. Transferred here per the one-issue-per-repo convention (lytos-method/ISS-0016).

## The 5 pillars (for reference)

| Pillar | Name | Purpose | Directory |
|--------|------|---------|-----------|
| 1 | **Intent** | The project's constitution — why it exists | `manifest.md` |
| 2 | **Design** | Procedures for recurring tasks | `skills/` |
| 3 | **Standards** | Non-negotiable quality criteria | `rules/` |
| 4 | **Progress** | What's moving, what's blocked | `issue-board/` |
| 5 | **Memory** | Accumulated knowledge, sovereign and portable | `memory/` |

## Checklist

### Reorganize repo root
- [ ] Move `agents/` → `docs/en/agents/` (documentation, not a pillar)
- [ ] Move `adapters/` → `docs/en/adapters/` (per-tool guides, not a pillar)
- [ ] Grep for internal links pointing to `agents/` and `adapters/` and update them
- [ ] Update README.md (EN and FR) if they reference the moved folders

### Reference the 5 pillars in the installed method files
- [ ] Add a "The 5 pillars" section in `LYTOS.md` (becomes visible in every `.lytos/` installed)
- [ ] Reference the 5 pillars by name in `MANIFESTO.md`
- [ ] Same in `MANIFESTE.md` (French) if it exists

### Starter verification
- [ ] `starter/.lytos/` already contains the 5 pillar dirs + `LYTOS.md` + `scripts/` + `templates/` — confirm scripts/ and templates/ belong (or document why)
- [ ] Update `starter/README.md` to explicitly name the 5 pillars

## Definition of done

- `agents/` and `adapters/` live in `docs/`, not at the root
- `LYTOS.md` and `MANIFESTO.md` both name the 5 pillars explicitly
- No broken internal links
- `starter/` is either clean (5 pillars only) or documents why extras are there

## Cross-refs

- Originated from: `lytos-cli/ISS-0016` (misfiled, closed as transferred)
- Related: `lytos-method/ISS-0014` — when implemented, will add `.lytos/agents/` as part of Design (not at root — agents/ at root is documentation only)
- Related: `lytos-method/ISS-0016` — documents the one-issue-per-repo rule that triggered this cleanup
