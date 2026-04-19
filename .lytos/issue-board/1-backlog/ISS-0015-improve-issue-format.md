---
id: ISS-0015
title: "Improve issue format — sequential checklists and incomplete status"
type: improvement
priority: P1-high
effort: S
complexity: light
skill: documentation
status: 1-backlog
branch: "docs/ISS-0015-improve-issue-format"
depends: []
created: 2026-04-15
updated: 2026-04-15
---

# ISS-0015 — Improve issue format — sequential checklists and incomplete status

## Context

During ISS-0024 implementation, two problems appeared:

1. **Checklist items looked independent but had hidden dependencies.** "Translate templates for FR" depended on the profile and language system being built first, but the checklist listed them as parallel items. The agent skipped the translation without realizing it was a dependency.

2. **No way to mark an issue as "done with gaps."** ISS-0024 was closed at 100% but the FR templates were missing. The method needs a way to flag incomplete items so they generate follow-up issues instead of being silently forgotten.

## Proposed changes to the method

### 1. Sequential vs parallel checklist items

Add a convention in the issue template:

```markdown
## Checklist (sequential)

1. [ ] Build the language selection system
2. [ ] Build the profile selection system
3. [ ] Write briefings EN
4. [ ] Write briefings FR
5. [ ] Translate templates for FR (depends on steps 1-2)
6. [ ] Update tests
```

Use numbered lists for sequential items (order matters), bullet lists for parallel items (order doesn't matter). Document this in the issue template.

### 2. Close procedure: incomplete items generate follow-up issues

Add to the session-start skill's Phase 4 (Close):

> Before closing an issue, review all checklist items. Any unchecked item must either:
> - Be completed now, or
> - Generate a new issue with a `depends` link to the current issue

This prevents silent gaps.

### 3. Update issue templates

Update `issue-board/templates/issue-feature.md` and `issue-task.md` to document the sequential vs parallel convention.

## Checklist

- [ ] Document sequential (numbered) vs parallel (bullet) checklist convention
- [ ] Add incomplete-item rule to session-start skill Phase 4
- [ ] Update issue templates with the convention
- [ ] Update the starter template

## Definition of done

- Issue templates document the checklist convention
- session-start skill enforces incomplete-item follow-up rule
- Starter template updated
