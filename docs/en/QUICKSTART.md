# Get started in 5 minutes

*This guide gets you operational immediately — one command, ask your AI to help, and you're set.*

---

## Step 1 — Install (30 seconds)

### Recommended (one command)

```bash
cd your-project/
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash
```

The script asks for your project name and AI tool, then creates everything: pre-filled manifest, memory, skills, rules, issue-board and the config file for your tool (CLAUDE.md or .cursorrules).

You can also pass options directly:

```bash
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash -s -- --name "My Project" --tool claude
```

### Alternative — Git submodule

If you prefer the full repo (examples, documentation, adapters):

```bash
git submodule add https://github.com/le-socle/socle .socle
cp .socle/templates/manifest.md .socle/manifest.md
```

## Step 2 — Configure with your AI (3 minutes)

Open your AI tool and say:

> **"Help me configure Le Socle for this project."**

The AI will read the briefing (`.socle/SOCLE.md`), understand the method, and ask you the right questions to fill your manifest: project name, why it exists, tech stack, decision principles, AI models to use.

You don't need to fill everything yourself — the AI can also detect your stack by reading your `package.json`, `requirements.txt` or `go.mod`.

If you prefer doing it manually, open `.socle/manifest.md` and fill these 4 sections:

1. **Identity** — project name and short description
2. **Why this project exists** — 3 sentences max, the "why"
3. **Tech stack** — languages and tools used
4. **Development principles** — 2-3 decision rules ("we prefer X over Y")

## Step 3 — You're done

If you used the install script, memory is initialized and your AI tool is configured. Everything is ready.

If you used the submodule, initialize the memory and create the connection file for your tool (see the adapters/ folder).

---

## What's next

When you want to go further, here are the next steps — in order:

| When | What | File |
|------|------|------|
| You want quality criteria | Read the rules | `.socle/rules/default-rules.md` |
| You want to structure your tasks | Create your first sprint | `.socle/templates/sprint.md` |
| You want your AI to follow a precise procedure | Load a skill | `.socle/skills/` |
| You want visual progress tracking | Use the board | `.socle/issue-board/BOARD.md` |

Everything is optional. The manifest + memory are enough to start.

---

*Want to understand the philosophy behind all this? Read [MANIFESTO.md](../../MANIFESTO.md).*
