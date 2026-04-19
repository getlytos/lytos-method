# Adapter — Claude Code

*Comment utiliser Lytos avec Claude Code. Ce guide explique comment configurer un projet pour que Claude Code charge automatiquement le manifest, la memory, les skills et les rules.*

---

## Prérequis

- Claude Code installé (CLI ou extension IDE)
- Un projet avec Lytos initialisé dans `.lytos/`

---

## Structure dans le projet

```
mon-projet/
├── .lytos/                    ← Lytos (submodule ou copie)
│   ├── manifest.md            ← rempli par l'humain
│   ├── sprint.md              ← sprint en cours
│   ├── skills/                ← procédures
│   ├── rules/                 ← critères qualité
│   ├── memory/
│   │   ├── MEMORY.md          ← sommaire (lu à chaque session)
│   │   └── cortex/            ← zones spécialisées (à la demande)
│   └── issue-board/           ← issues Kanban (dossier = statut)
│       ├── BOARD.md
│       ├── 0-icebox/
│       ├── 1-backlog/
│       ├── 2-sprint/
│       ├── 3-in-progress/
│       ├── 4-review/
│       └── 5-done/
├── CLAUDE.md                  ← configuration Claude Code
├── src/
└── ...
```

---

## Configuration de CLAUDE.md

Le fichier `CLAUDE.md` à la racine du projet est lu automatiquement par Claude Code au démarrage de chaque session. C'est le point d'entrée de l'adapter.

### Exemple complet

```markdown
# CLAUDE.md

## Lytos

Ce projet utilise Lytos comme méthode de travail humain-IA.

Au démarrage de chaque session, lis ces fichiers dans cet ordre :

1. `.lytos/manifest.md` — la constitution du projet
2. `.lytos/memory/MEMORY.md` — le sommaire de la mémoire (pas les sous-fichiers)
3. `.lytos/rules/default-rules.md` — les critères qualité par défaut
4. `.lytos/sprint.md` — le sprint en cours (si existant)

## Comment travailler

### Avant chaque tâche

1. Lis l'issue assignée dans `.lytos/issue-board/3-in-progress/`
2. Charge le skill correspondant depuis `.lytos/skills/`
3. Applique les rules pendant toute la durée de la tâche

### Après chaque tâche

1. Mets à jour le status de l'issue
2. Si un apprentissage significatif a eu lieu, ajoute-le à `.lytos/memory/MEMORY.md`

### Conventions

- Commits : `type(scope): message` (voir `.lytos/skills/git-workflow.md`)
- Branches : `type/ISS-XXXX-slug` (voir `.lytos/skills/git-workflow.md`)
- Fichiers < 300 lignes (voir `.lytos/rules/default-rules.md`)
- PHPDoc/JSDoc sur toute fonction publique

## Skills disponibles

| Skill | Fichier | Usage |
|-------|---------|-------|
| Code Review | `.lytos/skills/code-review.md` | Revue de code complète |
| Testing | `.lytos/skills/testing.md` | Écriture de tests unitaires et E2E |
| Documentation | `.lytos/skills/documentation.md` | Documentation du code et memory |
| Git Workflow | `.lytos/skills/git-workflow.md` | Conventions Git |
| Code Structure | `.lytos/skills/code-structure.md` | Structure et nommage |
```

---

## Invoquer un skill explicitement

Pour demander à Claude Code d'appliquer un skill spécifique, il suffit de le mentionner dans le prompt :

```
Fais une code review de src/services/auth.js en suivant le skill .lytos/skills/code-review.md
```

```
Écris les tests pour le module panier en suivant .lytos/skills/testing.md
```

```
Crée l'issue ISS-0015 en suivant le format .lytos/templates/issue/issue-feature.md
```

Claude Code lira le fichier et appliquera la procédure.

---

## Sous-agents — approche skill-first

Si vous utilisez les sous-agents Claude Code, structurez-les par skill, pas par persona :

```
# ❌ Mauvais — persona-first
"Tu es un expert en tests, ton rôle est de..."

# ✅ Bon — skill-first
"Charge le skill .lytos/skills/testing.md et applique-le sur le module src/services/panier.js"
```

L'agent n'a pas besoin d'identité. Il a besoin d'une procédure.

---

## Workflow type avec Claude Code

### 1. Début de session

```
> Lis .lytos/manifest.md et .lytos/memory/MEMORY.md pour prendre le contexte du projet.
```

### 2. Travail sur une issue

```
> L'issue du jour est ISS-0012. Lis l'issue dans .lytos/issue-board/3-in-progress/
> et charge le skill correspondant.
```

### 3. Code review

```
> Fais une code review des fichiers modifiés en suivant .lytos/skills/code-review.md
```

### 4. Fin de session

```
> Mets à jour .lytos/memory/MEMORY.md avec ce qu'on a appris aujourd'hui.
> Déplace l'issue ISS-0012 vers 5-done/ et mets à jour le BOARD.md.
```

---

## Bonnes pratiques

- **Garder le CLAUDE.md concis** — il est lu à chaque session, pas besoin de tout répéter
- **Pointer vers les fichiers de Lytos** plutôt que copier leur contenu dans CLAUDE.md
- **Mettre à jour la memory régulièrement** — c'est ce qui rend le système plus intelligent avec le temps
- **Utiliser les issues** — une tâche sans issue est une tâche sans périmètre

---

*Cet adapter fait le pont entre Claude Code et Lytos. La méthode reste la même — seul le chargement est adapté à l'outil.*
