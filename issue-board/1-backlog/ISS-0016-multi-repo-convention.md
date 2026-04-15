---
id: ISS-0016
title: "Document multi-repo convention — one issue per repo, independent numbering"
type: docs
priority: P1-high
effort: S
complexity: light
skill: documentation
status: 1-backlog
branch: "docs/ISS-0016-multi-repo"
depends: []
created: 2026-04-15
updated: 2026-04-15
---

# ISS-0016 — Document multi-repo convention — one issue per repo, independent numbering

## Context

Lytos does not document how to handle multi-repo projects. During the socle→lytos rename sprint, we experienced:
- Issues created in repo A for work done in repo B
- Numbering conflicts when migrating issues between repos
- Cross-repo work tracked as a single issue instead of one per repo

These problems will be common for any team with multiple repos (frontend, backend, infra, method, CLI, etc.).

## The rule

**One issue = one repo = one branch.**

Each repo has its own `.lytos/issue-board/` with independent numbering. Issues never move between repos.

### Single-repo task

Standard. The issue lives in the repo where the code changes.

### Cross-repo task

Split into one issue per repo. Link them in the context section:

```markdown
## Context

Part of the cross-repo rename initiative.
See also:
- lytos-method ISS-0011 — rename in method repo
- lytos-cli ISS-0012 — rename in CLI repo
- lytos-website ISS-0013 — rename in website repo
```

Each issue is independent: its own branch, its own checklist, its own close phase. They can be worked in parallel by different people or the same person.

### What this means for numbering

- lytos-method has ISS-0001, ISS-0002, ...
- lytos-cli has ISS-0001, ISS-0002, ...
- lytos-website has ISS-0001, ISS-0002, ...

Numbers are scoped to the repo. No global numbering. The SaaS will display them as `method#ISS-0001`, `cli#ISS-0012` etc.

### Upstream/downstream coherence rule

When a change in an upstream repo (e.g. lytos-method) affects what a downstream repo generates or distributes (e.g. lytos-cli), a mirror issue must be created in the downstream repo to ensure coherence.

Example: adding a new rule in `lytos-method/rules/default-rules.md` must trigger an issue in `lytos-cli` to verify that `lyt init` downloads and installs the updated file, and that `lyt upgrade` (when available) will propagate the change to existing users.

> **Rule: any change in lytos-method that affects generated content must have a corresponding issue in lytos-cli.**

## Checklist

- [ ] Add "Multi-repo projects" section to LYTOS.md (the method reference)
- [ ] Add the rule to README.md (method repo)
- [ ] Add the rule to docs/fr/README.md
- [ ] Update issue templates with cross-repo link example
- [ ] Add to the starter template

## Definition of done

- Multi-repo convention documented in LYTOS.md
- Cross-repo issue linking convention with example
- Independent numbering per repo explicitly stated
- Updated in EN and FR
