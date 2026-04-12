# Memory — Mon Plugin Réservation

*Ce fichier est le cerveau persistant du projet. Il est lu par les agents au démarrage de chaque session. Il grandit à chaque sprint. Ne jamais le vider — seulement l'enrichir et le consolider.*

---

## Architecture & Décisions techniques

### 2026-03-10 — Tables custom plutôt que Custom Post Types

**Contexte** : Hésitation entre stocker les réservations en CPT ou en table custom.
**Décision** : Table custom `wp_mpr_reservations` via `$wpdb`.
**Conséquence** : Plus de contrôle sur les requêtes SQL, pas de pollution de `wp_posts`. Nécessite de gérer l'activation/désactivation du plugin manuellement.

### 2026-03-11 — JavaScript vanilla, pas de jQuery

**Contexte** : Le thème n'utilise pas jQuery, et WordPress tend à s'en éloigner.
**Décision** : Tout le JS front en vanilla ES6+.
**Conséquence** : Pas de dépendance à `wp-jquery`, le formulaire est plus léger. Attention à la compatibilité IE11 — mais on l'a exclue du scope.

---

## Patterns découverts

### Préfixage systématique `mpr_`

Toutes les fonctions, hooks et options sont préfixés `mpr_` pour éviter les conflits. Ce pattern fonctionne bien — pas de collision avec d'autres plugins constatée.

### Template surchargeable

Le formulaire est rendu via `templates/reservation-form.php`. Le thème peut le surcharger en plaçant un fichier `mpr/reservation-form.php` dans son dossier. Pattern copié de WooCommerce — fonctionne bien.

---

## Problèmes récurrents & Solutions

| Problème | Cause | Solution |
|----------|-------|----------|
| `$wpdb->prepare()` retourne des warnings avec `%d` sur des valeurs nulles | WordPress 6.4 a durci la validation des placeholders | Toujours passer une valeur par défaut (0) plutôt que null |

---

## Ce qui ne fonctionne pas

### AJAX avec `admin-ajax.php` pour le formulaire front

Testé et abandonné — trop lent sur l'hébergement mutualisé. On utilise l'API REST WordPress à la place (`/wp-json/mpr/v1/reservations`). Plus rapide, plus propre.

---

## Fichiers clés

| Fichier | Rôle |
|---------|------|
| `mon-plugin-reservation.php` | Point d'entrée du plugin, activation/désactivation |
| `includes/class-reservation.php` | Modèle Reservation — CRUD complet |
| `includes/class-admin-page.php` | Page admin — liste des réservations |
| `templates/reservation-form.php` | Template front du formulaire |
| `assets/js/reservation-form.js` | JS du formulaire — validation + appel API |

---

## Dépendances critiques

- **WordPress 6.4+** — nécessaire pour l'API REST et les hooks utilisés
- **PHP 8.1+** — on utilise les enums et les named arguments
- **Playwright** — pour les tests E2E du formulaire

---

## Contexte métier accumulé

- Un créneau dure toujours 1 heure — pas de créneaux de durée variable pour le MVP
- Les réservations sont confirmées immédiatement — pas de workflow de validation
- L'admin définit les créneaux manuellement — pas d'import calendrier externe

---

## Historique des sprints

| Sprint | Objectif | Résultat | Apprentissage clé |
|--------|----------|----------|-------------------|
| #01 | MVP formulaire de réservation | En cours | L'API REST est plus adaptée que admin-ajax pour le front |

---

## Notes libres

- Le client a mentionné qu'il voudrait un export CSV des réservations — à prévoir pour le sprint #02
- Le staging est sur un sous-domaine OVH — le certificat SSL est auto-signé, ce qui fait échouer Playwright sans `--ignore-https-errors`

---

*Dernière mise à jour : 2026-03-12*
*Taille actuelle : 8 entrées*
