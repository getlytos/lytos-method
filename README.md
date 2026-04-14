# Lytos

> A human-first method for working with AI agents. Skills, Memory and Rules first — not just personas.

[Lire en français](./docs/fr/README.md)

---

## Why Lytos?

You use AI to code. Every session, you start from scratch — re-explaining your project, your constraints, your conventions. The AI forgets everything. You repeat yourself. The output is generic.

You've tried giving your agent a persona — "You are a Senior Developer with 20 years of experience." It can change the tone. In our experience, it is not the most reliable lever for improving quality over time.

**Lytos approaches this differently.** Instead of dressing up your AI in a costume, you give it what tends to make it better more reliably: context that persists, procedures that are precise, and quality criteria that are verifiable.

One install. Your AI understands your project, remembers what it learns, follows your procedures, and respects your standards — from the first session.

[Read the full philosophy → MANIFESTO.md](./MANIFESTO.md)

---

## Get started

Choose your path:

### New project (vibe coders, no IDE needed)

Use the [starter template](https://github.com/getlytos/starter) → click **"Use this template"** on GitHub → open in Claude Code or Codex → say **"Help me configure Lytos."**

### Existing project (terminal)

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

### Existing project (GitHub Actions, no terminal)

Copy [`.github/workflows/init-lytos.yml`](.github/workflows/init-lytos.yml) into your repo → go to Actions → run **"Add Lytos"**.

---

Then open your AI tool and say: **"Help me configure Lytos for this project."**

Full guide → [QUICKSTART.md](./docs/en/QUICKSTART.md) | [Guide en français](./docs/fr/DEMARRER.md)

---

## The idea

The AI industry often copies human organization — agents with roles, titles, personas. It's comforting. In our experience, it's not the most robust mechanism for quality, memory, or consistency.

An AI agent has no fatigue, no ego, no office politics. But it does have a limited context window — and it forgets everything between sessions. Giving it a fixed role can help frame a response, but it does not reliably solve this. Giving it the right context does more.

This is not a dogma about prompting. It is a design choice: keep the most stable layer in files you control, especially while models keep changing.

**Lytos proposes a reversal**: instead of managing agents, you define the framework in which they operate.

---

## How it works

```
The human defines          →    Agents execute
─────────────────               ──────────────
manifest.md    (Intent)         Invoked as needed
skills/        (Design)         Stateless, no fixed identity
rules/         (Standards)      Released after execution
issue-board/   (Progress)       Scalable to complexity
memory/        (Memory)
```

### The 5 pillars

| Pillar | Name | What it is | Concrete example |
|--------|------|-----------|-----------------|
| 1 | **Intent** | The project's constitution — the why | `manifest.md` — "This project is a library management API for..." |
| 2 | **Design** | Reusable procedures — the how | `skills/` — "For code review, check readability, security, tests..." |
| 3 | **Standards** | Quality criteria — the non-negotiable | `rules/` — "Files < 300 lines, no magic numbers, tests required" |
| 4 | **Progress** | Issues and sprint — what's moving, what's blocked | `issue-board/` — kanban board with YAML frontmatter as source of truth |
| 5 | **Memory** | Persistent knowledge — what we learned | `memory/` — "We chose REST API over admin-ajax because..." |

These 5 pillars are the method. Agents are not the subject — the foundation is.

---

## 3 adoption levels

Lytos adapts to your needs. No need to use everything on day one.

### Level 1 — The minimum (5 minutes)

Fill in your **manifest** and initialize your **memory**. Your AI understands your project and remembers what it learns.

> Ideal for: getting started with AI, improving every session effortlessly.

```
.lytos/
├── manifest.md
└── memory/
    ├── MEMORY.md
    └── cortex/
```

### Level 2 — Quality (30 minutes)

Add **rules** and load **skills**. Your AI follows precise procedures and respects quality criteria.

> Ideal for: serious projects, maintainable code, team work.

```
.lytos/
├── manifest.md
├── memory/
├── rules/
└── skills/
```

### Level 3 — The full method (1 hour)

Use the **issue-board**, the **sprint** and the **orchestrator**. Manage a structured project with coordinated agents.

> Ideal for: complex projects, multi-domain, multi-sprint.

```
.lytos/
├── manifest.md
├── memory/
├── rules/
├── skills/
├── sprint.md
└── issue-board/
```

---

## Works with everything

### Any language

Lytos is language-agnostic. Skills and rules work with Python, JavaScript, PHP, Go, Rust, Swift, or any other language.

### Any AI tool

| Tool | Adapter | Status |
|------|---------|--------|
| Claude Code | [adapters/claude-code/](./adapters/claude-code/) | Available |
| Cursor | [adapters/cursor/](./adapters/cursor/) | Available |
| OpenAI / GPT | [adapters/openai/](./adapters/openai/) | Available |
| Other | [Create an adapter](./adapters/README.md) | Guide provided |

---

## Interoperability and sovereignty — a matter of survival

This is not a technical advantage. It is a philosophical position.

GPT-4 replaced by GPT-4o replaced by o1 replaced by o3. Claude 2 → 3 → 3.5 → 4. Models change every 3–6 months. APIs evolve. Prices shift. Features disappear. Vendors pivot.

Without Lytos, your project context lives inside proprietary conversations. Your workflow is wired to a specific tool. The day the vendor changes terms, raises prices, or ships a new model that breaks your workflow — you start over from zero.

This is the vendor lock-in problem we already lived through with AWS, Salesforce, Adobe. Except now it changes four times a year.

**Lytos's answer:** everything is markdown. The manifest, the skills, the memory, the rules — plain text files that you own, version in git, review, back up, and migrate freely. The AI is an engine. Engines are swapped. The foundation is what persists.

This is not a promise that every model will behave identically. It is a guarantee that your project context, procedures, and memory remain portable when models, APIs, or vendors change.

It runs on Claude Code today. It will run on tomorrow's model. It can run on a local LLM if a vendor's conditions become unacceptable.

What this changes in practice:

- **Auditability** — what guides the AI is visible, readable, reviewable, and diffable in git.
- **Reversibility** — changing model or vendor does not erase your project memory or your way of working.
- **Team continuity** — knowledge survives sessions, chat histories, and individual contributors.
- **Governance** — rules, decisions, and procedures become compatible with review, backup, onboarding, and compliance.
- **Compounding value** — each sprint leaves reusable assets behind, not just another transient conversation.

**Your project knowledge belongs to you. Not to a vendor.**

---

## Repository structure

```
getlytos/
├── docs/                     ← localized documentation (fr, en, ...)
├── MANIFESTO.md              ← the full philosophy
├── CONTRIBUTING.md           ← contribution guide
├── templates/                ← templates to copy into your project
├── skills/                   ← 9 built-in skills
│   ├── session-start.md      ← session start & end
│   ├── code-review.md        ← code review
│   ├── testing.md            ← unit, integration & E2E tests
│   ├── documentation.md      ← documentation, ADR & memory
│   ├── git-workflow.md       ← Git conventions & CI
│   ├── code-structure.md     ← structure, SOLID & naming
│   ├── deployment.md         ← deployment, observability & CI/CD
│   ├── security.md           ← OWASP, auth & secure coding
│   └── api-design.md         ← REST conventions & API quality
├── scripts/                  ← automation tools
│   └── generate-board.py     ← regenerate BOARD.md from frontmatter
├── rules/                    ← default quality rules
├── memory/                   ← memory template
│   ├── MEMORY.md             ← index (read every session)
│   └── cortex/               ← specialized zones (loaded on demand)
├── agents/                   ← orchestrator documentation
├── adapters/                 ← multi-AI connectors
├── issue-board/              ← Kanban board (folder = status)
└── examples/                 ← concrete examples (Python API, React App)
```

---

## Founding principles

1. **The manifest comes first.** Everything starts from what the human defined.
2. **Agents are formless.** No required persona, no fixed role.
3. **Memory is alive.** It grows with each sprint — and it consolidates.
4. **Control is human.** Agents execute. The human validates and steers.
5. **Complement, don't mimic.** AI is not a virtual human.
6. **Progressive by design.** Start small, add when needed.
7. **Sovereignty through text.** Project knowledge lives in files you own, version, review, and migrate — not inside a vendor. The AI is an interchangeable engine.

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

## Author

Created by **Frederic Galliné** — [ubeez.com](https://ubeez.com)

- GitHub: [@FredericGalline](https://github.com/FredericGalline)
- X: [@fred](https://x.com/fred)
- Email: frederic@galline.fr

Questions, feedback, ideas? Open a [Discussion](https://github.com/getlytos/lytos-method/discussions) or reach out directly.

---

## License

MIT — see [LICENSE](./LICENSE)

---

*Lytos was born from a simple observation: you don't ask an entity fundamentally different from a human to behave like one. You build around what it truly is.*
