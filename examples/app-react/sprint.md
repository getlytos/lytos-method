# Sprint #01 — Board Kanban interactif

> **Objectif** : Livrer un board Kanban fonctionnel avec drag & drop et persistance.
> **Début** : 2026-03-20
> **Fin prévue** : 2026-04-03

---

## Tâches

| Issue | Titre | Effort | Skill | Depends | Status |
|-------|-------|--------|-------|---------|--------|
| ISS-0001 | Créer le layout et la navigation | S | code-structure | — | done |
| ISS-0002 | Implémenter le composant Board (colonnes + cartes) | M | code-structure | ISS-0001 | done |
| ISS-0003 | Ajouter le drag & drop (@dnd-kit) | M | code-structure | ISS-0002 | in-progress |
| ISS-0004 | Connecter le store Zustand | S | code-structure | ISS-0002 | done |
| ISS-0005 | Implémenter les optimistic updates | S | code-structure | ISS-0003, ISS-0004 | backlog |
| ISS-0006 | Créer le formulaire d'ajout de carte | S | code-structure | ISS-0002 | backlog |
| ISS-0007 | Tests Vitest des composants | M | testing | ISS-0005, ISS-0006 | backlog |
| ISS-0008 | Tests Playwright du parcours Kanban | M | testing | ISS-0005 | backlog |

---

## Graph de dépendances

```
ISS-0001 (layout)
└── ISS-0002 (Board)
    ├── ISS-0003 (drag & drop) ──┐
    ├── ISS-0004 (store) ────────┤
    │                            ▼
    │                      ISS-0005 (optimistic updates)
    │                            │
    │                            ├── ISS-0007 (tests Vitest)
    │                            └── ISS-0008 (tests Playwright)
    └── ISS-0006 (formulaire carte)
            └── ISS-0007 (tests Vitest)
```
