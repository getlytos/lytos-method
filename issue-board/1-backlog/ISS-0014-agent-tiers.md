---
id: ISS-0014
title: "Define agent tier system — calibrate AI tools by capability, not persona"
type: feature
priority: P1-high
effort: L
complexity: heavy
skill: ~
status: 1-backlog
branch: "feat/ISS-0014-agent-tiers"
depends: []
created: 2026-04-15
updated: 2026-04-15
---

# ISS-0014 — Define agent tier system — calibrate AI tools by capability, not persona

## Context

The Lytos manifesto currently rejects sub-agents. This was right to reject personas ("you are a senior architect") but wrong to reject capability routing. Sub-agents in Claude Code, Codex, and Cursor are not personas — they are tool configurations: model selection, tool restrictions, context isolation, and skill preloading.

The drill analogy: you don't give a drill a costume. You adjust its power, speed, and bit based on the material. Lytos should do the same with AI models.

## Core concept: tiers, not models

Lytos defines agents by **capability tier** (fast, standard, powerful), not by specific model. The mapping to actual models is done per provider. This makes agents portable across LLMs and resilient to model changes.

### The 3 tiers

| Tier | Usage | When to use |
|------|-------|-------------|
| `fast` | Documentation, search, lint, simple tasks | Low complexity, high volume, cost-sensitive |
| `standard` | Features, tests, code review | Standard development work |
| `powerful` | Architecture, heavy refactoring, complex decisions | High complexity, critical decisions |

### Provider mapping (default)

| Tier | Claude | GPT | Gemini | Mistral |
|------|--------|-----|--------|---------|
| `fast` | Haiku | gpt-4o-mini | Flash | Ministral |
| `standard` | Sonnet | gpt-4o | Pro | Large |
| `powerful` | Opus | o3 | Ultra | — |

Stored in `.lytos/models.yml`. Updated via `lyt upgrade` when models change. Overridable per project.

### Output calibration

Agents also have an `audience` parameter that adjusts output style without changing capability:

| Audience | Effect |
|----------|--------|
| `junior` | Explain choices, add comments, simplify, include references |
| `senior` | Concise, no obvious explanations, focus on edge cases and trade-offs |
| `pm` | Non-technical summary, business impact, no code |

This is NOT a persona. It's an output parameter — like DPI on a printer.

## Proposed solution

### 1. New method component: `.lytos/agents/`

A new directory (NOT a 6th pillar — agents are a tool configuration, part of Design) containing agent definition files:

```yaml
# .lytos/agents/doc-writer.md
---
tier: fast
task: documentation
audience: junior
tools: read-only
---

Write clear, accessible documentation. Follow the Lytos documentation skill.
```

```yaml
# .lytos/agents/feature-builder.md
---
tier: standard
task: implementation
audience: senior
tools: full
skills: [code-structure, testing, security]
---

Follow the Lytos method. Read manifest and rules first.
Always run tests before marking done.
```

```yaml
# .lytos/agents/architect.md
---
tier: powerful
task: architecture
audience: senior
tools: read-only
---

Analyze architecture decisions. Read manifest, memory, and existing code.
Propose options with trade-offs. Never implement directly.
```

### 2. Model mapping: `.lytos/models.yml`

```yaml
provider: claude  # or openai, gemini, cursor
fast: haiku
standard: sonnet
powerful: opus
```

One file to update when models change. `lyt upgrade` can refresh defaults.

### 3. Issue integration

The issue frontmatter `complexity` field maps to agent tiers:

```yaml
complexity: light    → tier: fast
complexity: standard → tier: standard
complexity: heavy    → tier: powerful
```

The orchestrator selects the right agent based on the issue's complexity and skill fields.

### 4. Adapter generation

`lyt init --tool claude` generates `.claude/agents/` files from `.lytos/agents/` definitions, mapping tiers to actual Claude models.

`lyt init --tool cursor` generates equivalent Cursor rules.

`lyt init --tool openai` generates equivalent OpenAI configs.

The Lytos definitions are the source of truth. The tool-specific files are generated views.

## What changes in the manifesto

Replace:
> "No sub-agents, no personas"

With:
> "Lytos does not dress up agents in costumes. Lytos calibrates the tool — model, capabilities, constraints — to match the task. The human remains the architect. The agent remains a tool. But a well-tuned tool."

## Checklist

### Method repo (lytos-method)
- [ ] Create `.lytos/agents/` directory with 3 default agents (doc-writer, feature-builder, architect)
- [ ] Create `.lytos/models.yml` with default mappings
- [ ] Document agent tiers in README and docs
- [ ] Update MANIFESTO.md — replace "no sub-agents" with calibration language
- [ ] Update adapters/ to show how agents map to Claude Code, Cursor, OpenAI
- [ ] Add agents to starter template

### CLI repo (lytos-cli)
- [ ] `lyt init` generates agent files
- [ ] `lyt init --tool claude` generates .claude/agents/ from .lytos/agents/
- [ ] `lyt upgrade` can update models.yml with new defaults
- [ ] Update documentation

### Website
- [ ] Document agent tiers on lytos.org
- [ ] Add to the method section

## Definition of done

- 3 default agents defined in the method (fast, standard, powerful)
- models.yml maps tiers to providers
- `lyt init` generates tool-specific agent configs
- Manifesto updated with calibration language
- Issue complexity field drives agent selection
- All documentation updated
- No model names hardcoded in agent definitions (only in models.yml)
