# Memory — Contexte métier

---

### Un livre peut être dans plusieurs collections

**Règle** : Relation many-to-many entre Book et Collection.
**Pourquoi** : Un même livre peut être "Science-fiction" ET "À lire cet été".
**Impact code** : Table d'association `book_collection` en base.

### Un reading est lié à un seul livre

**Règle** : Relation one-to-many. Un livre peut avoir plusieurs readings (relecture).
**Pourquoi** : On peut relire un livre et avoir des notes différentes à chaque lecture.
**Impact code** : `book_id` comme foreign key dans la table `reading`.

### La note est optionnelle

**Règle** : Un reading peut exister sans note (0-5 étoiles). La note est ajoutée après la lecture.
**Pourquoi** : L'utilisateur peut marquer un livre comme "en cours" avant de le noter.
**Impact code** : `rating` est nullable dans le modèle et le schéma.
