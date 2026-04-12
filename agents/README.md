# Agents

*This folder documents how agents work in Le Socle. Agents are not the subject — Le Socle is. But understanding how they are invoked and orchestrated is essential.*

---

## Philosophy

In Le Socle, agents are treated as **Kubernetes pods** — scalable computational intelligence, with no fixed identity.

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
2. It identifies a task to execute
3. It invokes an agent with:
   - The project manifest (global context)
   - The memory (accumulated knowledge)
   - The skill assigned to the task (procedure to follow)
   - The current issue (precise scope)
   - The active rules (quality criteria)
4. The agent executes the task within this framework
5. The agent produces its output (code, documentation, review...)
6. If a learning occurred → write to memory
7. The agent is released
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
| `sprint.md` | Current sprint context | Recommended |

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

---

## Additional Documentation

- [orchestrator.md](./orchestrator.md) — How the orchestrator reads dependencies and allocates agents

---

*Agents are the vehicle. Le Socle is the road. The manifest is the destination.*
