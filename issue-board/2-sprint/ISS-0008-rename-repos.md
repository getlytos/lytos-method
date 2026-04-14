---
id: ISS-0008
title: "Rename repositories socle → lytos, socle-cli → lytos-cli"
type: chore
priority: P0-critical
effort: XS
complexity: light
skill: ~
status: 2-sprint
depends: [ISS-0007]
created: 2026-04-14
updated: 2026-04-14
---

# ISS-0008 — Rename repositories socle → lytos, socle-cli → lytos-cli

## What to do

Rename repos via GitHub Settings > Repository name:
- `socle` → `lytos`
- `socle-cli` → `lytos-cli`

Update local git remotes on all clones:
```bash
git remote set-url origin https://github.com/lytos/lytos.git
git remote set-url origin https://github.com/lytos/lytos-cli.git
```

## Definition of done

- Both repos accessible at `github.com/lytos/lytos` and `github.com/lytos/lytos-cli`
- Local remotes updated and verified with `git remote -v`
