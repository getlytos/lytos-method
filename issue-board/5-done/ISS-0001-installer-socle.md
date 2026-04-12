# ISS-0001 — Installer Le Socle dans le projet

**Type** : `chore`
**Priorité** : `P0-critique`
**Effort** : `XS`
**Agent-skill** : —
**Status** : `5-done`
**Créé** : YYYY-MM-DD
**Depends** : —

---

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

---

*Dernière mise à jour : YYYY-MM-DD*
