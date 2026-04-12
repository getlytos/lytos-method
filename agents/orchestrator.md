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

### Étape 2 — Identifier les vagues

Le graph se lit en **vagues** — chaque vague contient les tâches dont toutes les dépendances sont satisfaites.

```
Vague 1 (parallèle) :
  └── ISS-0001  Créer le schéma de base de données

Vague 2 (parallèle) :
  └── ISS-0002  Implémenter le modèle Product

Vague 3 (parallèle) :
  ├── ISS-0003  Écrire les tests du modèle Product
  └── ISS-0004  Créer l'API REST /products

Vague 4 (parallèle) :
  └── ISS-0005  Écrire la documentation API
```

### Étape 3 — Allouer les agents

Pour chaque vague :
1. Prendre toutes les tâches dont le status est `open` et les dépendances sont `done`
2. Pour chaque tâche, invoquer un agent avec le skill correspondant
3. Les tâches d'une même vague tournent en parallèle
4. Attendre que toutes les tâches de la vague soient `done` avant de passer à la suivante

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
2. L'orchestrateur **ne bloque pas le reste** — les autres vagues continuent si possible
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

## Exemple complet — Sprint d'un plugin WordPress

```
Sprint #02 — MVP du plugin de réservation
Objectif : livrer le formulaire de réservation fonctionnel

Vague 1 :
├── ISS-0010  Créer la table wp_reservations          [M] code-structure
└── ISS-0011  Créer les constantes et config du plugin [XS] code-structure

Vague 2 :
├── ISS-0012  Implémenter le CRUD des réservations     [M] code-structure
│             depends: ISS-0010
└── ISS-0013  Créer le formulaire front                [M] code-structure
              depends: ISS-0011

Vague 3 :
├── ISS-0014  Connecter le formulaire au CRUD          [S] code-structure
│             depends: ISS-0012, ISS-0013
└── ISS-0015  Tests unitaires du CRUD                  [S] testing
              depends: ISS-0012

Vague 4 :
├── ISS-0016  Tests E2E du parcours réservation        [M] testing
│             depends: ISS-0014
└── ISS-0017  Documentation utilisateur                [S] documentation
              depends: ISS-0014

Vague 5 :
└── ISS-0018  Code review finale                       [S] code-review
              depends: ISS-0015, ISS-0016, ISS-0017
```

---

## Règles de l'orchestrateur

1. **Ne jamais lancer une tâche dont les dépendances ne sont pas terminées**
2. **Toujours paralléliser** quand c'est possible — c'est l'avantage principal de l'orchestration
3. **Un agent = un skill = une tâche** — pas de multi-tasking
4. **L'humain valide les gates** — l'orchestrateur ne peut pas passer une gate qualité sans validation humaine
5. **En cas de doute, demander** — un agent bloqué demande à l'humain plutôt que de deviner

---

*L'orchestrateur n'est pas un super-agent. C'est une logique de planification qui respecte le graph de dépendances défini par l'humain dans le sprint.*
