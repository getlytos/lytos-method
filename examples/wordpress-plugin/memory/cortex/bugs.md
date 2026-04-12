# Memory — Problèmes récurrents & Solutions

*Les problèmes qui reviennent souvent et comment on les résout.*

---

| Problème | Cause | Solution |
|----------|-------|----------|
| `$wpdb->prepare()` retourne des warnings avec `%d` sur des valeurs nulles | WordPress 6.4 a durci la validation des placeholders | Toujours passer une valeur par défaut (0) plutôt que null |
| Playwright échoue sur staging | Certificat SSL auto-signé sur sous-domaine OVH | Lancer avec `--ignore-https-errors` |

### admin-ajax.php — abandonné

**Symptôme** : Le formulaire front met 2-3 secondes à répondre.
**Cause racine** : admin-ajax.php charge tout le back-office WordPress à chaque requête.
**Solution** : Migré vers l'API REST WordPress (`/wp-json/mpr/v1/reservations`).
**Piège** : Ne pas revenir sur admin-ajax "pour simplifier" — c'est un faux ami sur hébergement mutualisé.
