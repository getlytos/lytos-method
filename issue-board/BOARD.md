# Issue Board — Le Socle Setup

> Progress tracking for setting up Le Socle on the project.
> Each issue = a `ISS-XXXX-title.md` file in the folder corresponding to its status.
> Move the file from one folder to another when the status changes.
>
> **Last updated**: 2026-04-14
>
> **Next number**: ISS-0014

> This file can be regenerated automatically: `python .socle/scripts/generate-board.py`

---

## Kanban Columns

| Folder | Description |
|--------|-------------|
| `0-icebox/` | Ideas, not yet prioritized |
| `1-backlog/` | Prioritized, ready to be planned |
| `2-sprint/` | Current sprint (committed) |
| `3-in-progress/` | In active development |
| `4-review/` | In review / test / staging |
| `5-done/` | Completed and deployed |

---

## Issue Index

### 0-icebox (ideas)

| # | Title | Priority | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0006](0-icebox/ISS-0006-creer-skill-specifique.md) | Create a project-specific skill | P2-normal | M | ISS-0004 |

### 1-backlog (prioritized)

| # | Title | Priority | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0004](1-backlog/ISS-0004-ecrire-premier-sprint.md) | Write the first sprint | P1-high | S | ISS-0003 |
| [ISS-0005](1-backlog/ISS-0005-configurer-adapter-ia.md) | Configure the project's AI adapter | P1-high | XS | ISS-0002 |

### 2-sprint (committed)

| # | Title | Priority | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0009](2-sprint/ISS-0009-rename-method-repo-content.md) | Replace all socle references in method repo | P0-critical | L | ISS-0008 |
| [ISS-0010](2-sprint/ISS-0010-rename-cli-repo-content.md) | Replace all socle references in CLI repo | P0-critical | L | ISS-0008 |
| [ISS-0011](2-sprint/ISS-0011-rename-website-content.md) | Replace all socle references in website repo | P0-critical | M | ISS-0008 |
| [ISS-0012](2-sprint/ISS-0012-publish-npm-and-deprecate.md) | Publish lytos on npm, deprecate le-socle | P0-critical | S | ISS-0010 |
| [ISS-0013](2-sprint/ISS-0013-configure-domains.md) | Configure lytos.org and lytos.dev domains | P1-high | S | ISS-0007 |

### 3-in-progress (in dev)

| # | Title | Priority | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0003](3-in-progress/ISS-0003-definir-rules-projet.md) | Define project-specific rules | P1-high | S | ISS-0002 |

### 4-review (review/test)

_No issues._

### 5-done (completed)

| # | Title | Completed |
|---|-------|-----------|
| [ISS-0001](5-done/ISS-0001-installer-socle.md) | Install Le Socle in the project | 2026-04-12 |
| [ISS-0002](5-done/ISS-0002-remplir-manifest.md) | Fill in the project manifest | 2026-04-12 |
| [ISS-0007](5-done/ISS-0007-rename-github-org.md) | Create GitHub organization getlytos | 2026-04-14 |
| [ISS-0008](5-done/ISS-0008-create-repos.md) | Create repositories under getlytos | 2026-04-14 |

---

## Workflow

1. **Create**: copy `templates/issue-feature.md` or `templates/issue-task.md` → `0-icebox/ISS-XXXX-title.md`
2. **Prioritize**: move to `1-backlog/`
3. **Plan**: move to `2-sprint/`
4. **Start**:
   - Create the git branch: `git checkout -b <type>/ISS-XXXX-title-kebab`
   - Move the .md file to `3-in-progress/`
   - Update the YAML frontmatter (`status: 3-in-progress`)
   - Update this BOARD.md (or regenerate via the script)
5. **Review**:
   - Open the PR: `gh pr create --title "<type>(scope): ISS-XXXX description"`
   - Move the .md file to `4-review/`
   - Update the frontmatter and this BOARD.md
6. **Complete**:
   - Merge the PR: `gh pr merge <n> --squash --delete-branch`
   - Move the .md file to `5-done/`
   - Update the frontmatter and this BOARD.md
7. **Increment** the "Next number" at the top of this file

> **MANDATORY RULE for agents**: each issue worked on must follow this workflow.
> The git branch MUST be named after the issue: `<type>/ISS-XXXX-title-kebab`.
> The .md file MUST be moved at each status change.
> The YAML frontmatter MUST be updated (it is the source of truth).
> The BOARD.md MUST be updated at each move.

---

## Conventions

- **Numbering**: `ISS-XXXX` sequential (zero-padded 4 digits)
- **File naming**: `ISS-XXXX-short-title-in-kebab.md`
- **Branch naming**: `<type>/ISS-XXXX-title-kebab` (e.g.: `feat/ISS-0001-add-cart`)
- **Commit naming**: `<type>(scope): ISS-XXXX description`
- **Priorities**: P0-critical, P1-high, P2-normal, P3-low
- **Types**: feat, fix, refactor, docs, chore, test, infra
- **Templates**: `templates/issue-feature.md` (complex) or `templates/issue-task.md` (micro-task)

---

## Source of truth

The **YAML frontmatter** of each issue is the source of truth for status, dependencies, and assigned skill. This BOARD.md is an overview — not an independent source of truth.

In case of conflict between an issue's frontmatter and this file, **the frontmatter takes precedence**.

The script `scripts/generate-board.py` can regenerate the index from the frontmatter.

---

*The frontmatter is the truth. The folder is the visual status. The BOARD.md is the map.*
