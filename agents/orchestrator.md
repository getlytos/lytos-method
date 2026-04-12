# Orchestrateur

*L'orchestrateur est le mécanisme qui lit le sprint, analyse les dépendances entre tâches, et décide quels agents lancer en parallèle ou en séquence. Ce n'est pas un agent spécial — c'est une logique de planification.*

---

## Principe

L'orchestrateur applique une règle simple :

> Les tâches sans dépendances partent en parallèle.
> Les tâches avec dépendances attendent que leurs prérequis soient terminés.

C'est le même principe qu'un `Makefile` ou un pipeline CI : un graph acyclique dirigé (DAG) de tâches.

---

## Format du sprint

L'orchestrateur lit le fichier `sprint.md`. Chaque tâche dans le backlog a ces champs :

| Champ | Rôle |
|-------|------|
| `ID` | Identifiant unique (ISS-XXXX) |
| `Titre` | Description courte |
| `Effort` | Estimation de taille (XS, S, M, L, XL) |
| `Skill` | Le skill à charger pour cette tâche |
| `Depends` | Les IDs des tâches prérequises (vide = pas de dépendance) |
| `Status` | État actuel (open, in-progress, done) |

---

## Lecture du graph de dépendances

### Étape 1 — Construire le graph

L'orchestrateur parcourt toutes les tâches et construit un graph :

```yaml
tasks:
  - id: ISS-0001
    title: Créer le schéma de base de données
    effort: M
    skill: code-structure
    depends: []

  - id: ISS-0002
    title: Implémenter le modèle Product
    effort: S
    skill: code-structure
    depends: [ISS-0001]

  - id: ISS-0003
    title: Écrire les tests du modèle Product
    effort: S
    skill: testing
    depends: [ISS-0002]

  - id: ISS-0004
    title: Créer l'API REST /products
    effort: M
    skill: code-structure
    depends: [ISS-0002]

  - id: ISS-0005
    title: Écrire la documentation API
    effort: S
    skill: documentation
    depends: [ISS-0004]
```

### Étape 2 — Lancer les tâches prêtes (event-driven)

L'orchestrateur ne fonctionne pas par "vagues" rigides. Il applique une règle simple :

> **Dès qu'une tâche a toutes ses dépendances en `5-done`, elle est prête à démarrer.**

Pas besoin d'attendre un groupe entier. Chaque tâche terminée débloque potentiellement les suivantes.

```
Cycle de l'orchestrateur :

1. Lire le frontmatter YAML de toutes les issues
2. Identifier les tâches dont le status ≠ done ET toutes les depends sont done
3. Pour chaque tâche prête → invoquer un agent avec le skill correspondant
4. Quand une tâche se termine → revenir à l'étape 1
```

### Exemple sur le graph précédent

```
ISS-0001 (depends: [])       → prête immédiatement → lancée
ISS-0001 terminée            → ISS-0002 débloquée → lancée
ISS-0002 terminée            → ISS-0003 ET ISS-0004 débloquées → lancées en parallèle
ISS-0004 terminée            → ISS-0005 débloquée → lancée (sans attendre ISS-0003)
ISS-0003 terminée (plus tard) → rien de nouveau à débloquer
```

La différence avec un système par vagues : ISS-0005 n'attend pas que ISS-0003 soit terminée. Elle ne dépend que de ISS-0004 — dès que ISS-0004 est done, elle part.

---

## Représentation visuelle

Le sprint.md contient un graph ASCII pour visualiser les dépendances :

```
ISS-0001 ──────────────────────────────────────────►
    Schéma BDD                                      │
                                                    ▼
                                               ISS-0002
                                          Modèle Product
                                               │       │
                              ┌────────────────┘       └────────────────┐
                              ▼                                         ▼
                         ISS-0003                                  ISS-0004
                      Tests Product                             API /products
                                                                    │
                                                                    ▼
                                                               ISS-0005
                                                            Documentation
```

---

## Gestion des blocages

Si une tâche est bloquée (échec, question à poser à l'humain, dépendance externe) :

1. L'agent signale le blocage dans l'issue
2. L'orchestrateur **ne bloque pas le reste** — les autres tâches prêtes continuent
3. Les tâches qui dépendent de la tâche bloquée sont mises en attente
4. L'humain est notifié pour débloquer

---

## Gestion de l'effort

L'effort estimé influence l'orchestration :

| Effort | Signification | Impact |
|--------|--------------|--------|
| XS | < 15 min | Peut être groupé avec d'autres XS |
| S | 15-30 min | Tâche autonome |
| M | 30 min - 2h | Tâche substantielle — un agent dédié |
| L | 2h - 4h | Envisager un découpage en sous-tâches |
| XL | > 4h | **Doit** être découpé — trop large pour une seule issue |

---

## Exemple complet — Sprint d'une API REST

```
Sprint #01 — CRUD livres et collections (BookShelf API)
Objectif : livrer les endpoints CRUD pour les livres et les collections

ISS-0001  Créer les modèles SQLAlchemy             [M] code-structure    depends: []
ISS-0002  Implémenter le repository Book           [S] code-structure    depends: [ISS-0001]
ISS-0003  Créer les routes CRUD /books             [M] code-structure    depends: [ISS-0002]
ISS-0004  Implémenter le repository Collection     [S] code-structure    depends: [ISS-0001]
ISS-0005  Créer les routes CRUD /collections       [M] code-structure    depends: [ISS-0004]
ISS-0006  Tests unitaires des repositories         [S] testing           depends: [ISS-0002, ISS-0004]
ISS-0007  Tests E2E des routes                     [M] testing           depends: [ISS-0003, ISS-0005]
ISS-0008  Documentation API                        [S] documentation     depends: [ISS-0003, ISS-0005]

Exécution event-driven :
→ ISS-0001 part immédiatement (pas de dépendances)
→ ISS-0001 terminée → ISS-0002 et ISS-0004 débloquées → lancées en parallèle
→ ISS-0002 terminée → ISS-0003 et ISS-0006 débloquées
→ ISS-0004 terminée → ISS-0005 et ISS-0006 débloquées (ISS-0006 attendait les deux)
→ ISS-0003 + ISS-0005 terminées → ISS-0007 et ISS-0008 débloquées
```

---

## État actuel vs vision

**Aujourd'hui** (avril 2026), la plupart des outils IA (Claude Code, Cursor, GPT) exécutent les tâches **séquentiellement**. Un humain lance un agent, l'agent fait une tâche, puis l'humain lance le suivant. La parallélisation native avec orchestration coordonnée n'est pas encore standard.

**Ce que le graph de dépendances apporte dès maintenant** :
- Il **ordonne** les tâches — on sait quoi faire en premier, et pourquoi
- Il **révèle les blocages** — si ISS-0002 dépend de ISS-0001, on ne commence pas ISS-0002 tant que ISS-0001 n'est pas terminée
- Il **prépare la scalabilité** — le jour où les outils supporteront nativement les sous-agents parallèles, le sprint est déjà structuré pour en profiter

**Ce qui viendra** :
- Orchestration multi-agents native dans les outils IA
- Exécution parallèle réelle event-driven
- Allocation dynamique du nombre d'agents selon la complexité

Le Socle est conçu pour cette transition. La méthode est prête, les outils suivront.

---

## Règles de l'orchestrateur

1. **Ne jamais lancer une tâche dont les dépendances ne sont pas terminées**
2. **Lancer dès que prêt** — pas de vagues artificielles, une tâche part dès que ses depends sont done
3. **Un skill principal par tâche** — l'agent charge le skill assigné à l'issue, mais peut charger des skills auxiliaires si la tâche le demande (ex: `code-structure` principal + `testing` pour les tests associés). Le champ `skills_aux` dans le frontmatter de l'issue liste ces skills complémentaires
4. **L'humain valide les gates** — l'orchestrateur ne peut pas passer une gate qualité sans validation humaine
5. **En cas de doute, demander** — un agent bloqué demande à l'humain plutôt que de deviner
6. **Le frontmatter YAML est la source de vérité** — c'est le champ `status` du frontmatter qui fait foi, pas le BOARD.md ni le sprint.md

---

*L'orchestrateur n'est pas un super-agent. C'est une logique de planification qui respecte le graph de dépendances défini par l'humain dans le sprint.*
