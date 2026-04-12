# Memory — BookShelf API

*Ce fichier est le sommaire de la mémoire du projet. Charger uniquement les sections pertinentes pour la tâche en cours.*

> **Dernière mise à jour** : 2026-04-10
> **Nombre d'entrées** : 6

---

## Index des sections

| Fichier | Contenu | Charger quand... |
|---------|---------|------------------|
| [architecture.md](./cortex/architecture.md) | SQLAlchemy 2.0, structure en couches, choix PostgreSQL | Toute tâche structurante |
| [backend.md](./cortex/backend.md) | Routes FastAPI, dépendances, middleware | Tâche API / routes / services |
| [patterns.md](./cortex/patterns.md) | Repository pattern, schémas Pydantic | Code review, nouveau code |
| [bugs.md](./cortex/bugs.md) | Sérialisation datetime, N+1 SQLAlchemy | Debug, fix |
| [business.md](./cortex/business.md) | Règles de gestion des collections et readings | Logique métier |
| [sprints.md](./cortex/sprints.md) | Sprint #01 en cours | Planification |

---

## Résumé vivant

API REST de gestion de bibliothèque en cours de développement (Sprint #01). Architecture en couches (routes → services → repositories) avec SQLAlchemy 2.0 en mode async. Le CRUD des livres est fonctionnel, les collections et les readings sont en cours.

---

*Le dossier est la structure. Le fichier est le contenu. Ce sommaire est la carte.*
