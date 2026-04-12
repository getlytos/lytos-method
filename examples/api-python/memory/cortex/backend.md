# Memory — Backend

---

### Fichiers clés

| Fichier | Rôle |
|---------|------|
| `app/main.py` | Point d'entrée FastAPI, configuration CORS et middleware |
| `app/routes/books.py` | Routes CRUD pour les livres |
| `app/services/book_service.py` | Logique métier des livres |
| `app/repositories/book_repo.py` | Accès base de données (SQLAlchemy) |
| `app/models/book.py` | Modèle SQLAlchemy |
| `app/schemas/book.py` | Schémas Pydantic (validation entrée/sortie) |

### Dépendances

- **Python 3.12+** — pour les type hints avancés
- **FastAPI 0.110+** — framework API
- **SQLAlchemy 2.0+** — ORM en mode async
- **Pydantic 2.x** — validation des données
- **asyncpg** — driver PostgreSQL async
