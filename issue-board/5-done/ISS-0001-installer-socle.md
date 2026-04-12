---
id: ISS-0001
title: "Installer Le Socle dans le projet"
type: chore
priority: P0-critique
effort: XS
skill: ~
status: 5-done
depends: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# ISS-0001 — Installer Le Socle dans le projet

## Quoi faire

Ajouter Le Socle comme submodule Git dans le dossier `.socle/` à la racine du projet.

```bash
git submodule add https://github.com/le-socle/socle .socle
```

## Fichiers concernés

- `.gitmodules`
- `.socle/` (nouveau dossier)

## Critère de done

Le dossier `.socle/` existe à la racine du projet avec toute la structure du Socle : skills, rules, templates, issue-board.
