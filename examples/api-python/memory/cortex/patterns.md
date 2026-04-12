# Memory — Patterns découverts

---

### Repository pattern

**Quoi** : Chaque entité a un repository qui encapsule les requêtes SQLAlchemy.
**Où** : `app/repositories/`
**Pourquoi ça marche** : Les services ne connaissent pas SQLAlchemy — on peut changer d'ORM sans toucher à la logique métier. Les tests mockent le repository, pas la base de données.

### Schémas Pydantic séparés (Create / Update / Response)

**Quoi** : Trois schémas par entité — `BookCreate`, `BookUpdate`, `BookResponse`.
**Où** : `app/schemas/`
**Pourquoi ça marche** : Chaque schéma valide exactement ce qui est attendu. `BookCreate` exige les champs obligatoires, `BookUpdate` rend tout optionnel, `BookResponse` inclut l'id et les timestamps.

### Dépendance FastAPI pour la session DB

**Quoi** : La session DB est injectée via `Depends(get_db)` dans chaque route.
**Où** : `app/dependencies.py`
**Pourquoi ça marche** : Chaque requête a sa propre session, automatiquement fermée. Pas de session globale partagée.
