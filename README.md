# Le Socle

> Une méthode de travail humain-IA qui place les Skills, la Memory et les Rules au centre — pas les agents.

*A human-first method for working with AI agents. Skills, Memory and Rules over personas.*

---

## Par où commencer ?

**Tu veux démarrer maintenant** → [DEMARRER.md](./DEMARRER.md) — opérationnel en 5 minutes

**Tu veux comprendre la philosophie** → [MANIFESTE.md](./MANIFESTE.md) — pourquoi cette méthode existe

**Tu veux contribuer** → [CONTRIBUER.md](./CONTRIBUER.md) — comment participer au projet

---

## Le problème

L'industrie IA reproduit l'organisation humaine — des agents avec des rôles, des titres, des personas. Un "LeadDev", un "Expert UX", tous en costume. C'est rassurant. Ce n'est pas efficace.

Un agent IA n'a pas de mémoire limitée, pas de fatigue, pas d'ego. Lui imposer un rôle fixe, c'est le limiter.

**Le Socle propose un renversement** : on ne gère plus les agents, on définit le cadre dans lequel ils opèrent.

---

## Comment ça marche

```
L'humain définit          →    Les agents exécutent
─────────────────               ──────────────────
manifest.md                     Invoqués selon le besoin
skills/                         Stateless, sans identité fixe  
rules/                          Libérés après exécution
memory/                         Scalables selon la complexité
```

### Les 4 piliers

| Pilier | C'est quoi | Exemple concret |
|--------|-----------|-----------------|
| **Manifest** | La constitution du projet — le pourquoi | "Ce projet est une API de gestion de bibliothèque pour..." |
| **Skills** | Les procédures réutilisables — le comment | "Pour faire une code review, vérifier lisibilité, sécurité, tests..." |
| **Rules** | Les critères de qualité — le standard | "Fichiers < 300 lignes, pas de valeurs en dur, tests obligatoires" |
| **Memory** | Le cerveau persistant — ce qu'on a appris | "On a choisi l'API REST plutôt que admin-ajax parce que..." |

Les agents ne sont pas le sujet. Le socle l'est.

---

## 3 niveaux d'adoption

Le Socle s'adapte à ton besoin. Pas besoin de tout utiliser dès le premier jour.

### Niveau 1 — Le minimum (5 minutes)

Tu remplis ton **manifest** et tu initialises ta **memory**. Ton IA comprend ton projet et se souvient de ce qu'elle apprend.

> Idéal pour : commencer avec l'IA, améliorer chaque session sans effort.

```
.socle/
├── manifest.md
└── memory/
    ├── MEMORY.md
    └── cortex/
```

### Niveau 2 — La qualité (30 minutes)

Tu ajoutes les **rules** et tu charges les **skills**. Ton IA suit des procédures précises et respecte des critères de qualité.

> Idéal pour : des projets sérieux, du code maintenable, du travail en équipe.

```
.socle/
├── manifest.md
├── memory/
├── rules/
└── skills/
```

### Niveau 3 — La méthode complète (1 heure)

Tu utilises l'**issue-board**, le **sprint** et l'**orchestrateur**. Tu gères un vrai projet structuré avec des agents coordonnés.

> Idéal pour : des projets complexes, multi-domaines, multi-sprints.

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

## Compatible avec tout

### Tout langage

Le Socle est agnostique. Les skills et les rules fonctionnent avec Python, JavaScript, PHP, Go, Rust, Swift, ou tout autre langage.

### Tout outil IA

| Outil | Adapter | Status |
|-------|---------|--------|
| Claude Code | [adapters/claude-code/](./adapters/claude-code/) | Disponible |
| Cursor | [adapters/cursor/](./adapters/cursor/) | Disponible |
| OpenAI / GPT | [adapters/openai/](./adapters/openai/) | Disponible |
| Autre | [Créer un adapter](./adapters/README.md) | Guide fourni |

---

## Structure du repo

```
le-socle/
├── DEMARRER.md               ← guide de démarrage rapide
├── MANIFESTE.md              ← la philosophie complète
├── CONTRIBUER.md             ← guide de contribution
├── templates/                ← templates à copier dans ton projet
├── skills/                   ← 7 skills de base
│   ├── session-start.md      ← démarrage et fin de session
│   ├── code-review.md        ← revue de code
│   ├── testing.md            ← tests unitaires et E2E
│   ├── documentation.md      ← documentation et memory
│   ├── git-workflow.md       ← conventions Git
│   ├── code-structure.md     ← structure et nommage
│   └── deployment.md         ← déploiement et CI/CD
├── scripts/                  ← outils d'automatisation
│   └── generate-board.py     ← régénère le BOARD.md depuis les frontmatter
├── rules/                    ← règles de qualité par défaut
├── memory/                   ← template de mémoire
│   ├── MEMORY.md             ← sommaire (lu à chaque session)
│   └── cortex/               ← zones spécialisées (à la demande)
├── agents/                   ← documentation orchestrateur
├── adapters/                 ← connecteurs multi-IA
├── issue-board/              ← board Kanban (dossier = statut)
└── examples/                 ← exemples concrets (API Python, App React)
```

---

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint — et elle se consolide.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.
6. **Progressif par design.** On commence petit, on ajoute quand on en a besoin.

---

## Licence

MIT — voir [LICENSE](./LICENSE)

---

*Le Socle est né d'un constat simple : on ne demande pas à une entité différente de l'humain de se comporter comme un humain. On construit autour de ce qu'elle est vraiment.*
