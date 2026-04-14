# Exemple — App React (Next.js)

*Cet exemple montre comment utiliser Lytos sur un projet frontend React/Next.js. Tous les fichiers `.lytos/` sont remplis avec des données réalistes.*

---

## Le projet fictif

**TaskFlow** — une application web de gestion de tâches en équipe. Interface moderne avec drag & drop, filtres et vue Kanban.

Stack : TypeScript, Next.js 14 (App Router), Tailwind CSS, Zustand, Vitest, Playwright.

---

## Structure

```
taskflow/
├── .lytos/
│   ├── manifest.md
│   ├── sprint.md
│   ├── memory/
│   │   ├── MEMORY.md
│   │   └── cortex/
│   └── issue-board/
│       └── BOARD.md
├── src/
│   ├── app/
│   ├── components/
│   ├── hooks/
│   ├── stores/
│   └── lib/
├── tests/
├── package.json
└── README.md
```

---

## Comment reproduire sur votre projet

```bash
cd votre-projet/
git submodule add https://github.com/getlytos/lytos-method .lytos
cp .lytos/templates/manifest.md .lytos/manifest.md
# Remplir le manifest, initialiser la memory, c'est parti
```

See [QUICKSTART.md](../../docs/en/QUICKSTART.md) for the full guide.
