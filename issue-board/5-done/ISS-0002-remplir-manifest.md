---
id: ISS-0002
title: "Remplir le manifest du projet"
type: docs
priority: P0-critique
effort: S
skill: documentation
status: 5-done
depends: [ISS-0001]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# ISS-0002 — Remplir le manifest du projet

## Contexte

Le manifest est la constitution du projet — sans lui, les agents n'ont aucun contexte. C'est la première chose à remplir après l'installation du Socle.

## Critère de done

- [ ] Copier `.socle/templates/manifest.md` vers `.socle/manifest.md`
- [ ] Section **Identité** remplie (nom, description, responsable)
- [ ] Section **Pourquoi ce projet existe** remplie (3-5 phrases)
- [ ] Section **Ce que ce projet est** et **n'est pas** remplies
- [ ] Section **Stack technique** remplie
- [ ] Section **Vocabulaire du projet** remplie (au moins 3 termes)
- [ ] Section **Principes de développement** remplie (au moins 2 arbitrages)

## Fichiers concernés

- `.socle/manifest.md` (nouveau, copié depuis le template)
