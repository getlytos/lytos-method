---
id: ISS-0023
title: "Gitignore .lytos/review/ in starter scaffold"
type: chore
priority: P2-normal
effort: XS
complexity: light
domain: [starter]
skill: "code-structure"
skills_aux: []
status: 4-review
branch: "chore/ISS-0023-propagate-review-gitignore"
depends: []
created: 2026-04-24
updated: 2026-04-24
---

# ISS-0023 — Gitignore `.lytos/review/` in starter scaffold

## Context

The `lyt review` command in lytos-cli writes cross-model audit prompts to `.lytos/review/<id>.prompt.md`. The code describes this as a **transient work area** — these files are meant to be pasted into another AI chat and then discarded, not versioned.

lytos-cli has shipped the corresponding rule in its own `.lytos/.gitignore` and in its bundled `.gitignore` template via **lytos-cli ISS-0072**. The propagation rule requires the same fix in this starter, so that fresh Lytos projects ignore `.lytos/review/` from day one.

## Proposed solution

Add the exclusion to [starter/.lytos/.gitignore](../../../../starter/.lytos/.gitignore):

```gitignore
# Audit-prompt work area for `lyt review` — transient, never commit
review/
```

## Definition of done

- [x] `starter/.lytos/.gitignore` excludes `review/` with an explanatory comment
- [x] No other change needed in this repo (the cli-rules documenting the convention live in lytos-cli, not in the method)

## Notes

One-line propagation of lytos-cli ISS-0072. Kept as a separate issue because lytos-method and lytos-cli have independent issue numbering and commit pre-hooks enforce `type/ISS-XXXX-slug` branches.
