# Memory — Problèmes récurrents & Solutions

---

| Problème | Cause | Solution |
|----------|-------|----------|
| `datetime` non sérialisable en JSON | SQLAlchemy retourne des `datetime` natifs, pas des strings | Configurer Pydantic avec `model_config = ConfigDict(from_attributes=True)` et utiliser `datetime` dans les schémas |
| N+1 queries sur les collections | `relationship()` en lazy loading par défaut | Utiliser `selectinload()` explicitement dans les requêtes qui chargent les relations |
| Tests async qui plantent | `pytest` ne supporte pas `async def` nativement | Ajouter `pytest-asyncio` et marquer les tests avec `@pytest.mark.asyncio` |
