# Issue Board — Mise en place du Socle

> Suivi d'avancement de la mise en place du Socle sur le projet.
> Chaque issue = un fichier `ISS-XXXX-titre.md` dans le dossier correspondant à son statut.
> Déplacer le fichier d'un dossier à l'autre quand le statut change.
>
> **Dernière mise à jour** : 2026-04-12
>
> **Prochain numéro** : ISS-0007

> Ce fichier peut être régénéré automatiquement : `python .socle/scripts/generate-board.py`

---

## Colonnes Kanban

| Dossier | Description |
|---------|-------------|
| `0-icebox/` | Idées, pas encore priorisées |
| `1-backlog/` | Priorisé, prêt à être planifié |
| `2-sprint/` | Sprint en cours (engagé) |
| `3-in-progress/` | En développement actif |
| `4-review/` | En review / test / staging |
| `5-done/` | Terminé et déployé |

---

## Index des issues

### 0-icebox (idées)

| # | Titre | Priorité | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0006](0-icebox/ISS-0006-creer-skill-specifique.md) | Créer un skill spécifique au projet | P2-moyenne | M | ISS-0004 |

### 1-backlog (priorisé)

| # | Titre | Priorité | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0004](1-backlog/ISS-0004-ecrire-premier-sprint.md) | Écrire le premier sprint | P1-haute | S | ISS-0003 |
| [ISS-0005](1-backlog/ISS-0005-configurer-adapter-ia.md) | Configurer l'adapter IA du projet | P1-haute | XS | ISS-0002 |

### 2-sprint (engagé)

_Aucune issue en sprint._

### 3-in-progress (en dev)

| # | Titre | Priorité | Effort | Depends |
|---|-------|----------|--------|---------|
| [ISS-0003](3-in-progress/ISS-0003-definir-rules-projet.md) | Définir les rules spécifiques du projet | P1-haute | S | ISS-0002 |

### 4-review (review/test)

_Aucune issue._

### 5-done (terminé)

| # | Titre | Terminé |
|---|-------|---------|
| [ISS-0001](5-done/ISS-0001-installer-socle.md) | Installer Le Socle dans le projet | YYYY-MM-DD |
| [ISS-0002](5-done/ISS-0002-remplir-manifest.md) | Remplir le manifest du projet | YYYY-MM-DD |

---

## Workflow

1. **Créer** : copier `templates/issue-feature.md` ou `templates/issue-task.md` → `0-icebox/ISS-XXXX-titre.md`
2. **Prioriser** : déplacer vers `1-backlog/`
3. **Planifier** : déplacer vers `2-sprint/`
4. **Démarrer** :
   - Créer la branche git : `git checkout -b <type>/ISS-XXXX-titre-kebab`
   - Déplacer le fichier .md vers `3-in-progress/`
   - Mettre à jour le frontmatter YAML (`status: 3-in-progress`)
   - Mettre à jour ce BOARD.md (ou régénérer via le script)
5. **Review** :
   - Ouvrir la PR : `gh pr create --title "<type>(scope): ISS-XXXX description"`
   - Déplacer le fichier .md vers `4-review/`
   - Mettre à jour le frontmatter et ce BOARD.md
6. **Terminer** :
   - Merger la PR : `gh pr merge <n> --squash --delete-branch`
   - Déplacer le fichier .md vers `5-done/`
   - Mettre à jour le frontmatter et ce BOARD.md
7. **Incrémenter** le "Prochain numéro" en haut de ce fichier

> **RÈGLE OBLIGATOIRE pour les agents** : chaque issue travaillée doit suivre ce workflow.
> La branche git DOIT être nommée d'après l'issue : `<type>/ISS-XXXX-titre-kebab`.
> Le fichier .md DOIT être déplacé à chaque changement de statut.
> Le frontmatter YAML DOIT être mis à jour (c'est la source de vérité).
> Le BOARD.md DOIT être mis à jour à chaque déplacement.

---

## Conventions

- **Numérotation** : `ISS-XXXX` séquentiel (zero-padded 4 chiffres)
- **Nommage fichier** : `ISS-XXXX-titre-court-en-kebab.md`
- **Nommage branche** : `<type>/ISS-XXXX-titre-kebab` (ex: `feat/ISS-0001-ajout-panier`)
- **Nommage commit** : `<type>(scope): ISS-XXXX description`
- **Priorités** : P0-critique, P1-haute, P2-moyenne, P3-basse
- **Types** : feat, fix, refactor, docs, chore, test, infra
- **Templates** : `templates/issue-feature.md` (complexe) ou `templates/issue-task.md` (micro-tâche)

---

## Source de vérité

Le **frontmatter YAML** de chaque issue est la source de vérité pour le statut, les dépendances et le skill assigné. Ce BOARD.md est une vue d'ensemble — pas une source de vérité indépendante.

En cas de conflit entre le frontmatter d'une issue et ce fichier, **le frontmatter prime**.

Le script `scripts/generate-board.py` peut régénérer l'index à partir des frontmatter.

---

*Le frontmatter est la vérité. Le dossier est le statut visuel. Le BOARD.md est la carte.*
