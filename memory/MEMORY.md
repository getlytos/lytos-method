# Memory — [Nom du projet]

*Ce fichier est le sommaire de la mémoire du projet. Il est lu par les agents au démarrage de chaque session pour savoir quelles sections charger. Ne pas tout lire — charger uniquement ce qui est pertinent pour la tâche en cours.*

> **Dernière mise à jour** : YYYY-MM-DD
> **Nombre d'entrées** : 0

---

## Comment utiliser cette memory

1. L'agent lit ce sommaire au démarrage de session
2. Il identifie les sections pertinentes pour sa tâche (via le domaine de l'issue)
3. Il charge uniquement les fichiers nécessaires
4. Après la tâche, il met à jour le fichier concerné et ce sommaire si besoin

**Règle** : un agent qui travaille sur le front n'a pas besoin de lire `backend.md`. Un agent qui fait une code review lit `architecture.md` et `patterns.md`, pas `business.md`.

---

## Index des sections

| Fichier | Contenu | Charger quand... |
|---------|---------|------------------|
| [architecture.md](./cortex/architecture.md) | Décisions architecturales, choix techniques structurants | Toute tâche qui touche à la structure du projet |
| [backend.md](./cortex/backend.md) | Patterns, pièges et solutions côté serveur | Tâche backend (API, BDD, services, auth) |
| [frontend.md](./cortex/frontend.md) | Patterns, pièges et solutions côté client | Tâche frontend (UI, composants, styles, JS) |
| [patterns.md](./cortex/patterns.md) | Patterns de code récurrents qui fonctionnent bien | Code review, refactoring, écriture de nouveau code |
| [bugs.md](./cortex/bugs.md) | Problèmes récurrents et leurs solutions | Debug, fix, et avant d'explorer une piste déjà tentée |
| [business.md](./cortex/business.md) | Contexte métier, vocabulaire, règles implicites | Tâche qui touche à la logique métier ou à l'UX |
| [sprints.md](./cortex/sprints.md) | Historique des sprints passés et apprentissages clés | Début de sprint, rétrospective, planification |

---

## Résumé vivant

*3-5 lignes max. L'état actuel du projet en un coup d'œil. Mis à jour à chaque fin de sprint.*

---

*Le dossier est la structure. Le fichier est le contenu. Ce sommaire est la carte.*
