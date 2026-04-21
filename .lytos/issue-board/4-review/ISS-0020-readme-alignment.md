---
id: ISS-0020
title: "Align lytos-method README opening with the website's hook + audience pattern"
type: chore
priority: P2-normal
effort: S
complexity: light
domain: [docs]
skill: ""
skills_aux: []
status: 4-review
branch: "chore/ISS-0020-readme-alignment"
depends: []
created: 2026-04-21
updated: 2026-04-21
---

# ISS-0020 — Align README opening with the website's hook + audience pattern

## Context

The website home was restructured around a qualifying hook ("Do you develop with AI?") followed by a "Who it's for" audience table. The lytos-cli README was aligned on the same pattern in ISS-0052 (pending merge on lytos-cli#4).

The lytos-method README currently opens with "The problem everyone recognizes" / "What if the AI remembered?" — well-written but different in voice. The audience table is absent, so a visitor (especially a non-developer exec) has no "is this for me?" qualifier on the repo page.

This issue aligns the **top** of the README with the website pattern, while preserving the method-specific content below (5 pillars, CLI commands, 3 adoption levels, sovereignty, 9 skills, founding principles).

## Proposed solution

Swap the opening section (roughly lines 12–53) with:

1. Hook: "Do you develop with AI?" (verbatim from website EN home)
2. "Who it's for" audience table (4 rows: vibe-coder, developer, team, decision-maker)
3. Short install block (kept as-is)
4. One-line bridge into the rest of the README

Do the same on `docs/fr/README.md` with the FR home copy.

The rest of the README stays intact.

## Definition of done

- [ ] EN README opens with hook + audience table
- [ ] FR README mirrors EN structurally, copy pulled from the website FR home
- [ ] Cross-links EN ↔ FR still resolve
- [ ] Method-specific sections (5 pillars, CLI, adoption levels, teams, sovereignty, skills, principles) are preserved
- [ ] No broken internal or external links introduced

## Relevant files

- `README.md` (EN, root)
- `docs/fr/README.md` (FR)

## Notes

- This is batch 2 of three parallel README alignments (cli done in lytos-cli#4, method here, org profile `getlytos/.github` is batch 3).
- The website FR home (`src/content/docs/fr/index.mdx` on lytos-website) is the source of truth for French voice.
