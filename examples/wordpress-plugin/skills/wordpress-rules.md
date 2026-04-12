# Rules — WordPress

*Règles spécifiques aux projets WordPress utilisant Le Socle. Ces règles complètent les règles par défaut.*

---

## Nommage

| Règle | Détail |
|-------|--------|
| Préfixe obligatoire | Toutes les fonctions, hooks, options et tables commencent par le préfixe du plugin |
| Format du préfixe | Abréviation courte en snake_case (`mpr_`, `wcs_`, etc.) |
| Classes | `class-{nom}.php` → `class Nom` |

---

## Sécurité WordPress

| Règle | Détail |
|-------|--------|
| Nonces obligatoires | Tout formulaire et toute action AJAX vérifie un nonce |
| `$wpdb->prepare()` | Aucune requête SQL sans prepare — jamais de concaténation directe |
| Capabilities | Vérifier `current_user_can()` avant toute action admin |
| Échappement output | `esc_html()`, `esc_attr()`, `esc_url()` systématique en sortie |
| Validation input | `sanitize_text_field()`, `absint()`, `sanitize_email()` sur toute entrée |

---

## Structure

| Règle | Détail |
|-------|--------|
| Point d'entrée unique | Le fichier principal du plugin ne contient que les hooks et l'autoload |
| Séparation admin/front | Code admin dans `admin/`, code front dans `public/` ou `templates/` |
| Templates surchargables | Les templates front peuvent être surchargés par le thème |
| Pas de requêtes en front | Les requêtes lourdes passent par l'API REST ou des transients |

---

## Hooks

| Règle | Détail |
|-------|--------|
| Documentation des hooks | Chaque `add_action` / `add_filter` a un commentaire décrivant son rôle |
| Priorité explicite | Toujours spécifier la priorité (pas de valeur par défaut implicite) |
| Unhook possible | Les hooks doivent pouvoir être désactivés par un thème ou un autre plugin |

---

## Base de données

| Règle | Détail |
|-------|--------|
| Préfixe de table | Utiliser `$wpdb->prefix` — jamais de préfixe en dur |
| Migration | La création/mise à jour de tables passe par `dbDelta()` |
| Désinstallation propre | Le plugin supprime ses tables et options à la désinstallation (via `uninstall.php`) |

---

*Ces règles s'ajoutent aux règles par défaut du Socle. En cas de conflit, les règles WordPress priment.*
