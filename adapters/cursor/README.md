# Adapter — Cursor

*Comment utiliser Le Socle avec Cursor IDE. Ce guide explique comment configurer un projet pour que Cursor charge le manifest, la memory, les skills et les rules.*

---

## Prérequis

- Cursor IDE installé
- Un projet avec Le Socle initialisé dans `.socle/`

---

## Structure dans le projet

```
mon-projet/
├── .socle/                    ← Le Socle (submodule ou copie)
│   ├── manifest.md
│   ├── sprint.md
│   ├── skills/
│   ├── rules/
│   ├── memory/
│   │   └── MEMORY.md
│   └── issue-board/           ← Kanban (dossier = statut)
├── .cursorrules               ← configuration Cursor
├── src/
└── ...
```

---

## Configuration de .cursorrules

Le fichier `.cursorrules` à la racine du projet est lu par Cursor comme instructions système. C'est l'équivalent du `CLAUDE.md` pour Claude Code.

### Exemple complet

```
# Méthode de travail — Le Socle

Ce projet utilise Le Socle comme méthode de travail humain-IA.

## Fichiers à lire au démarrage

Lis ces fichiers dans cet ordre pour prendre le contexte :

1. .socle/manifest.md — la constitution du projet
2. .socle/memory/MEMORY.md — le sommaire de la mémoire (pas les sous-fichiers)
3. .socle/rules/default-rules.md — les critères qualité

## Quand tu travailles sur une tâche

1. Demande quelle issue est en cours
2. Lis l'issue dans .socle/issue-board/3-in-progress/
3. Charge le skill correspondant depuis .socle/skills/
4. Applique les rules pendant toute la durée de la tâche

## Conventions obligatoires

- Fichiers < 300 lignes — si plus, découper
- PHPDoc/JSDoc sur toute fonction publique
- Pas de valeurs en dur (magic numbers, couleurs, URLs)
- Pas de console.log/var_dump en production
- Commits : type(scope): message
- Branches : type/ISS-XXXX-slug

## Skills disponibles

- .socle/skills/code-review.md — comment faire une code review
- .socle/skills/testing.md — comment écrire des tests
- .socle/skills/documentation.md — comment documenter
- .socle/skills/git-workflow.md — conventions Git
- .socle/skills/code-structure.md — structure et nommage

## Après chaque tâche

- Mets à jour le status de l'issue si demandé
- Propose de mettre à jour .socle/memory/MEMORY.md si un apprentissage a eu lieu
```

---

## Utilisation dans Cursor

### Chat inline (Cmd+K)

Pour des modifications rapides, mentionnez le skill dans le prompt :

```
Refactore cette fonction en suivant les règles de .socle/skills/code-structure.md
```

### Chat panel (Cmd+L)

Pour des tâches plus larges :

```
Lis .socle/issue-board/3-in-progress/ISS-0012-titre.md et implémente 
la solution proposée en chargeant le skill .socle/skills/code-structure.md
```

### Composer (Cmd+I)

Pour les modifications multi-fichiers, Composer est idéal avec Le Socle :

```
En suivant .socle/skills/testing.md, écris les tests unitaires 
pour tous les services dans src/services/
```

---

## Fichiers référencés avec @

Cursor permet de référencer des fichiers avec `@`. Utilisez cette fonctionnalité pour charger les fichiers du Socle :

```
@.socle/manifest.md @.socle/memory/MEMORY.md
Avec ce contexte, travaille sur l'issue ISS-0012.
```

---

## Différences avec Claude Code

| Aspect | Claude Code | Cursor |
|--------|-------------|--------|
| Fichier de config | `CLAUDE.md` | `.cursorrules` |
| Chargement auto | Au démarrage de session | Comme instructions système |
| Référencement | Chemins dans le prompt | `@fichier` ou chemins |
| Sous-agents | Supportés nativement | Via Composer multi-fichiers |

La méthode reste identique — seul le mécanisme de chargement change.

---

## Bonnes pratiques Cursor

- **Garder `.cursorrules` concis** — Cursor a une limite de contexte sur ce fichier
- **Utiliser `@` pour charger les fichiers du Socle** à la demande plutôt que tout mettre dans `.cursorrules`
- **Composer pour les tâches multi-fichiers** — il gère bien les modifications coordonnées
- **Chat panel pour la prise de contexte** — plus de place pour le raisonnement

---

*Cet adapter fait le pont entre Cursor et Le Socle. La méthode reste la même — seul le chargement est adapté à l'outil.*
