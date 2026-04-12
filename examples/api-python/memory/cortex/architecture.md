# Memory — Architecture & Décisions techniques

---

### 2026-03-15 — Architecture en couches (routes → services → repositories)

**Contexte** : Hésitation entre tout mettre dans les routes FastAPI ou séparer en couches.
**Décision** : Séparation stricte en 3 couches. Les routes ne contiennent que la validation HTTP et la sérialisation. La logique métier est dans les services. L'accès aux données dans les repositories.
**Conséquence** : Plus de fichiers, mais chaque couche est testable indépendamment. Les services ne connaissent pas FastAPI.

### 2026-03-15 — SQLAlchemy 2.0 en mode async

**Contexte** : SQLAlchemy 1.x en mode sync vs 2.0 async.
**Décision** : SQLAlchemy 2.0 avec `AsyncSession` et `create_async_engine`.
**Conséquence** : Compatible avec l'architecture async de FastAPI. Nécessite `asyncpg` comme driver PostgreSQL au lieu de `psycopg2`.

### 2026-03-16 — PostgreSQL plutôt que SQLite

**Contexte** : SQLite suffirait pour le MVP, mais pose des problèmes de concurrence.
**Décision** : PostgreSQL dès le début, SQLite uniquement pour les tests unitaires.
**Conséquence** : Docker Compose nécessaire pour le dev local. Les tests utilisent un SQLite in-memory pour la vitesse.
