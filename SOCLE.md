# Le Socle — Briefing IA

*Ce fichier explique la méthode Le Socle à l'IA qui travaille sur ce projet. Il est lu une seule fois au démarrage de la première session pour comprendre le cadre. Par la suite, seuls le manifest et la memory sont nécessaires.*

---

## Ce qu'est Le Socle

Le Socle est une méthode de travail humain-IA. Elle remplace les "personas" d'agents (LeadDev, Expert UX...) par des procédures opérationnelles (skills), des critères de qualité (rules), et une mémoire persistante (memory). L'humain est l'architecte, l'IA exécute dans le cadre défini.

## Les fichiers et leur rôle

| Fichier | Rôle | Quand le lire |
|---------|------|---------------|
| `manifest.md` | La constitution du projet — identité, stack, principes de décision, modèles IA | À chaque session |
| `memory/MEMORY.md` | Sommaire de la mémoire — pointe vers les fichiers spécialisés dans `cortex/` | À chaque session |
| `memory/cortex/*.md` | Zones spécialisées (architecture, backend, frontend, patterns, bugs, business, sprints) | Charger uniquement ce qui est pertinent pour la tâche |
| `rules/default-rules.md` | Critères de qualité universels | À chaque session |
| `rules/*-rules.md` | Rules spécifiques au projet (si elles existent) | À chaque session |
| `skills/*.md` | Procédures opérationnelles (code-review, testing, documentation, etc.) | Charger le skill assigné à la tâche |
| `issue-board/BOARD.md` | Vue Kanban — l'état d'avancement des tâches | Quand on travaille sur une tâche |
| `issue-board/[statut]/ISS-*.md` | Les issues avec frontmatter YAML (source de vérité) | Lire l'issue assignée |
| `scripts/generate-board.py` | Régénère le BOARD.md depuis les frontmatter | Utiliser en fin de tâche si besoin |

## Comment les pièces s'emboîtent

```
manifest.md          → Donne le contexte et les principes de décision
    ↓
memory/MEMORY.md     → Donne l'historique et les apprentissages passés
    ↓
rules/               → Définit les critères de qualité à respecter
    ↓
skills/              → Définit la procédure à suivre pour la tâche
    ↓
issue-board/         → Définit le périmètre exact de la tâche (frontmatter = source de vérité)
```

## Aider l'humain à remplir le manifest

Si le manifest est vide ou incomplet, aider l'humain à le remplir en posant des questions :

### Identité
- "Comment s'appelle le projet et que fait-il en une phrase ?"

### Pourquoi ce projet existe
- "Quel problème ce projet résout ? Pour qui ?"

### Stack technique
- Regarder les fichiers du projet (package.json, requirements.txt, go.mod, composer.json) pour détecter la stack automatiquement.

### Vocabulaire
- "Quels termes sont spécifiques à ce projet ? Qu'est-ce qu'un [terme métier] dans ce contexte ?"

### Principes de développement
Les principes sont des **arbitrages**, pas des vœux pieux. Chaque principe dit "on préfère X plutôt que Y, parce que Z." Exemples :
- "Simplicité plutôt que flexibilité — on ne code pas pour un besoin hypothétique"
- "Convention plutôt que configuration — on suit le framework, on n'invente pas"

Si l'humain dit "écrire du code propre", reformuler en arbitrage vérifiable.

### Modèles IA par complexité
- Demander quels modèles sont disponibles (budget, outils)
- Proposer une répartition : le modèle le moins cher pour la doc et le formatage, le modèle standard pour le développement courant, le plus puissant pour l'architecture et la sécurité

## Aider l'humain à créer des issues

Les issues ont un frontmatter YAML. Les champs importants :
- `complexity: light | standard | heavy` — détermine le modèle à utiliser (voir table dans le manifest)
- `skill` — le skill principal à charger
- `depends` — les issues qui doivent être terminées avant celle-ci
- `status` — le dossier dans lequel se trouve le fichier (source de vérité)

## Comportement attendu

1. **Ne pas interpréter silencieusement** — si une instruction est ambiguë, demander plutôt que deviner
2. **Tracer les décisions** — quand un choix technique est fait, le mentionner avec la raison
3. **En fin de tâche** — mettre à jour le frontmatter de l'issue, déplacer le fichier, mettre à jour le BOARD.md
4. **Enrichir la memory** — si un apprentissage significatif a lieu, l'ajouter dans le fichier cortex correspondant

---

*Ce briefing est opérationnel. L'IA qui le lit comprend la méthode et peut guider l'humain dans la mise en place du Socle.*
