---
id: ISS-0021
title: "Extend the branch-per-issue hook to allow archive-only commits"
type: chore
priority: P2-normal
effort: XS
complexity: light
domain: [git-hook, workflow]
skill: git-workflow
skills_aux: []
status: 1-backlog
branch: "chore/ISS-0021-hook-allow-archive-only-commits"
depends: []
created: 2026-04-22
updated: 2026-04-22
---

# ISS-0021 — Extend the `branch-per-issue` hook to allow archive-only commits

## Context

The `branch-per-issue` pre-commit hook blocks any commit on `main` without a feature branch matching `type/ISS-XXXX-slug`. That is the right default for code and issue work.

`lyt archive` (lytos-cli ISS-0051) legitimately needs to commit on `main` because archival is a mechanical meta-operation on closed issues — it moves files from `5-done/` to `archive/<quarter>/`, updates `archive/INDEX.md`, and regenerates `BOARD.md`. Today, the only way to land those changes is with `git commit --no-verify`, which defeats the safety layer.

## Proposed solution

Extend the hook to allow a commit when its diff matches **only** the archive surface:

- renames from `.lytos/issue-board/5-done/ISS-*.md` to `.lytos/issue-board/archive/<quarter>/ISS-*.md`
- modifications to `.lytos/issue-board/archive/INDEX.md`
- modifications to `.lytos/issue-board/BOARD.md`

If the commit touches anything outside that set, the hook rejects as usual.

The commit message should follow a recognizable pattern — e.g. start with `chore: archive ` or `archive:` — so an auditor can grep for it later.

## Definition of done

- [ ] Hook script (wherever it is sourced in the scaffold) recognizes the archive-only pattern
- [ ] A commit produced by `lyt archive` lands without `--no-verify` on a clean `main`
- [ ] A commit that mixes archive moves with other file changes is still rejected
- [ ] Test script or integration test covers both cases
- [ ] Doc (method README or `/method/issue-board` page) mentions the exception

## Relevant files

- Wherever the pre-commit hook template is defined and then installed by `lyt init` (method side, likely under `method/scripts/` or similar)
- Tests for the hook

## Notes

- Triggered by the lytos-cli ISS-0051 NO_GO audit, which flagged that `lyt archive` would currently require `--no-verify` to land its own commits.
- Keep the exception strict: archive-only means archive-only. Any creep makes the hook meaningless.
