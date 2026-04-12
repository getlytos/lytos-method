# Memory — Backend

*Patterns, pièges et solutions côté serveur. Charger ce fichier pour toute tâche backend : API, base de données, services, authentification.*

---

### Fichiers clés backend

| Fichier | Rôle |
|---------|------|
| `mon-plugin-reservation.php` | Point d'entrée du plugin, activation/désactivation |
| `includes/class-reservation.php` | Modèle Reservation — CRUD complet |
| `includes/class-admin-page.php` | Page admin — liste des réservations |

### Dépendances

- **WordPress 6.4+** — nécessaire pour l'API REST et les hooks utilisés
- **PHP 8.1+** — on utilise les enums et les named arguments
