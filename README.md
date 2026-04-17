# Lytos

[![npm](https://img.shields.io/npm/v/lytos-cli)](https://www.npmjs.com/package/lytos-cli)
[![CI](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml)

> A human-first method for working with AI agents. Context, not costumes.

**[Documentation — lytos.org](https://lytos.org)** · **[CLI on npm](https://www.npmjs.com/package/lytos-cli)** · **[Lire en français](./docs/fr/README.md)**

---

### The problem everyone recognizes

A developer codes with an AI agent. They explain the stack, the conventions, the constraints. The AI produces great code. Next session — it forgot everything. They explain again. And again.

Then they try a persona: *"You are a Senior Developer with 15 years of experience."* The tone changes. The quality doesn't. A costume doesn't create knowledge. Context does.

The problem isn't the AI. It's what the AI knows when it starts working.

> *"An agent dressed as a senior dev doesn't know your code. It knows the word 'senior'."*

### What if the AI remembered?

Every session starts with the project's constitution, the team's conventions, past decisions, the current sprint — loaded automatically, from files that live in the Git repo.

That's Lytos. Not another AI tool. A **method** that structures what any AI agent needs to do its best work.

```bash
npm install -g lytos-cli
lyt init
```

One command. The AI understands the project from the first session.

> *"Agile structured human collaboration. Lytos structures collaboration with AI."*

---

### What changes immediately

**Without Lytos:**
```
Dev: "We use Tailwind, not CSS modules. And we write tests before committing."
AI:  "Got it!" (until the next session, when it forgets again)
```

**With Lytos:**
```
The AI reads .lytos/ at startup → stack, conventions, sprint, past decisions.
No re-explaining. A real working session from line one.
```

[See the full method on lytos.org →](https://lytos.org)

---

## The 5 pillars

| Pillar | Name | What it is | File |
|--------|------|-----------|------|
| 1 | **Intent** | The project's constitution — the why | `manifest.md` |
| 2 | **Design** | Reusable procedures — the how | `skills/` |
| 3 | **Standards** | Quality criteria — the non-negotiable | `rules/` |
| 4 | **Progress** | Issues and sprint — what's moving | `issue-board/` |
| 5 | **Memory** | Persistent knowledge — what we learned | `memory/` |

These 5 pillars are the method. The AI reads them at the start of each session and follows them.

[Explore each pillar in detail →](https://lytos.org/en/method/manifest/)

---

## CLI commands

The CLI brings the method to life:

| Command | What it does |
|---------|-------------|
| `lyt init` | Scaffold `.lytos/` in a project (interactive, detects the stack) |
| `lyt board` | Regenerate the kanban board from issue frontmatter |
| `lyt lint` | Validate `.lytos/` structure and content |
| `lyt doctor` | Full diagnostic — broken links, stale memory, health score |
| `lyt show [ISS-XXXX]` | Display issue detail with progress bar |
| `lyt start ISS-XXXX` | Start an issue — move to in-progress, create branch, update board |
| `lyt close ISS-XXXX` | Close an issue — move to done, update board |
| `lyt update` | Update lytos-cli to the latest version |

---

## Get started

### Option 0 — Tutorial (learn by doing)

Clone the tutorial project — a todo API pre-configured with Lytos, issues in every status, and a step-by-step guide:

```bash
npm install -g lytos-cli
git clone https://github.com/getlytos/lytos-learn.git
cd lytos-learn
lyt board
```

Follow the [7-step walkthrough](https://github.com/getlytos/lytos-learn) and experience the full workflow in 15 minutes.

### Option 1 — CLI (recommended)

```bash
npm install -g lytos-cli
cd my-project
lyt init
```

`lyt init` detects the stack, asks a few questions, and generates the full `.lytos/` structure. Works with any language, any AI tool.

### Option 2 — Starter template (no terminal needed)

Use the [starter template](https://github.com/getlytos/starter) → click **"Use this template"** on GitHub → open in Claude Code or Codex → say **"Help me configure Lytos."**

### Option 3 — Manual install

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

---

## Works with everything

### Any language

Python, JavaScript, TypeScript, Go, Rust, PHP, Swift — Lytos is language-agnostic.

### Any AI tool

| Tool | Support |
|------|---------|
| **Claude Code** | Native adapter — `lyt init` generates `CLAUDE.md` |
| **Cursor** | `lyt init` generates `.cursorrules` |
| **Codex (OpenAI)** | `lyt init` generates `agents.md` |
| **Others** | Markdown is universal — any LLM can read it |

---

## Why not just a CLAUDE.md?

A single context file is a good start. Lytos is what comes next:

| | Single file | Lytos |
|---|---|---|
| Project intent | Inline text | Structured `manifest.md` |
| Conventions | Mixed into one file | Versioned `rules/` |
| Procedures | Absent or repeated | Reusable `skills/` |
| Sprint tracking | None | `issue-board/` with CLI |
| Accumulated knowledge | None | Growing `memory/` |
| AI tool portability | Tied to one format | Adapter per tool, shared method |

A single file tells the AI what the project is. Lytos tells it what to do, how to do it, and what was learned doing it.

---

## 3 adoption levels

### Level 1 — The minimum (5 minutes)

Manifest + memory. The AI understands the project and remembers what it learns.

### Level 2 — Quality (30 minutes)

Add rules and skills. The AI follows precise procedures and respects quality criteria.

> *"What can't be verified won't be respected."*

### Level 3 — The full method (1 hour)

Issue board, sprint, and orchestrator. A structured project with coordinated agents.

> *"A project without process is a conversation. Not a delivery."*

---

## For teams: consistency that was impossible before

In traditional development, 10 developers produce 10 different styles. With AI + Lytos, one manifest, one set of rules, one set of skills — committed to the repo, shared by the whole team. Every AI session operates from the same foundation.

What this means in practice:
- A new developer onboards in one session instead of one week
- Code reviews stop rehashing conventions — they're enforced by context
- When the AI hallucinates a pattern, it gets corrected once in `memory/`, not every session
- Project knowledge survives personnel changes, tool migrations, and model upgrades

> *"The developer brainstorms. Lytos harmonizes."*

Skills, rules, and memory are versioned in Git. They can be reviewed, audited, and approved like any other project file. The foundation that guides the AI is visible — not hidden in private chat histories.

[Teams & trainers guide →](https://lytos.org/en/philosophy/trainers/)

---

## A project shouldn't depend on a model

Claude today. GPT tomorrow. Gemini next month. Models change every 3-6 months — APIs evolve, prices shift, features disappear. When project context lives in a vendor's chat history, every change means starting over.

Everything in Lytos is **Markdown in Git**. The manifest, the rules, the memory — plain text files the team owns, versions, reviews, and migrates freely. The AI is an engine. Engines get swapped. The foundation stays.

| Without Lytos | With Lytos |
|---|---|
| Context in chat history | Context in versioned files |
| Workflow tied to one tool | Works with any AI tool |
| Vendor change = start over | Vendor change = swap engine |
| Conventions in someone's head | Conventions in auditable files |
| Knowledge lost between sessions | Knowledge compounds across sprints |

> *"Choose your AI. Don't belong to it."*

[Read more about sovereignty →](https://lytos.org/en/philosophy/sovereignty/)

---

## The 9 built-in skills

| Skill | What it covers |
|-------|---------------|
| **session-start** | Session startup, context loading, task closure |
| **code-review** | Code review with checklist, self-review, PR size limits |
| **testing** | Unit, integration, E2E tests, mocking strategy |
| **documentation** | Docstrings, ADR, API docs, changelog, memory |
| **git-workflow** | Branches, commits, CI checks, hooks, semantic versioning |
| **code-structure** | SOLID, 300-line rule, dependency injection, naming |
| **deployment** | Pre/post-deploy, observability, SLOs, migrations, incidents |
| **security** | OWASP Top 10, authentication, authorization, secrets |
| **api-design** | REST conventions, pagination, error format, rate limiting |

---

## Founding principles

1. **The manifest comes first.** Everything starts from what the human defined.
2. **Agents are formless.** No required persona, no fixed role.
3. **Memory is alive.** It grows with each sprint — and it consolidates.
4. **Control is human.** Agents execute. The human validates and steers.
5. **Complement, don't mimic.** AI is not a virtual human.
6. **Progressive by design.** Start small, add when needed.
7. **Sovereignty through text.** Project knowledge lives in files the team owns — not inside a vendor.

[Read the full philosophy → MANIFESTO.md](./MANIFESTO.md)

---

## Author

Created by **Frederic Galliné**

- GitHub: [@FredericGalline](https://github.com/FredericGalline)
- X: [@fred](https://x.com/fred)

Questions, feedback, ideas? Open a [Discussion](https://github.com/getlytos/lytos-method/discussions).

---

## License

MIT — see [LICENSE](./LICENSE)
