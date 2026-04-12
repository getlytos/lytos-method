# Memory — Patterns découverts

*Les patterns de code, de structure ou d'organisation qui ont émergé et qui fonctionnent bien sur ce projet.*

---

### Préfixage systématique `mpr_`

**Quoi** : Toutes les fonctions, hooks et options sont préfixés `mpr_`.
**Où** : Tout le codebase.
**Pourquoi ça marche** : Pas de collision avec d'autres plugins constatée. Convention WordPress standard.

### Template surchargeable (pattern WooCommerce)

**Quoi** : Le formulaire est rendu via `templates/reservation-form.php`. Le thème peut le surcharger en plaçant `mpr/reservation-form.php` dans son dossier.
**Où** : `templates/reservation-form.php`
**Pourquoi ça marche** : Pattern éprouvé par WooCommerce, familier pour les développeurs WordPress.
