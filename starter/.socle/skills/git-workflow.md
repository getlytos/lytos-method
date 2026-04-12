# Skill — Git Workflow

*This skill defines the Git conventions to follow on a project using Le Socle. It covers branch naming, commit format, merge workflow, and collaboration rules. An agent loaded with this skill applies these conventions without deviation.*

---

## When to invoke this skill

- At each branch creation
- At each commit
- When opening a PR
- In case of conflict or question about the workflow

---

## Branch naming convention

### Format

```
type/ISS-XXXX-descriptive-slug
```

### Branch types

| Type | Usage | Example |
|------|-------|---------|
| `feat` | New feature | `feat/ISS-0012-add-cart` |
| `fix` | Bug fix | `fix/ISS-0034-login-error` |
| `refactor` | Refactoring with no functional change | `refactor/ISS-0045-extract-auth-service` |
| `chore` | Technical task (config, deps, CI) | `chore/ISS-0050-update-dependencies` |
| `docs` | Documentation only | `docs/ISS-0022-readme-payment-module` |
| `test` | Adding or fixing tests | `test/ISS-0028-unit-tests-tax-calculation` |

### Rules

- Always link to an issue (ISS-XXXX)
- The slug is in kebab-case, in French or English depending on the project
- No branch without an issue — if the work isn't in an issue, create the issue first
- No long-lived branches — one branch = one issue = one defined scope

---

## Commit format

### Format

```
type(scope): short message

Optional body — explanation of the why if needed.

Refs: ISS-XXXX
```

### Examples

```
feat(cart): add tax calculation by country

The tax rate is now dynamically determined based on the
shipping country instead of using a fixed rate.

Refs: ISS-0012
```

```
fix(auth): fix redirect after OAuth login

The OAuth callback was redirecting to /home instead of the
original page stored in session.

Refs: ISS-0034
```

```
chore(deps): update Laravel 11.x to 11.5

Refs: ISS-0050
```

### Commit types

| Type | Description |
|------|-------------|
| `feat` | New user-facing feature |
| `fix` | Bug fix |
| `refactor` | Code change with no behavior modification |
| `chore` | Technical task with no functional impact |
| `docs` | Documentation change only |
| `test` | Adding or modifying tests |
| `style` | Formatting, whitespace, semicolons (no logic change) |
| `perf` | Performance improvement |

### Commit rules

- The short message is **max 72 characters**
- The message is in French or English — consistent with the project
- The verb is in the **infinitive** in French ("ajouter", "corriger") or **imperative** in English ("add", "fix")
- One commit = one logical change. No catch-all commits
- No `WIP` or `temp` in the final history (squash before merge if needed)
- Always reference the issue with `Refs: ISS-XXXX`

---

## Workflow

### The standard cycle

The issue folder represents its status. Move the `.md` file at each step change.

```
1. Create the issue        ->  issue-board/0-icebox/ISS-XXXX-title.md
2. Prioritize              ->  move to 1-backlog/
3. Plan in the sprint      ->  move to 2-sprint/
4. Start work              ->  create branch type/ISS-XXXX-slug
                               move to 3-in-progress/
                               update BOARD.md
5. Develop                 ->  atomic, well-named commits
6. Push                    ->  git push -u origin type/ISS-XXXX-slug
7. Open a PR               ->  target the dev branch (or main depending on the project)
                               move to 4-review/
                               update BOARD.md
8. Code review             ->  via the code-review skill
9. Corrections if needed   ->  additional commits on the branch
10. Merge                  ->  squash & merge, delete the branch
                               move to 5-done/
                               update BOARD.md
11. Update the memory      -> if learning occurred
```

> **Rule**: the .md file MUST be moved at each status change.
> The BOARD.md MUST be updated at each move.

### Main branches

| Branch | Role | Who merges |
|--------|------|------------|
| `main` | Production — always stable | Human only |
| `dev` | Integration — default PR target | After approved review |
| `type/ISS-XXXX-*` | Work branch — ephemeral | The PR author |

### Merge rules

- **Never** push directly to `main` or `dev`
- Every change goes through a PR
- A PR must have at least one review (agent or human)
- Conflicts are resolved on the work branch, not on `dev`
- After merge, the branch is deleted

---

## Pull Requests

### PR title

```
[ISS-XXXX] Type: Short description
```

Examples:
- `[ISS-0012] feat: Add tax calculation by country`
- `[ISS-0034] fix: Fix OAuth redirect`

### PR body

```markdown
## Context
Why this PR exists — link to the issue.

## Changes
- List of main modifications
- Not every line changed — the important points

## Tests
- How to verify it works
- Tests added or modified

## Screenshots
(if visual change)
```

### PR checklist

- [ ] Tests pass
- [ ] Code follows the project rules
- [ ] Documentation is up to date
- [ ] Issue is linked
- [ ] Branch is up to date with `dev`

---

## Conflict resolution

1. Switch to the work branch
2. Pull the latest changes from `dev`: `git rebase dev` or `git merge dev`
3. Resolve conflicts file by file
4. Verify that tests pass after resolution
5. Push the updated branch

**Never** resolve a conflict by blindly overwriting changes from the other branch.

---

## Checklist before considering the workflow complete

- [ ] The branch follows the naming convention
- [ ] Commits follow the `type(scope): message` format
- [ ] Each commit references the issue
- [ ] The PR is opened with correct title and body
- [ ] Review is requested

---

*This skill is immediately operational. An agent that loads it applies the project's Git conventions without further interpretation.*
