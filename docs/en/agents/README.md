# Agents

*This folder documents how agents work in Lytos. Agents are not the subject — Lytos is. But understanding how they are invoked and orchestrated is essential.*

---

## Philosophy

In Lytos, agents are treated as **Kubernetes pods** — scalable computational intelligence, with no fixed identity.

### What agents are

- **Stateless** — they retain nothing between two invocations
- **Without identity** — no persona, no name, no backstory
- **Invoked by skill** — they receive a procedure, not a role
- **Ephemeral** — they are created for a task and released after

### What agents are not

- Not permanent team members
- Not personas with character traits
- Not specialized experts locked into a domain
- Not autonomous entities that decide on their own

---

## Agent Lifecycle

```
1. The orchestrator reads sprint.md
2. It identifies a ready task (all dependencies in 5-done)
3. It invokes an agent that follows the 4-phase lifecycle:

   Phase 1 — Bootstrap (session-start)
   ├── Load manifest, memory summary, rules, board
   ├── Read the issue and identify main + auxiliary skills
   ├── Load task-specific memory (by domain)
   └── Check work status (branch, commits, blockers)

   Phase 2 — Execute (main skill + auxiliary skills)
   ├── Apply the main skill procedure
   ├── Integrate auxiliary skill constraints
   └── Produce output (code, docs, review...)

   Phase 3 — Verify (self-check)
   ├── Tests pass (unit + integration + E2E)
   ├── Security checklist (no secrets, inputs validated)
   ├── Code follows project rules
   └── Self-review (re-read diff, check for debug code)

   Phase 4 — Close
   ├── Update issue frontmatter
   ├── Move issue file to correct board folder
   ├── Update BOARD.md
   └── Write to memory if learning occurred

4. The agent is released
```

---

## What an Agent Reads at Startup

| Source | Content | Required |
|--------|---------|----------|
| `manifest.md` | Project identity and intent | Yes |
| `memory/MEMORY.md` | Accumulated knowledge | Yes |
| `skills/[skill].md` | Procedure to follow for this task | Yes |
| `rules/*.md` | Quality criteria to comply with | Yes |
| `issue-board/[status]/ISS-XXXX-title.md` | Precise scope of the task | Yes |
| `skills/session-start.md` | Bootstrap procedure (always loaded first) | Yes |
| `sprint.md` | Current sprint context | Recommended |
| `skills/[aux_skill].md` | Auxiliary skill constraints (from `skills_aux` field) | If specified |

---

## What an Agent Writes

| Target | When |
|--------|------|
| Project files | Always — this is its main output |
| `memory/MEMORY.md` | If a significant learning occurred |
| `issue-board/[status]/ISS-XXXX-title.md` | To update the status (move between folders) |

An agent **never modifies** the manifest, skills, or rules. Only the human has that power.

---

## Scalability

The number of agents is determined by the sprint complexity, not by a fixed organization.

- Simple sprint (3-4 independent issues) → 1 sequential agent is enough
- Complex sprint (10+ issues with dependencies) → multiple agents in parallel
- The orchestrator manages allocation based on the dependency graph

### Skill composition scales with complexity

- Simple task (bug fix) → 1 main skill (`code-structure`) + 1 auxiliary (`testing`)
- Medium task (new endpoint) → 1 main skill (`api-design`) + 3 auxiliary (`code-structure`, `security`, `testing`)
- Complex task (payment integration) → 1 main skill + 4 auxiliary + dedicated security audit as follow-up task

The orchestrator does not assign more skills to make tasks better — it assigns the right skills for the task type. See the skill composition matrix in [orchestrator.md](./orchestrator.md).

---

## The 9 skills

| Skill | Purpose | Typical role |
|-------|---------|-------------|
| `session-start` | Bootstrap and close every task | Always loaded (phase 1 + 4) |
| `code-structure` | File structure, naming, SOLID, DI | Main for features, aux for API tasks |
| `code-review` | Review checklist, PR size, feedback format | Main for reviews |
| `testing` | Unit, integration, E2E, mocking strategy | Main for test tasks, aux for features |
| `documentation` | Docstrings, ADR, API docs, changelog, memory | Main for docs tasks |
| `git-workflow` | Branches, commits, CI, hooks, versioning | Reference (always applicable) |
| `deployment` | Pre/post-deploy, observability, SLOs, incidents | Main for releases |
| `security` | OWASP, auth, secrets, headers, input validation | Aux for almost everything |
| `api-design` | REST conventions, pagination, errors, rate limiting | Main for API endpoints |

`session-start` and `git-workflow` are cross-cutting — they apply to every task regardless of the main skill assigned. `security` is the most common auxiliary skill.

---

## Additional Documentation

- [orchestrator.md](./orchestrator.md) — How the orchestrator reads dependencies and allocates agents

---

*Agents are the vehicle. Lytos is the road. The manifest is the destination.*
