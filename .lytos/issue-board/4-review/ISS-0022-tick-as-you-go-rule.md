---
id: ISS-0022
title: "Codify tick-as-you-go: tick DoD checkboxes immediately, never in batch"
type: docs
priority: P1-high
effort: XS
complexity: light
domain: [method, skills]
skill: "documentation"
skills_aux: []
status: 4-review
branch: "feat/ISS-0022-tick-as-you-go"
depends: []
created: 2026-04-22
updated: 2026-04-22
---

# ISS-0022 — Codify tick-as-you-go as a Lytos practice

## Context

Mirror of lytos-cli ISS-0061 / PR #16. On lytos-cli's ISS-0059 (`lyt review` command), the implementer batched DoD checkbox ticks at end-of-task and landed the issue in `4-review` with 7 unchecked boxes that were actually done. Recurring failure mode across AI sessions.

The method needs a procedure rule, not a reminder: **when an item is done, tick it immediately — before moving to the next one**.

## Proposed solution

- `skills/session-start.md` gains a dedicated section "During execution — tick as you go" between step 6 of the startup protocol and the "Mid-session ideas" section.
- `LYTOS.md` "Expected behavior" list gains a bullet #3: "Tick the DoD as you go" (the existing 3 and 4 shift to 4 and 5).

## Definition of done

- [x] `skills/session-start.md` has the "During execution — tick as you go" section
- [x] `LYTOS.md` "Expected behavior" has the "Tick the DoD as you go" bullet
- [x] Content matches the lytos-cli mirror (same wording, same structure)

## Notes

- This is a pure documentation change — no scripts, no templates, no tests.
- The rule applies to itself: the implementer ticked DoD items as each edit was done.
