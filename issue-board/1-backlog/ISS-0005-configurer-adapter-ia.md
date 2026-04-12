# ISS-0005 — Configurer l'adapter IA du projet

**Type** : `chore`
**Priorité** : `P1-haute`
**Effort** : `XS`
**Agent-skill** : —
**Status** : `1-backlog`
**Créé** : YYYY-MM-DD
**Depends** : ISS-0002

---

## Quoi faire

Configurer l'outil IA utilisé sur le projet pour qu'il charge automatiquement le manifest, la memory et les rules du Socle au démarrage de chaque session.

Selon l'outil :
- **Claude Code** → créer `CLAUDE.md` (voir `.socle/adapters/claude-code/`)
- **Cursor** → créer `.cursorrules` (voir `.socle/adapters/cursor/`)
- **OpenAI** → configurer les instructions système (voir `.socle/adapters/openai/`)

## Fichiers concernés

- `CLAUDE.md` ou `.cursorrules` (nouveau, à la racine du projet)

## Critère de done

L'outil IA charge automatiquement le manifest et la memory à chaque nouvelle session. Un test : démarrer une session et demander "Quel est le projet sur lequel on travaille ?" — l'agent doit répondre correctement.

---

*Dernière mise à jour : YYYY-MM-DD*
