# Lytos

[![npm](https://img.shields.io/npm/v/lytos-cli)](https://www.npmjs.com/package/lytos-cli)
[![CI](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/getlytos/lytos-cli/actions/workflows/ci.yml)

> Une méthode humain-IA qui place le contexte au centre — pas les personas.

**[Documentation — lytos.org](https://lytos.org/fr/)** · **[CLI sur npm](https://www.npmjs.com/package/lytos-cli)** · **[Read in English](../../README.md)**

---

### Le problème que tout le monde reconnaît

Un développeur code avec un agent IA. Il explique sa stack, ses conventions, ses contraintes. L'IA produit du bon code. Session suivante — elle a tout oublié. Il réexplique. Encore. Et encore.

Alors il essaie un persona : *"Tu es un développeur Senior avec 15 ans d'expérience."* Le ton change. La qualité non. Un costume ne crée pas de la connaissance. C'est le contexte qui en crée.

Le problème n'est pas l'IA. C'est ce que l'IA sait quand elle commence à travailler.

> *"Un agent déguisé en senior dev ne connaît pas votre code. Il connaît le mot 'senior'."*

### Et si l'IA se souvenait ?

Chaque session commence avec la constitution du projet, les conventions de l'équipe, les décisions passées, le sprint en cours — chargés automatiquement, depuis des fichiers qui vivent dans le dépôt Git.

C'est Lytos. Pas un outil IA de plus. Une **méthode** qui structure ce dont n'importe quel agent IA a besoin pour faire son meilleur travail.

```bash
npm install -g lytos-cli
lyt init
```

Une commande. L'IA comprend le projet dès la première session.

> *"L'agile a structuré la collaboration humaine. Lytos structure la collaboration avec l'IA."*

---

### Ce qui change immédiatement

**Sans Lytos :**
```
Dev : "On utilise Tailwind, pas CSS modules. Et on écrit les tests avant de commiter."
IA  : "Compris !" (jusqu'à la prochaine session, où elle oublie tout)
```

**Avec Lytos :**
```
L'IA lit .lytos/ au démarrage → stack, conventions, sprint, décisions passées.
Fini de réexpliquer. Une vraie session de travail dès la première ligne.
```

[Découvrir la méthode complète sur lytos.org →](https://lytos.org/fr/)

---

## Les 5 piliers

| Pilier | Nom | Description | Fichier |
|--------|-----|-----------|---------|
| 1 | **Intent** | La constitution du projet — le pourquoi | `manifest.md` |
| 2 | **Design** | Les procédures réutilisables — le comment | `skills/` |
| 3 | **Standards** | Les critères de qualité — le non-négociable | `rules/` |
| 4 | **Progress** | Les issues et le sprint — ce qui avance | `issue-board/` |
| 5 | **Memory** | Le savoir accumulé — ce qu'on a appris | `memory/` |

Ces 5 piliers sont la méthode. L'agent IA les lit au début de chaque session et les suit.

[Explorer chaque pilier en détail →](https://lytos.org/fr/method/manifest/)

---

## Commandes CLI

Le CLI donne vie à la méthode :

| Commande | Ce qu'elle fait |
|----------|----------------|
| `lyt init` | Génère `.lytos/` dans un projet (interactif, détecte la stack) |
| `lyt board` | Régénère le kanban board depuis le frontmatter des issues |
| `lyt lint` | Valide la structure et le contenu de `.lytos/` |
| `lyt doctor` | Diagnostic complet — liens cassés, memory obsolète, score de santé |
| `lyt show [ISS-XXXX]` | Détail d'une issue avec barre de progression |
| `lyt start ISS-XXXX` | Démarrer une issue — déplace en in-progress, crée la branche, met à jour le board |
| `lyt close ISS-XXXX` | Fermer une issue — déplace en done, met à jour le board |
| `lyt update` | Met à jour lytos-cli |

---

## Démarrer

### Option 0 — Tutoriel (apprendre en faisant)

Cloner le projet tutoriel — une todo API pré-configurée avec Lytos, des issues dans chaque statut, et un guide pas-à-pas :

```bash
npm install -g lytos-cli
git clone https://github.com/getlytos/lytos-learn.git
cd lytos-learn
lyt board
```

Suivre le [parcours en 7 étapes](https://github.com/getlytos/lytos-learn/blob/main/docs/README-fr.md) et expérimenter le workflow complet en 15 minutes.

### Option 1 — CLI (recommandé)

```bash
npm install -g lytos-cli
cd mon-projet
lyt init
```

`lyt init` détecte la stack, pose quelques questions, et génère la structure `.lytos/` complète. Fonctionne avec n'importe quel langage, n'importe quel outil IA.

### Option 2 — Template starter (sans terminal)

Utiliser le [template starter](https://github.com/getlytos/starter) → cliquer **"Use this template"** sur GitHub → ouvrir dans Claude Code ou Codex → dire **"Aide-moi à configurer Lytos."**

### Option 3 — Installation manuelle

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

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

---

## Pourquoi pas juste un CLAUDE.md ?

Un fichier de contexte unique est un bon début. Lytos est la suite logique :

| | Fichier unique | Lytos |
|---|---|---|
| Intent du projet | Texte libre | `manifest.md` structuré |
| Conventions | Mélangées dans un seul fichier | `rules/` versionnées |
| Procédures | Absentes ou répétées | `skills/` réutilisables |
| Suivi de sprint | Aucun | `issue-board/` + CLI |
| Savoir accumulé | Aucun | `memory/` qui grandit |
| Portabilité multi-IA | Liée à un format | Adaptateur par outil, méthode partagée |

Un fichier unique dit à l'IA ce qu'est le projet. Lytos lui dit quoi faire, comment le faire, et ce qu'on a appris en le faisant.

---

## 3 niveaux d'adoption

### Niveau 1 — Le minimum (5 minutes)

Manifest + memory. L'IA comprend le projet et se souvient de ce qu'elle apprend.

### Niveau 2 — La qualité (30 minutes)

Ajouter rules et skills. L'IA suit des procédures précises et respecte des critères de qualité.

> *"Ce qui ne se vérifie pas ne se respecte pas."*

### Niveau 3 — La méthode complète (1 heure)

Issue board, sprint et orchestrateur. Un projet structuré avec des agents coordonnés.

> *"Un projet sans process est une conversation. Pas une livraison."*

---

## En équipe : une cohérence impossible avant l'IA

En développement traditionnel, 10 développeurs produisent 10 styles différents. Avec l'IA + Lytos, un manifest, un jeu de rules, un jeu de skills — committés dans le repo, partagés par toute l'équipe. Chaque session IA part de la même fondation.

Ce que ça change concrètement :
- Un nouveau développeur monte en compétence en une session au lieu d'une semaine
- Les code reviews arrêtent de ressasser les mêmes conventions — elles sont imposées par le contexte
- Quand l'IA hallucine un pattern, il est corrigé une fois dans `memory/`, pas à chaque session
- Le savoir projet survit aux changements d'équipe, aux migrations d'outils, et aux mises à jour de modèles

> *"Le développeur brainstorme. Lytos harmonise."*

Skills, rules et memory sont versionnées dans Git. Elles peuvent être relues, auditées et approuvées comme n'importe quel autre fichier du projet. La fondation qui guide l'IA est visible — pas enfouie dans des historiques de chat privés.

[Guide équipes et formateurs →](https://lytos.org/fr/philosophy/trainers/)

---

## Un projet ne devrait pas dépendre d'un modèle

Claude aujourd'hui. GPT demain. Gemini le mois prochain. Les modèles changent tous les 3-6 mois — les APIs évoluent, les prix bougent, des fonctionnalités disparaissent. Quand le contexte projet vit dans l'historique de chat d'un fournisseur, chaque changement signifie recommencer à zéro.

Tout dans Lytos est du **Markdown dans Git**. Le manifest, les rules, la memory — des fichiers texte que l'équipe possède, versionne, relit et migre librement. L'IA est un moteur. Les moteurs se changent. La fondation reste.

| Sans Lytos | Avec Lytos |
|---|---|
| Contexte dans l'historique de chat | Contexte dans des fichiers versionnés |
| Workflow lié à un outil | Fonctionne avec n'importe quel outil IA |
| Changement de vendor = recommencer | Changement de vendor = changer de moteur |
| Conventions dans la tête de quelqu'un | Conventions dans des fichiers auditables |
| Savoir perdu entre les sessions | Savoir qui s'accumule sprint après sprint |

> *"Choisissez votre IA. Ne lui appartenez pas."*

[En savoir plus sur la souveraineté →](https://lytos.org/fr/philosophy/sovereignty/)

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

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona obligatoire, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint — et elle se consolide.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.
6. **Progressif par design.** On commence petit, on ajoute quand on en a besoin.
7. **La souveraineté par le texte.** Le savoir projet vit dans des fichiers que l'équipe possède — pas chez un fournisseur.

[Lire la philosophie complète → MANIFESTE.md](./MANIFESTE.md)

---

## Auteur

Créé par **Frederic Galliné**

- GitHub : [@FredericGalline](https://github.com/FredericGalline)
- X : [@fred](https://x.com/fred)

Questions, retours, idées ? Ouvrir une [Discussion](https://github.com/getlytos/lytos-method/discussions).

---

## Licence

MIT — voir [LICENSE](../../LICENSE)
