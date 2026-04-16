# Lytos

[![npm](https://img.shields.io/npm/v/lytos-cli)](https://www.npmjs.com/package/lytos-cli)
[![CI](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml)

> A human-first method for working with AI agents. Context, not costumes.

**[Documentation](https://lytos.org)** · **[CLI on npm](https://www.npmjs.com/package/lytos-cli)** · **[Lire en français](./docs/fr/README.md)**

---

## The problem

AI agents are powerful but stateless. Every session starts from zero. They don't know your conventions, your sprint priorities, or what was tried last week. Giving them a persona doesn't fix this — it changes the tone, not the quality.

> *"An agent dressed as a senior dev doesn't know your code. It knows the word 'senior'."*

## The answer

**Lytos** gives your AI structured context that persists: what the project is, how to work, what "done" means, what's in progress, and what's been learned. Everything in markdown, in your Git repo. No vendor lock-in, no API, no account.

```bash
npm install -g lytos-cli
lyt init
```

One command. Your AI understands your project from the first session.

> *"Agile structured human collaboration. Lytos structures collaboration with AI."*

---

## The 5 pillars

| Pillar | Name | What it is | File |
|--------|------|-----------|------|
| 1 | **Intent** | The project's constitution — the why | `manifest.md` |
| 2 | **Design** | Reusable procedures — the how | `skills/` |
| 3 | **Standards** | Quality criteria — the non-negotiable | `rules/` |
| 4 | **Progress** | Issues and sprint — what's moving | `issue-board/` |
| 5 | **Memory** | Persistent knowledge — what we learned | `memory/` |

These 5 pillars are the method. The AI agent reads them at the start of each session and follows them.

---

## CLI commands

The CLI brings the method to life:

| Command | What it does |
|---------|-------------|
| `lyt init` | Scaffold `.lytos/` in your project (interactive, detects your stack) |
| `lyt board` | Regenerate the kanban board from issue frontmatter |
| `lyt lint` | Validate `.lytos/` structure and content |
| `lyt doctor` | Full diagnostic — broken links, stale memory, health score |
| `lyt show [ISS-XXXX]` | Display issue detail with progress bar |
| `lyt start ISS-XXXX` | Start an issue — move to in-progress, create branch, update board |
| `lyt close ISS-XXXX` | Close an issue — move to done, update board |
| `lyt update` | Update lytos-cli to the latest version |

---

## Get started

### Option 1 — CLI (recommended)

```bash
npm install -g lytos-cli
cd your-project
lyt init
```

`lyt init` detects your stack, asks a few questions, and generates the full `.lytos/` structure. Works with any language, any AI tool.

### Option 2 — Starter template (no terminal needed)

Use the [starter template](https://github.com/getlytos/starter) → click **"Use this template"** on GitHub → open in Claude Code or Codex → say **"Help me configure Lytos."**

### Option 3 — Manual install

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

Then open your AI tool and say: **"Read .lytos/manifest.md and help me configure this project."**

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

> *"Choose your AI. Don't belong to it."*

---

## 3 adoption levels

### Level 1 — The minimum (5 minutes)

Fill in your **manifest** and initialize your **memory**. Your AI understands your project and remembers what it learns.

### Level 2 — Quality (30 minutes)

Add **rules** and load **skills**. Your AI follows precise procedures and respects quality criteria.

> *"What can't be verified won't be respected."*

### Level 3 — The full method (1 hour)

Use the **issue-board**, the **sprint** and the **orchestrator**. Manage a structured project with coordinated agents.

> *"A project without process is a conversation. Not a delivery."*

---

## For teams: consistency that was impossible before

In traditional development, you can't ask 10 developers to code the same way. With AI + Lytos, you can. One manifest, one set of rules, one set of skills — shared by the whole team. The code is produced by the same engine, with the same context.

> *"The developer brainstorms. Lytos harmonizes."*

---

## Sovereignty — why it matters

GPT-4 → GPT-4o → o1 → o3. Claude 2 → 3 → 3.5 → 4. Models change every 3-6 months. Without portable structure, every change means starting over.

Everything in Lytos is markdown in Git. The AI is an engine. Engines get swapped. The foundation is what persists.

| Without Lytos | With Lytos |
|---|---|
| Context in chat history | Context in versioned files |
| Workflow tied to one tool | Works with any AI tool |
| Vendor change = start over | Vendor change = swap engine |

**Your project knowledge belongs to you. Not to a vendor.**

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
7. **Sovereignty through text.** Project knowledge lives in files you own — not inside a vendor.

[Read the full philosophy → MANIFESTO.md](./MANIFESTO.md)

---

## Links

- **Documentation** — [lytos.org](https://lytos.org)
- **CLI** — [npmjs.com/package/lytos-cli](https://www.npmjs.com/package/lytos-cli)
- **CLI source** — [github.com/getlytos/lytos-cli](https://github.com/getlytos/lytos-cli)

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

*"Role-play doesn't replace context."*
