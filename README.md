# Le Socle

> A human-first method for working with AI agents. Skills, Memory and Rules — not personas.

[Lire en français](./docs/fr/README.md)

---

## Get started

**Start now** — one command:

```bash
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash
```

Then open your AI tool and say: **"Help me configure Le Socle for this project."**

Full guide → [docs/en/QUICKSTART.md](./docs/en/QUICKSTART.md) | [Guide en français](./docs/fr/DEMARRER.md)

**Understand the philosophy** → [MANIFESTO.md](./MANIFESTO.md)

**Contribute** → [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## The problem

The AI industry copies human organization — agents with roles, titles, personas. A "Senior Dev", a "UX Expert", all wearing costumes. It's comforting. It's not effective.

An AI agent has no limited memory, no fatigue, no ego. Giving it a fixed role is limiting it.

**Le Socle proposes a reversal**: instead of managing agents, you define the framework in which they operate.

---

## How it works

```
The human defines          →    Agents execute
─────────────────               ──────────────
manifest.md                     Invoked as needed
skills/                         Stateless, no fixed identity
rules/                          Released after execution
memory/                         Scalable to complexity
```

### The 4 pillars

| Pillar | What it is | Concrete example |
|--------|-----------|-----------------|
| **Manifest** | The project's constitution — the why | "This project is a library management API for..." |
| **Skills** | Reusable procedures — the how | "For code review, check readability, security, tests..." |
| **Rules** | Quality criteria — the standard | "Files < 300 lines, no magic numbers, tests required" |
| **Memory** | Persistent brain — what we learned | "We chose REST API over admin-ajax because..." |

Agents are not the subject. The foundation is.

---

## 3 adoption levels

Le Socle adapts to your needs. No need to use everything on day one.

### Level 1 — The minimum (5 minutes)

Fill in your **manifest** and initialize your **memory**. Your AI understands your project and remembers what it learns.

> Ideal for: getting started with AI, improving every session effortlessly.

```
.socle/
├── manifest.md
└── memory/
    ├── MEMORY.md
    └── cortex/
```

### Level 2 — Quality (30 minutes)

Add **rules** and load **skills**. Your AI follows precise procedures and respects quality criteria.

> Ideal for: serious projects, maintainable code, team work.

```
.socle/
├── manifest.md
├── memory/
├── rules/
└── skills/
```

### Level 3 — The full method (1 hour)

Use the **issue-board**, the **sprint** and the **orchestrator**. Manage a structured project with coordinated agents.

> Ideal for: complex projects, multi-domain, multi-sprint.

```
.socle/
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

Le Socle is language-agnostic. Skills and rules work with Python, JavaScript, PHP, Go, Rust, Swift, or any other language.

### Any AI tool

| Tool | Adapter | Status |
|------|---------|--------|
| Claude Code | [adapters/claude-code/](./adapters/claude-code/) | Available |
| Cursor | [adapters/cursor/](./adapters/cursor/) | Available |
| OpenAI / GPT | [adapters/openai/](./adapters/openai/) | Available |
| Other | [Create an adapter](./adapters/README.md) | Guide provided |

---

## Repository structure

```
le-socle/
├── docs/                     ← localized documentation (fr, en, ...)
├── MANIFESTO.md              ← the full philosophy
├── CONTRIBUTING.md           ← contribution guide
├── templates/                ← templates to copy into your project
├── skills/                   ← 7 built-in skills
│   ├── session-start.md      ← session start & end
│   ├── code-review.md        ← code review
│   ├── testing.md            ← unit & E2E tests
│   ├── documentation.md      ← documentation & memory
│   ├── git-workflow.md       ← Git conventions
│   ├── code-structure.md     ← structure & naming
│   └── deployment.md         ← deployment & CI/CD
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
2. **Agents are formless.** No persona, no fixed role.
3. **Memory is alive.** It grows with each sprint — and it consolidates.
4. **Control is human.** Agents execute. The human validates and steers.
5. **Complement, don't mimic.** AI is not a virtual human.
6. **Progressive by design.** Start small, add when needed.

---

## Author

Created by **Frederic Galliné** — [ubeez.com](https://ubeez.com)

- GitHub: [@FredericGalline](https://github.com/FredericGalline)
- X: [@fred](https://x.com/fred)
- Email: frederic@galline.fr

Questions, feedback, ideas? Open a [Discussion](https://github.com/le-socle/socle/discussions) or reach out directly.

---

## License

MIT — see [LICENSE](./LICENSE)

---

*Le Socle was born from a simple observation: you don't ask an entity fundamentally different from a human to behave like one. You build around what it truly is.*
