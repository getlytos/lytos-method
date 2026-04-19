---
id: ISS-0017
title: "Optimize token usage — index rules, separate sprint history, trim LYTOS.md"
type: improvement
priority: P1-high
effort: M
complexity: standard
skill: documentation
status: 1-backlog
branch: "docs/ISS-0017-token-optimization"
depends: []
created: 2026-04-15
updated: 2026-04-15
---

# ISS-0017 — Optimize token usage — index rules, separate sprint history, trim LYTOS.md

## Context

Every token loaded into context that isn't relevant to the current task is wasted. Three components of the method currently load more than necessary:

1. **Rules** — all rules loaded every session, even when irrelevant
2. **Sprint** — sprint history accumulates in a single file
3. **LYTOS.md** — loaded every first session (~200 lines) but only needed during initial setup

These optimizations follow the same pattern already applied to Memory (MEMORY.md → cortex/) and Issues (BOARD.md → archive/).

## 1. Rules — indexed loading

### Current
```
rules/
├── default-rules.md      # Always loaded (all 100+ lines)
└── api-rules.md           # Also always loaded
```

### Proposed
```
rules/
├── RULES.md              # Index — which rules to load based on task
├── default-rules.md      # Always loaded (core quality criteria)
├── api-rules.md           # Loaded when skill = api-design
├── security-rules.md      # Loaded when skill_aux includes security
└── frontend-rules.md      # Loaded for frontend tasks
```

RULES.md is a lightweight index (like MEMORY.md):

```markdown
# Rules Index

| File | Load when... |
|------|-------------|
| default-rules.md | Every session (core) |
| api-rules.md | skill = api-design |
| security-rules.md | skill or skill_aux includes security |
| frontend-rules.md | Frontend tasks |
```

The agent reads the index, identifies which rule files apply to the current task (based on the issue's `skill` and `skills_aux` fields), and loads only those.

### Impact
A project with 10 rule files loads 1 index + 1-3 relevant files instead of all 10.

## 2. Sprint — separate current from history

### Current
```
sprint.md                 # Current sprint + growing history section
```

### Proposed
```
sprint.md                 # Current sprint ONLY
sprints/
├── INDEX.md              # 1-line summary per past sprint
├── sprint-01.md          # Full detail (loaded for retros/planning only)
├── sprint-02.md
└── ...
```

INDEX.md follows the same pattern as archive/INDEX.md:

```markdown
# Sprint History

| Sprint | Objective | Duration | Issues | Key learning |
|--------|-----------|----------|--------|-------------|
| #01 | CLI MVP | 2026-04-13 → 2026-04-13 | 7 done | First release |
| #02 | Rename socle→lytos | 2026-04-14 → 2026-04-14 | 7 done | Multi-repo coordination |
```

### Impact
The agent loads only the current sprint.md (~30 lines) instead of a growing file. History is available via INDEX.md when needed for planning.

## 3. LYTOS.md — load only during setup

### Current behavior
LYTOS.md (~200 lines) is referenced in the CLAUDE.md/agents.md as "read during first session". But some agents load it every session because the instruction isn't clear enough.

### Proposed change
In the adapter files (CLAUDE.md, agents.md, .cursorrules), clarify:

```markdown
## First session ONLY (manifest is empty)
- .lytos/LYTOS.md — understand the method

## Every session
- .lytos/manifest.md
- .lytos/memory/MEMORY.md
- .lytos/rules/RULES.md (then load relevant rule files)
```

No change to LYTOS.md itself — just make the "first session only" instruction explicit and unambiguous in all adapters.

## Design principle

All three optimizations follow the same pattern:

```
INDEX (lightweight, always loaded)
  → points to DETAIL files (loaded on demand)
```

This is the core token optimization strategy of Lytos:
- Memory: MEMORY.md → cortex/
- Issues: BOARD.md → archive/INDEX.md → archive/YYYY-QN/
- Rules: RULES.md → individual rule files
- Sprints: sprint.md (current) + sprints/INDEX.md → sprint-NN.md

## Checklist

### Rules indexing
- [ ] Create RULES.md index template
- [ ] Document rule-to-skill mapping convention
- [ ] Update session-start skill to reference RULES.md
- [ ] Update starter template

### Sprint separation
- [ ] Create sprints/ directory in structure
- [ ] Create sprints/INDEX.md template
- [ ] Update `lyt init` to create sprints/ directory
- [ ] Document when to archive a sprint

### LYTOS.md loading
- [ ] Update CLAUDE.md template — clarify "first session only"
- [ ] Update .cursorrules template
- [ ] Update agents.md template (Codex)
- [ ] Update session-start skill

## Definition of done

- Rules loaded selectively based on task skill
- Sprint history separated from current sprint
- LYTOS.md explicitly marked as first-session-only in all adapters
- All templates and starter updated
- Pattern documented: "index → detail" as the Lytos token optimization strategy
