# Orchestrator

*The orchestrator is the mechanism that reads the sprint, analyzes dependencies between tasks, and decides which agents to launch in parallel or in sequence. It is not a special agent — it is a planning logic.*

---

## Principle

The orchestrator applies a simple rule:

> Tasks without dependencies start in parallel.
> Tasks with dependencies wait for their prerequisites to be completed.

It is the same principle as a `Makefile` or a CI pipeline: a directed acyclic graph (DAG) of tasks.

---

## Task lifecycle

Each task passes through **4 phases**. The orchestrator does not consider a task complete until all phases are done.

### Phase 1 — Bootstrap (session-start skill)

Every task begins with the session-start procedure. The agent:

1. Loads global context (manifest, memory summary, rules, board)
2. Reads the issue and identifies the assigned skill
3. Loads task-specific context (relevant memory sections, model by complexity)
4. Checks work status (existing branch, recent commits, blockers)

This phase is not optional. An agent that skips it produces generic output.

### Phase 2 — Execute (main skill + auxiliary skills)

The agent applies the assigned skill to produce its output (code, documentation, review...).

If the task requires multiple skills, the agent loads them in this order:
1. **Main skill** — the one in the issue's `skill` field. It defines what the agent produces.
2. **Auxiliary skills** — listed in the issue's `skills_aux` field. They add constraints and checks.

The main skill drives the work. Auxiliary skills add guardrails. See the skill composition matrix below.

### Phase 3 — Verify (testing + security)

Before marking a task as done, the agent verifies its own output:

- [ ] Tests pass (unit + integration + E2E as applicable)
- [ ] No security violations (secrets, injection, access control)
- [ ] Code follows the project rules (structure, naming, hardcoded values)
- [ ] Self-review done (re-read the diff, check for debug code, TODOs)

This is the agent checking its own work — not a formal review.

### Phase 4 — Close (session-start completion procedure)

The agent performs the 4 mandatory closure actions:
1. Update the issue frontmatter (status → `4-review` or `5-done`)
2. Move the issue file to the correct board folder
3. Update BOARD.md
4. If learning occurred → write to the relevant cortex file

The task is not "done" until these 4 steps are complete.

---

## Sprint Format

The orchestrator reads the `sprint.md` file. Each task in the backlog has these fields:

| Field | Role |
|-------|------|
| `ID` | Unique identifier (ISS-XXXX) |
| `Title` | Short description |
| `Effort` | Size estimate (XS, S, M, L, XL) |
| `Skill` | The skill to load for this task |
| `Depends` | The IDs of prerequisite tasks (empty = no dependency) |
| `Status` | Current state (open, in-progress, done) |

---

## Skill composition matrix

Different task types require different skill combinations. The main skill defines the output. Auxiliary skills add quality constraints.

| Task type | Main skill | Auxiliary skills | What happens |
|-----------|-----------|-----------------|-------------|
| New feature (backend) | `code-structure` | `testing`, `security` | Agent builds the feature, writes tests, checks security |
| New API endpoint | `api-design` | `code-structure`, `security`, `testing` | Agent designs the endpoint following REST conventions, structures code, secures it, tests it |
| Bug fix | `code-structure` | `testing` | Agent fixes the bug, writes a regression test |
| Code review | `code-review` | `security` | Agent reviews code and checks for security flaws |
| Test coverage | `testing` | `security` | Agent writes tests, includes security edge cases |
| Documentation | `documentation` | — | Agent documents code, updates memory |
| Deployment | `deployment` | `security` | Agent prepares deployment, checks secrets and config |
| Refactoring | `code-structure` | `testing` | Agent refactors, ensures tests still pass |
| Security audit | `security` | `code-review` | Agent audits for vulnerabilities, produces review-format findings |

### How auxiliary skills work

The agent reads auxiliary skills after the main skill. It does not execute them as separate procedures — it integrates their constraints into the main workflow.

Example: an agent with main skill `api-design` and auxiliary `security`:
- It designs the endpoint following `api-design` conventions
- While designing, it applies `security` rules: input validation, auth checks, no secrets in responses
- It does NOT run a separate security audit — it builds security in

### The `skills_aux` field

In the issue frontmatter:

```yaml
skill: api-design
skills_aux: [code-structure, security, testing]
```

If `skills_aux` is empty or absent, the agent uses only the main skill. The matrix above is a recommendation — the human defines the actual combination per issue.

---

## Reading the Dependency Graph

### Step 1 — Build the graph

The orchestrator iterates through all tasks and builds a graph:

```yaml
tasks:
  - id: ISS-0001
    title: Create the database schema
    effort: M
    skill: code-structure
    depends: []

  - id: ISS-0002
    title: Implement the Product model
    effort: S
    skill: code-structure
    depends: [ISS-0001]

  - id: ISS-0003
    title: Write tests for the Product model
    effort: S
    skill: testing
    depends: [ISS-0002]

  - id: ISS-0004
    title: Create the REST API /products
    effort: M
    skill: code-structure
    depends: [ISS-0002]

  - id: ISS-0005
    title: Write the API documentation
    effort: S
    skill: documentation
    depends: [ISS-0004]
```

### Step 2 — Launch ready tasks (event-driven)

The orchestrator does not work in rigid "waves". It applies a simple rule:

> **As soon as a task has all its dependencies in `5-done`, it is ready to start.**

No need to wait for an entire group. Each completed task potentially unblocks the next ones.

```
Orchestrator cycle:

1. Read the YAML frontmatter of all issues
2. Identify tasks whose status != done AND all depends are done
3. For each ready task → invoke an agent with the corresponding skill
4. When a task completes → go back to step 1
```

### Example on the previous graph

```
ISS-0001 (depends: [])       → ready immediately → launched
ISS-0001 completed           → ISS-0002 unblocked → launched
ISS-0002 completed           → ISS-0003 AND ISS-0004 unblocked → launched in parallel
ISS-0004 completed           → ISS-0005 unblocked → launched (without waiting for ISS-0003)
ISS-0003 completed (later)   → nothing new to unblock
```

The difference from a wave-based system: ISS-0005 does not wait for ISS-0003 to complete. It only depends on ISS-0004 — as soon as ISS-0004 is done, it starts.

---

## Visual Representation

The sprint.md contains an ASCII graph to visualize dependencies:

```
ISS-0001 ──────────────────────────────────────────►
    DB Schema                                       │
                                                    ▼
                                               ISS-0002
                                          Product Model
                                               │       │
                              ┌────────────────┘       └────────────────┐
                              ▼                                         ▼
                         ISS-0003                                  ISS-0004
                      Product Tests                             API /products
                                                                    │
                                                                    ▼
                                                               ISS-0005
                                                            Documentation
```

---

## Handling Blockers

If a task is blocked (failure, question for the human, external dependency):

1. The agent flags the blocker in the issue
2. The orchestrator **does not block the rest** — other ready tasks continue
3. Tasks that depend on the blocked task are put on hold
4. The human is notified to unblock

---

## Effort Management

The estimated effort influences orchestration:

| Effort | Meaning | Impact |
|--------|---------|--------|
| XS | < 15 min | Can be grouped with other XS |
| S | 15-30 min | Standalone task |
| M | 30 min - 2h | Substantial task — a dedicated agent |
| L | 2h - 4h | Consider splitting into sub-tasks |
| XL | > 4h | **Must** be split — too large for a single issue |

---

## Quality gates

Quality gates are mandatory checkpoints. A task cannot move to the next status until the gate passes.

| Transition | Gate | Who validates |
|-----------|------|---------------|
| `3-in-progress` → `4-review` | Tests pass, self-review done, CI green | Agent (automated) |
| `4-review` → `5-done` | Code review approved (no unresolved CRITICAL) | Human or review agent |
| Sprint completion | All quality criteria from `sprint.md` gates section met | Human |

### Definition of Done

A task is "done" when ALL of the following are true:

- [ ] The code works and meets the issue's acceptance criteria
- [ ] Unit tests + integration tests pass (new tests written if new logic)
- [ ] No security violations (checked against `security` skill checklist)
- [ ] Code follows project rules (`rules/default-rules.md`)
- [ ] Self-review completed (no debug code, no TODOs without issue reference)
- [ ] CI checks pass (tests, linter, security audit, build)
- [ ] Code review approved (no unresolved CRITICAL comments)
- [ ] Issue frontmatter updated, file moved, BOARD.md updated
- [ ] Memory updated if learning occurred

The orchestrator checks gates automatically when it detects a status change. If the gate fails, the task stays in its current status.

---

## Full Example — REST API Sprint

```
Sprint #01 — Books and collections CRUD (BookShelf API)
Objective: deliver the CRUD endpoints for books and collections

ISS-0001  Create SQLAlchemy models                   [M] code-structure    aux: [security]        depends: []
ISS-0002  Design /books API endpoints                [M] api-design        aux: [code-structure, security]  depends: [ISS-0001]
ISS-0003  Design /collections API endpoints          [M] api-design        aux: [code-structure, security]  depends: [ISS-0001]
ISS-0004  Write tests for /books                     [S] testing           aux: [security]        depends: [ISS-0002]
ISS-0005  Write tests for /collections               [S] testing           aux: [security]        depends: [ISS-0003]
ISS-0006  Security audit on all endpoints            [S] security          aux: [code-review]     depends: [ISS-0002, ISS-0003]
ISS-0007  API documentation (OpenAPI)                [S] documentation     aux: []                depends: [ISS-0002, ISS-0003]
ISS-0008  Deployment preparation                     [S] deployment        aux: [security]        depends: [ISS-0004, ISS-0005, ISS-0006]

Event-driven execution:
→ ISS-0001 starts (no dependencies)
  Agent loads: session-start → code-structure + security → self-verify → close
→ ISS-0001 done → ISS-0002 and ISS-0003 unblocked → launched in parallel
  Each agent loads: session-start → api-design + code-structure + security → self-verify → close
→ ISS-0002 done → ISS-0004 and ISS-0006 (partially) unblocked
→ ISS-0003 done → ISS-0005 and ISS-0006 (fully) unblocked, ISS-0007 unblocked
  ISS-0004, ISS-0005, ISS-0006, ISS-0007 → launched in parallel
→ ISS-0004 + ISS-0005 + ISS-0006 done → ISS-0008 unblocked
  Agent loads: session-start → deployment + security → verify → close
```

Notice:
- Every task shows its **auxiliary skills** — not just the main one
- Every agent execution follows the **4-phase lifecycle** (bootstrap → execute → verify → close)
- The security skill appears in 6 out of 8 tasks — because security is not a phase, it is a constraint woven into every task
- api-design is used for API endpoints instead of code-structure — the right skill for the right job

---

## Current State vs Vision

**Today** (April 2026), most AI tools execute tasks **sequentially**. A human launches an agent, the agent performs a task, then the human launches the next one.

**What the orchestrator brings right now**:
- It **orders** tasks via the dependency graph — you know what to do first, and why
- It **composes skills** — each task loads the right combination, not just one skill
- It **enforces quality gates** — tasks don't ship without verification
- It **standardizes the lifecycle** — every task follows bootstrap → execute → verify → close
- It **prepares for parallelism** — when tools support native multi-agent, the sprint is already structured

**What will come**:
- Native multi-agent orchestration in AI tools
- Real event-driven parallel execution
- Dynamic skill composition based on task analysis
- Automated quality gate verification

Lytos is designed for this transition. The method is ready, the tools will follow.

---

## Orchestrator Rules

1. **Never launch a task whose dependencies are not completed**
2. **Launch as soon as ready** — no artificial waves, a task starts as soon as its depends are done
3. **One main skill per task** — the agent loads the skill assigned to the issue, but can load auxiliary skills if the task requires it (e.g.: `code-structure` as main + `testing` for associated tests). The `skills_aux` field in the issue frontmatter lists these complementary skills
4. **The human validates the gates** — the orchestrator cannot pass a quality gate without human validation
5. **When in doubt, ask** — a blocked agent asks the human rather than guessing
6. **The YAML frontmatter is the source of truth** — it is the frontmatter `status` field that is authoritative, not the BOARD.md or sprint.md
7. **Every task follows the 4-phase lifecycle** — bootstrap (session-start), execute (main + aux skills), verify (tests + security + self-review), close (issue + board + memory)
8. **Security is a default auxiliary** — unless the task is pure documentation, the security skill is loaded as auxiliary. Security is not a separate step — it is woven into every task.
9. **Quality gates are enforced** — a task cannot change status unless its gate conditions are met. The orchestrator checks gates before accepting a status transition.

---

*The orchestrator is not a super-agent. It is a planning logic that respects the dependency graph defined by the human in the sprint.*
