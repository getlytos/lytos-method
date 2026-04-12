# Memory — Mon Plugin Réservation

*Ce fichier est le sommaire de la mémoire du projet. Il est lu par les agents au démarrage de chaque session pour savoir quelles sections charger. Ne pas tout lire — charger uniquement ce qui est pertinent pour la tâche en cours.*

> **Dernière mise à jour** : 2026-03-12
> **Nombre d'entrées** : 8

---

## Comment utiliser cette memory

1. L'agent lit ce sommaire au démarrage de session
2. Il identifie les sections pertinentes pour sa tâche (via le domaine de l'issue)
3. Il charge uniquement les fichiers nécessaires
4. Après la tâche, il met à jour le fichier concerné et ce sommaire si besoin

---

## Index des sections

| Fichier | Contenu | Charger quand... |
|---------|---------|------------------|
| [architecture.md](./cortex/architecture.md) | Tables custom vs CPT, choix JS vanilla | Toute tâche structurante |
| [backend.md](./cortex/backend.md) | $wpdb, API REST, pièges WordPress | Tâche PHP / base de données |
| [frontend.md](./cortex/frontend.md) | Formulaire, templates surchargables | Tâche JS / CSS / template |
| [patterns.md](./cortex/patterns.md) | Préfixage mpr_, template WooCommerce-like | Code review, nouveau code |
| [bugs.md](./cortex/bugs.md) | $wpdb->prepare() warnings, admin-ajax lent | Debug, fix |
| [business.md](./cortex/business.md) | Créneaux 1h, confirmation immédiate | Logique métier, UX |
| [sprints.md](./cortex/sprints.md) | Sprint #01 MVP en cours | Planification, rétrospective |

---

## Résumé vivant

Plugin de réservation WordPress en cours de développement (Sprint #01). Architecture : table custom + API REST (admin-ajax abandonné). JS vanilla, pas de jQuery. Le formulaire front est fonctionnel, le CRUD et l'email de confirmation sont en cours.

---

*Le dossier est la structure. Le fichier est le contenu. Ce sommaire est la carte.*
