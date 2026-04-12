---
id: ISS-0003
title: "Définir les rules spécifiques du projet"
type: docs
priority: P1-haute
effort: S
domain: [qualité]
skill: documentation
status: 3-in-progress
depends: [ISS-0002]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# ISS-0003 — Définir les rules spécifiques du projet

## Contexte

Les rules par défaut du Socle (`rules/default-rules.md`) couvrent les bonnes pratiques universelles. Mais chaque projet a ses propres contraintes : préfixes de fonctions, conventions CSS, contraintes de compatibilité, etc.

## Solution proposée

Créer `.socle/rules/[nom-du-projet]-rules.md` avec les règles propres au projet, en s'inspirant du format des rules par défaut.

## Critère de done

- [ ] Conventions de nommage spécifiques identifiées
- [ ] Contraintes techniques identifiées
- [ ] Fichier de rules rédigé au format tableau
- [ ] Validé avec l'équipe / le responsable du projet

## Fichiers concernés

- `.socle/rules/[nom-du-projet]-rules.md` (nouveau)

## Notes

Voir `rules/README.md` pour le format attendu et des exemples de rules spécifiques.
