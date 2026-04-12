# Orchestrator

*The orchestrator is the mechanism that reads the sprint, analyzes dependencies between tasks, and decides which agents to launch in parallel or in sequence. It is not a special agent — it is a planning logic.*

---

## Principle

The orchestrator applies a simple rule:

> Tasks without dependencies start in parallel.
> Tasks with dependencies wait for their prerequisites to be completed.

It is the same principle as a `Makefile` or a CI pipeline: a directed acyclic graph (DAG) of tasks.

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

## Full Example — REST API Sprint

```
Sprint #01 — Books and collections CRUD (BookShelf API)
Objective: deliver the CRUD endpoints for books and collections

ISS-0001  Create SQLAlchemy models                   [M] code-structure    depends: []
ISS-0002  Implement Book repository                  [S] code-structure    depends: [ISS-0001]
ISS-0003  Create CRUD routes /books                  [M] code-structure    depends: [ISS-0002]
ISS-0004  Implement Collection repository            [S] code-structure    depends: [ISS-0001]
ISS-0005  Create CRUD routes /collections            [M] code-structure    depends: [ISS-0004]
ISS-0006  Unit tests for repositories                [S] testing           depends: [ISS-0002, ISS-0004]
ISS-0007  E2E tests for routes                       [M] testing           depends: [ISS-0003, ISS-0005]
ISS-0008  API documentation                          [S] documentation     depends: [ISS-0003, ISS-0005]

Event-driven execution:
→ ISS-0001 starts immediately (no dependencies)
→ ISS-0001 completed → ISS-0002 and ISS-0004 unblocked → launched in parallel
→ ISS-0002 completed → ISS-0003 and ISS-0006 unblocked
→ ISS-0004 completed → ISS-0005 and ISS-0006 unblocked (ISS-0006 was waiting for both)
→ ISS-0003 + ISS-0005 completed → ISS-0007 and ISS-0008 unblocked
```

---

## Current State vs Vision

**Today** (April 2026), most AI tools (Claude Code, Cursor, GPT) execute tasks **sequentially**. A human launches an agent, the agent performs a task, then the human launches the next one. Native parallelization with coordinated orchestration is not yet standard.

**What the dependency graph brings right now**:
- It **orders** tasks — you know what to do first, and why
- It **reveals blockers** — if ISS-0002 depends on ISS-0001, you don't start ISS-0002 until ISS-0001 is completed
- It **prepares for scalability** — when tools natively support parallel sub-agents, the sprint is already structured to take advantage

**What will come**:
- Native multi-agent orchestration in AI tools
- Real event-driven parallel execution
- Dynamic allocation of agent count based on complexity

Le Socle is designed for this transition. The method is ready, the tools will follow.

---

## Orchestrator Rules

1. **Never launch a task whose dependencies are not completed**
2. **Launch as soon as ready** — no artificial waves, a task starts as soon as its depends are done
3. **One main skill per task** — the agent loads the skill assigned to the issue, but can load auxiliary skills if the task requires it (e.g.: `code-structure` as main + `testing` for associated tests). The `skills_aux` field in the issue frontmatter lists these complementary skills
4. **The human validates the gates** — the orchestrator cannot pass a quality gate without human validation
5. **When in doubt, ask** — a blocked agent asks the human rather than guessing
6. **The YAML frontmatter is the source of truth** — it is the frontmatter `status` field that is authoritative, not the BOARD.md or sprint.md

---

*The orchestrator is not a super-agent. It is a planning logic that respects the dependency graph defined by the human in the sprint.*
