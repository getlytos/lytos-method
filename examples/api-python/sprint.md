# Sprint #01 — CRUD livres et collections

> **Objectif** : Livrer les endpoints CRUD pour les livres et les collections.
> **Début** : 2026-03-15
> **Fin prévue** : 2026-03-29

---

## Tâches

| Issue | Titre | Effort | Skill | Depends | Status |
|-------|-------|--------|-------|---------|--------|
| ISS-0001 | Créer les modèles SQLAlchemy (Book, Collection) | M | code-structure | — | done |
| ISS-0002 | Implémenter le repository Book | S | code-structure | ISS-0001 | done |
| ISS-0003 | Créer les routes CRUD /books | M | code-structure | ISS-0002 | in-progress |
| ISS-0004 | Implémenter le repository Collection | S | code-structure | ISS-0001 | in-progress |
| ISS-0005 | Créer les routes CRUD /collections | M | code-structure | ISS-0004 | backlog |
| ISS-0006 | Tests unitaires des repositories | S | testing | ISS-0002, ISS-0004 | backlog |
| ISS-0007 | Tests E2E des routes | M | testing | ISS-0003, ISS-0005 | backlog |
| ISS-0008 | Documentation API (docstrings + exemples) | S | documentation | ISS-0003, ISS-0005 | backlog |

---

## Graph de dépendances

```
ISS-0001 (modèles)
├── ISS-0002 (repo Book) ──── ISS-0003 (routes /books) ───┐
│   └── ISS-0006 (tests repos) ◄──────────────────────────┤
└── ISS-0004 (repo Collection) ── ISS-0005 (routes /collections) ──┤
                                                                    ▼
                                                              ISS-0007 (tests E2E)
                                                              ISS-0008 (documentation)
```
