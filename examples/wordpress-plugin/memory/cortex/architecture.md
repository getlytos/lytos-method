# Memory — Architecture & Décisions techniques

*Les décisions architecturales importantes, pourquoi elles ont été prises, ce qu'elles impliquent. Charger ce fichier pour toute tâche qui touche à la structure du projet.*

---

### 2026-03-10 — Tables custom plutôt que Custom Post Types

**Contexte** : Hésitation entre stocker les réservations en CPT ou en table custom.
**Décision** : Table custom `wp_mpr_reservations` via `$wpdb`.
**Conséquence** : Plus de contrôle sur les requêtes SQL, pas de pollution de `wp_posts`. Nécessite de gérer l'activation/désactivation du plugin manuellement.

### 2026-03-11 — JavaScript vanilla, pas de jQuery

**Contexte** : Le thème n'utilise pas jQuery, et WordPress tend à s'en éloigner.
**Décision** : Tout le JS front en vanilla ES6+.
**Conséquence** : Pas de dépendance à `wp-jquery`, le formulaire est plus léger. Attention à la compatibilité IE11 — mais on l'a exclue du scope.

### 2026-03-11 — API REST plutôt que admin-ajax

**Contexte** : admin-ajax.php trop lent sur hébergement mutualisé OVH.
**Décision** : Utiliser l'API REST WordPress (`/wp-json/mpr/v1/reservations`).
**Conséquence** : Plus rapide, plus propre. Nécessite de gérer l'authentification via nonces REST.
