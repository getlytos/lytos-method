# Skill — Démarrage de session

*Ce skill définit ce qu'un agent fait au tout début d'une session de travail. Il garantit que l'agent a le bon contexte avant de commencer, sans charger plus que nécessaire.*

---

## Quand invoquer ce skill

- Au début de chaque session de travail avec un agent
- Quand un agent est invoqué sur une nouvelle tâche
- Quand on reprend le travail après une interruption

---

## Procédure

### 1. Charger le contexte global (toujours)

Ces fichiers sont lus à **chaque** session, sans exception :

```
.socle/manifest.md              ← la constitution du projet (qui, quoi, pourquoi)
.socle/memory/MEMORY.md         ← le sommaire de la memory (pas les sous-fichiers)
.socle/rules/default-rules.md   ← les critères qualité de base
.socle/issue-board/BOARD.md     ← l'état actuel du board
```

Temps estimé : quelques secondes. Ce socle de contexte ne change pas selon la tâche.

### 2. Identifier la tâche en cours

Déterminer quelle issue est à traiter. Sources possibles :

- L'humain la donne explicitement ("travaille sur ISS-0012")
- Le board : regarder `3-in-progress/` pour les issues en cours
- Le sprint : regarder `sprint.md` pour les tâches engagées

**Résultat attendu** : un fichier issue identifié, par exemple `issue-board/3-in-progress/ISS-0012-titre.md`.

### 3. Charger le contexte spécifique à la tâche

Une fois l'issue identifiée, charger **uniquement** ce qui est pertinent :

#### Le skill assigné

Lire le champ `Agent-skill` dans l'issue → charger le fichier skill correspondant.

```
Issue dit "Agent-skill: testing" → charger .socle/skills/testing.md
```

#### Les sections de memory pertinentes

Consulter le sommaire `MEMORY.md` → charger les fichiers selon le domaine de la tâche.

| Domaine de la tâche | Fichiers memory à charger (dans `cortex/`) |
|---------------------|---------------------------------------------|
| Backend (API, BDD, services) | `architecture.md` + `backend.md` |
| Frontend (UI, composants, styles) | `architecture.md` + `frontend.md` |
| Full-stack | `architecture.md` + `backend.md` + `frontend.md` |
| Bug fix | `bugs.md` + le domaine concerné |
| Code review | `architecture.md` + `patterns.md` |
| Nouveau sprint | `sprints.md` |
| Logique métier / UX | `business.md` |

#### Les rules spécifiques

Si des fichiers de rules spécifiques au projet existent (ex: `rules/wordpress-rules.md`), les charger aussi.

#### Les principes du manifest pour arbitrer

Quand un choix technique se présente (deux approches possibles, un compromis à faire), consulter la section **Principes de développement** du manifest. Ces principes sont formulés comme des arbitrages ("on préfère X plutôt que Y") — ils servent exactement à trancher ce genre de décision.

```
Exemple :
Le manifest dit "Simplicité plutôt que flexibilité"
→ Je choisis l'approche directe, pas l'abstraction générique.
```

Si les principes ne couvrent pas la situation, signaler l'arbitrage à l'humain plutôt que deviner.

### 4. Vérifier l'état du travail

Avant de commencer à coder :

- [ ] L'issue est-elle à jour ? (status, checkboxes)
- [ ] Y a-t-il une branche git existante pour cette issue ?
- [ ] Y a-t-il des commits récents sur cette branche ?
- [ ] Y a-t-il des blocages signalés dans le sprint ?

Si une branche existe déjà, se positionner dessus. Sinon, la créer selon la convention : `type/ISS-XXXX-titre-kebab`.

### 5. Résumé de contexte

Avant de commencer le travail, formuler (mentalement ou explicitement) :

```
Projet : [nom du manifest]
Issue  : ISS-XXXX — [titre]
Skill  : [skill chargé]
Memory : [sections chargées]
Branch : [branche git]
État   : [ce qui a déjà été fait / ce qui reste]
```

L'agent est maintenant prêt à travailler.

---

## Ce qu'il ne faut PAS faire au démarrage

- **Ne pas lire tous les fichiers memory** — seulement les sections pertinentes
- **Ne pas relire tous les skills** — seulement celui assigné à la tâche
- **Ne pas parcourir tout le code source** — se limiter aux fichiers concernés par l'issue
- **Ne pas commencer à coder avant d'avoir le contexte** — un agent sans contexte produit du code générique

---

## Variante — Session de planification

Si la session n'est pas du développement mais de la planification (sprint, issues, rétrospective) :

```
Charger :
.socle/manifest.md
.socle/memory/MEMORY.md
.socle/memory/cortex/sprints.md
.socle/sprint.md
.socle/issue-board/BOARD.md
.socle/skills/documentation.md
```

Pas besoin des memory techniques (backend, frontend, bugs).

---

## Variante — Session de code review

```
Charger :
.socle/manifest.md
.socle/memory/MEMORY.md
.socle/memory/cortex/architecture.md
.socle/memory/cortex/patterns.md
.socle/skills/code-review.md
.socle/rules/*.md (toutes les rules)
```

La review a besoin de tout le cadre qualité, pas du contexte technique détaillé.

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge sait exactement quoi lire et dans quel ordre avant de commencer à travailler.*
