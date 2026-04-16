# Lytos

[![npm](https://img.shields.io/npm/v/lytos-cli)](https://www.npmjs.com/package/lytos-cli)
[![CI](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml)

> Une méthode humain-IA qui place le contexte au centre — pas les personas.

**[Documentation](https://lytos.org)** · **[CLI sur npm](https://www.npmjs.com/package/lytos-cli)** · **[Read in English](../../README.md)**

---

**En bref** — Ton IA repart de zéro à chaque session. Lytos lui donne une mémoire persistante, des règles, et le bon contexte — dans des fichiers Markdown dans ton repo Git. Une commande pour démarrer. Compatible Claude Code, Cursor, Codex, ou n'importe quel LLM. Zéro vendor lock-in.

---

## Le problème

Les agents IA sont puissants mais stateless. Chaque session repart de zéro. Ils ne connaissent pas tes conventions, tes priorités de sprint, ni ce qui a été tenté la semaine dernière. Leur donner un persona ne règle pas ça — ça change le ton, pas la qualité.

> *"Un agent déguisé en senior dev ne connaît pas ton code. Il connaît le mot 'senior'."*

## La réponse

**Lytos** donne à ton IA un contexte structuré qui persiste : ce qu'est le projet, comment travailler, ce que "fini" signifie, ce qui est en cours, et ce qu'on a appris. Tout en markdown, dans ton repo Git. Pas de vendor lock-in, pas d'API, pas de compte.

```bash
npm install -g lytos-cli
lyt init
```

Une commande. Ton IA comprend ton projet dès la première session.

> *"L'agile a structuré la collaboration humaine. Lytos structure la collaboration avec l'IA."*

---

## Ce qui change immédiatement

**Sans Lytos**, au début de chaque session :
```
Toi : "On utilise Tailwind, pas CSS modules. Et on écrit les tests avant de commiter."
IA  : "Compris !" (jusqu'à la prochaine session, où elle oublie tout)
```

**Avec Lytos**, l'IA lit `.lytos/` au démarrage et sait déjà :
- ce qu'est le projet et ce qu'il cherche à faire
- quelles conventions, règles et patterns respecter
- ce qui a été décidé dans les sprints précédents
- ce qui est en cours

Fini de réexpliquer. Fini des conventions hallucineées. Une vraie session de travail dès la première ligne.

---

## Les 5 piliers

| Pilier | Nom | C'est quoi | Fichier |
|--------|-----|-----------|---------|
| 1 | **Intent** | La constitution du projet — le pourquoi | `manifest.md` |
| 2 | **Design** | Les procédures réutilisables — le comment | `skills/` |
| 3 | **Standards** | Les critères de qualité — le non-négociable | `rules/` |
| 4 | **Progress** | Les issues et le sprint — ce qui avance | `issue-board/` |
| 5 | **Memory** | Le savoir accumulé — ce qu'on a appris | `memory/` |

Ces 5 piliers sont la méthode. L'agent IA les lit au début de chaque session et les suit.

---

## Commandes CLI

Le CLI donne vie à la méthode :

| Commande | Ce qu'elle fait |
|----------|----------------|
| `lyt init` | Génère `.lytos/` dans ton projet (interactif, détecte ta stack) |
| `lyt board` | Régénère le kanban board depuis le frontmatter des issues |
| `lyt lint` | Valide la structure et le contenu de `.lytos/` |
| `lyt doctor` | Diagnostic complet — liens cassés, memory obsolète, score de santé |
| `lyt show [ISS-XXXX]` | Détail d'une issue avec barre de progression |
| `lyt start ISS-XXXX` | Démarrer une issue — move en in-progress, crée la branche, update le board |
| `lyt close ISS-XXXX` | Fermer une issue — move en done, update le board |
| `lyt update` | Met à jour lytos-cli |

---

## Démarrer

### Option 1 — CLI (recommandé)

```bash
npm install -g lytos-cli
cd ton-projet
lyt init
```

`lyt init` détecte ta stack, pose quelques questions, et génère la structure `.lytos/` complète. Fonctionne avec n'importe quel langage, n'importe quel outil IA.

### Option 2 — Template starter (sans terminal)

Utilise le [template starter](https://github.com/getlytos/starter) → clique **"Use this template"** sur GitHub → ouvre dans Claude Code ou Codex → dis **"Aide-moi à configurer Lytos."**

### Option 3 — Installation manuelle

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

Puis ouvre ton outil IA et dis-lui : **"Lis .lytos/manifest.md et aide-moi à configurer ce projet."**

---

## Compatible avec tout

### Tout langage

Python, JavaScript, TypeScript, Go, Rust, PHP, Swift — Lytos est language-agnostic.

### Tout outil IA

| Outil | Support |
|-------|---------|
| **Claude Code** | Adaptateur natif — `lyt init` génère `CLAUDE.md` |
| **Cursor** | `lyt init` génère `.cursorrules` |
| **Codex (OpenAI)** | `lyt init` génère `agents.md` |
| **Autres** | Le markdown est universel — tout LLM peut le lire |

> *"Choisis ton IA. Ne lui appartiens pas."*

---

## Pourquoi pas juste un CLAUDE.md ?

Un fichier de contexte unique, c'est un bon début. Lytos, c'est la suite logique :

| | Fichier unique | Lytos |
|---|---|---|
| Intent du projet | Texte libre | `manifest.md` structuré |
| Conventions | Mélangées dans un seul fichier | `rules/` versionnées |
| Procédures | Absentes ou répétées | `skills/` réutilisables |
| Suivi de sprint | Aucun | `issue-board/` + CLI |
| Savoir accumulé | Aucun | `memory/` qui grandit |
| Portabilité multi-IA | Liée à un format | Adaptateur par outil, méthode partagée |

Le fichier unique dit à l'IA ce que tu es. Lytos lui dit quoi faire, comment le faire, et ce qu'on a appris en le faisant.

---

## 3 niveaux d'adoption

### Niveau 1 — Le minimum (5 minutes)

Manifest + memory. Ton IA comprend ton projet et se souvient de ce qu'elle apprend.

### Niveau 2 — La qualité (30 minutes)

+ rules + skills. Ton IA suit des procédures précises et respecte des critères de qualité.

> *"Ce qui ne se vérifie pas ne se respecte pas."*

### Niveau 3 — La méthode complète (1 heure)

+ issue-board + sprint + orchestrateur. Tu gères un vrai projet structuré avec des agents coordonnés.

> *"Un projet sans process est une conversation. Pas une livraison."*

---

## En équipe : une cohérence impossible avant l'IA

En développement traditionnel, on ne peut pas demander à 10 développeurs de coder pareil. Avec l'IA + Lytos, c'est possible.

Un manifest, des rules, des skills — commitées dans le repo, partagés par toute l'équipe. Les sessions IA de chaque développeur partent de la même fondation. Le code est produit par le même moteur, avec le même contexte.

**Ce que ça change concrètement :**
- Un nouveau développeur monte en compétence en une session au lieu d'une semaine
- Les code reviews arrêtent de ressasser les mêmes conventions — elles sont imposées par le contexte
- Quand l'IA hallucine un pattern, on le corrige une fois dans `memory/`, pas à chaque session
- Le savoir projet survit aux changements d'équipe, aux migrations d'outils, et aux mises à jour de modèles

> *"Le développeur brainstorme. Lytos harmonise."*

**Pour le CTO** : skills, rules et memory sont versionnées dans Git. Elles peuvent être relues, auditées et approuvées comme n'importe quel autre fichier du projet. La fondation qui guide ton IA est visible — pas enfouie dans des historiques de chat privés.

---

## Souveraineté — pourquoi c'est important

GPT-4 → GPT-4o → o1 → o3. Claude 2 → 3 → 3.5 → 4. Les modèles changent tous les 3-6 mois. Sans structure portable, chaque changement = recommencer.

Tout dans Lytos est du markdown dans Git. L'IA est un moteur. Les moteurs se changent. La fondation est ce qui persiste.

| Sans Lytos | Avec Lytos |
|---|---|
| Contexte dans l'historique de chat | Contexte dans des fichiers versionnés |
| Workflow lié à un outil | Fonctionne avec n'importe quel outil IA |
| Changement de vendor = recommencer | Changement de vendor = changer de moteur |
| Conventions dans la tête de quelqu'un | Conventions dans des fichiers auditables |
| Savoir perdu entre les sessions | Savoir qui s'accumule sprint après sprint |

**Ton savoir projet t'appartient. Pas à un vendor.**

---

## Les 9 skills intégrés

| Skill | Ce qu'il couvre |
|-------|----------------|
| **session-start** | Démarrage de session, chargement du contexte, clôture |
| **code-review** | Revue de code avec checklist, self-review, taille de PR |
| **testing** | Tests unitaires, intégration, E2E, stratégie de mocking |
| **documentation** | Docstrings, ADR, documentation API, changelog, mémoire |
| **git-workflow** | Branches, commits, CI checks, hooks, semantic versioning |
| **code-structure** | SOLID, 300 lignes max, injection de dépendances, nommage |
| **deployment** | Pré/post-deploy, observabilité, SLOs, migrations, incidents |
| **security** | OWASP Top 10, authentification, autorisation, secrets |
| **api-design** | Conventions REST, pagination, erreurs, rate limiting |

---

## Voir des exemples concrets

Des exemples complets avec des configurations `.lytos/` réalistes :

- [App React / Next.js](../../examples/app-react/) — TypeScript, Tailwind, Vitest, Playwright
- [API Python](../../examples/api-python/) — FastAPI, SQLAlchemy, pytest

---

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona obligatoire, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint — et elle se consolide.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.
6. **Progressif par design.** On commence petit, on ajoute quand on en a besoin.
7. **La souveraineté par le texte.** Le savoir projet vit dans des fichiers que tu possèdes — pas chez un vendor.

[Lire la philosophie complète → MANIFESTE.md](./MANIFESTE.md)

---

## Liens

- **Documentation** — [lytos.org](https://lytos.org)
- **CLI** — [npmjs.com/package/lytos-cli](https://www.npmjs.com/package/lytos-cli)
- **Code source CLI** — [github.com/getlytos/lytos-cli](https://github.com/getlytos/lytos-cli)

---

## Auteur

Créé par **Frederic Galliné** — [ubeez.com](https://ubeez.com)

- GitHub : [@FredericGalline](https://github.com/FredericGalline)
- X : [@fred](https://x.com/fred)
- Email : frederic@galline.fr

Questions, retours, idées ? Ouvre une [Discussion](https://github.com/getlytos/lytos-method/discussions) ou contacte-moi directement.

---

## Licence

MIT — voir [LICENSE](../../LICENSE)

---

*"Le role-play ne remplace pas le contexte."*
