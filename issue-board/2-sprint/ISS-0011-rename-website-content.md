---
id: ISS-0011
title: "Replace all socle references in website repo"
type: refactor
priority: P0-critical
effort: M
complexity: standard
skill: ~
status: 2-sprint
branch: "refactor/ISS-0011-rename-website"
depends: [ISS-0008]
created: 2026-04-14
updated: 2026-04-14
---

# ISS-0011 — Replace all socle references in website repo

## Context

The website repo (Astro/Starlight) contains ~61 occurrences across 13 files. Config, docs EN/FR, and GitHub links.

## Checklist

### Config
- [ ] `astro.config.mjs` — site URL (`le-socle.github.io` → `lytos.org`), title, GitHub social link, sidebar labels

### Documentation EN
- [ ] `en/getting-started/installation.md` — npm, CLI, GitHub URLs, `.socle/` paths, `SOCLE.md`
- [ ] `en/getting-started/quickstart.md` — same
- [ ] `en/getting-started/introduction.mdx` — brand name
- [ ] `en/philosophy/index.md` — GitHub URLs
- [ ] `en/method/index.md` — GitHub URLs
- [ ] `en/cli/index.md` — GitHub URLs

### Documentation FR
- [ ] `fr/getting-started/installation.md` — mirror of EN changes
- [ ] `fr/getting-started/quickstart.md` — mirror of EN changes
- [ ] `fr/getting-started/introduction.mdx` — brand name
- [ ] `fr/philosophy/index.md` — GitHub URLs
- [ ] `fr/method/index.md` — GitHub URLs
- [ ] `fr/cli/index.md` — GitHub URLs

## Definition of done

- `grep -ri "socle" . --exclude-dir=node_modules --exclude-dir=.git` returns zero matches
- Site builds without errors (`npm run build`)
- All links point to `lytos.org` or `github.com/lytos/`
