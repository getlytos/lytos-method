# Adapters

*Ce dossier contient les connecteurs entre Lytos et les outils IA. Lytos est agnostique — la méthode est la même, l'outil change. Les adapters font le pont.*

---

## Pourquoi des adapters

Lytos est une méthode, pas un outil. Il fonctionne avec n'importe quel LLM ou assistant IA capable de lire des fichiers markdown et de suivre des instructions structurées.

Mais chaque outil a ses spécificités :
- Claude Code a ses fichiers `CLAUDE.md` et ses sous-agents
- Cursor a ses fichiers `.cursorrules` et son chat intégré
- L'API OpenAI a ses instructions système et ses assistants

Les adapters documentent comment configurer chaque outil pour qu'il charge et respecte Lytos.

---

## Adapters disponibles

| Adapter | Outil | Statut |
|---------|-------|--------|
| [claude-code](./claude-code/) | Claude Code (CLI + IDE) | Disponible |
| [cursor](./cursor/) | Cursor IDE | Disponible |
| [openai](./openai/) | API OpenAI / Assistants | Disponible |

---

## Créer un nouvel adapter

Pour ajouter un adapter pour un nouvel outil IA :

1. Créer un dossier `adapters/[nom-de-loutil]/`
2. Y placer un `README.md` qui explique :
   - Comment configurer l'outil pour charger le manifest + memory au démarrage
   - Comment invoquer un skill explicitement
   - Comment structurer les agents sans personas (skill-first)
   - Un exemple de configuration complet
3. Submit a PR following [CONTRIBUTING.md](../CONTRIBUTING.md)

### Principes à respecter

- L'adapter ne modifie **jamais** la méthode — il adapte l'outil à la méthode
- La structure du dossier `.lytos/` reste identique quel que soit l'adapter
- Les skills et rules sont les mêmes — seule la façon de les charger change
- L'adapter doit être testable sur un projet réel

---

*Lytos ne dépend d'aucun vendor. Si un outil meurt demain, seul l'adapter change — la méthode, les skills, la memory, tout le reste persiste.*
