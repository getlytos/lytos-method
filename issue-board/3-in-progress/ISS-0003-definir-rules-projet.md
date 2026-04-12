# ISS-0003 — Définir les rules spécifiques du projet

**Type** : `docs`
**Priorité** : `P1-haute`
**Effort** : `S`
**Domaine** : qualité
**Agent-skill** : documentation
**Status** : `3-in-progress`
**Créé** : YYYY-MM-DD
**Modifié** : YYYY-MM-DD
**Depends** : ISS-0002

---

## Contexte

Les rules par défaut du Socle (`rules/default-rules.md`) couvrent les bonnes pratiques universelles. Mais chaque projet a ses propres contraintes : préfixes de fonctions, conventions CSS, contraintes de compatibilité, etc.

Cette issue consiste à créer un fichier de rules spécifiques au projet qui complète les rules par défaut.

## Solution proposée

Créer `.socle/rules/[nom-du-projet]-rules.md` avec les règles propres au projet, en s'inspirant du format des rules par défaut.

## Checklist

- [ ] Identifier les conventions de nommage spécifiques (préfixes, casing)
- [ ] Identifier les contraintes techniques (compatibilité, dépendances interdites)
- [ ] Identifier les règles de style spécifiques (CSS, composants)
- [ ] Rédiger le fichier de rules au format tableau
- [ ] Valider avec l'équipe / le responsable du projet

## Fichiers concernés

- `.socle/rules/[nom-du-projet]-rules.md` (nouveau)

## Notes

Voir `rules/README.md` pour le format attendu et des exemples de rules spécifiques (WordPress, API).

---

*Dernière mise à jour : YYYY-MM-DD*
