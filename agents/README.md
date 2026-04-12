# Agents

*Ce dossier documente le fonctionnement des agents dans Le Socle. Les agents ne sont pas le sujet — le socle l'est. Mais comprendre comment ils sont invoqués et orchestrés est essentiel.*

---

## Philosophie

Dans Le Socle, les agents sont traités comme des **pods Kubernetes** — de l'intelligence computationnelle scalable, sans identité fixe.

### Ce que les agents sont

- **Stateless** — ils ne conservent rien entre deux invocations
- **Sans identité** — pas de persona, pas de nom, pas de backstory
- **Invoqués par skill** — ils reçoivent une procédure, pas un rôle
- **Éphémères** — ils sont créés pour une tâche et libérés après

### Ce que les agents ne sont pas

- Pas des membres d'équipe permanents
- Pas des personas avec des traits de caractère
- Pas des experts spécialisés figés dans un domaine
- Pas des entités autonomes qui décident de leur propre chef

---

## Cycle de vie d'un agent

```
1. L'orchestrateur lit le sprint.md
2. Il identifie une tâche à exécuter
3. Il invoque un agent avec :
   - Le manifest du projet (contexte global)
   - La memory (connaissances accumulées)
   - Le skill assigné à la tâche (procédure à suivre)
   - L'issue courante (périmètre précis)
   - Les rules actives (critères de qualité)
4. L'agent exécute la tâche dans ce cadre
5. L'agent produit son output (code, documentation, review...)
6. Si un apprentissage a eu lieu → écriture dans la memory
7. L'agent est libéré
```

---

## Ce que lit un agent au démarrage

| Source | Contenu | Obligatoire |
|--------|---------|-------------|
| `manifest.md` | Identité et intention du projet | Oui |
| `memory/MEMORY.md` | Connaissances accumulées | Oui |
| `skills/[skill].md` | Procédure à suivre pour cette tâche | Oui |
| `rules/*.md` | Critères de qualité à respecter | Oui |
| `issue-board/[statut]/ISS-XXXX-titre.md` | Périmètre précis de la tâche | Oui |
| `sprint.md` | Contexte du sprint en cours | Recommandé |

---

## Ce qu'un agent écrit

| Cible | Quand |
|-------|-------|
| Fichiers du projet | Toujours — c'est son output principal |
| `memory/MEMORY.md` | Si un apprentissage significatif a eu lieu |
| `issue-board/[statut]/ISS-XXXX-titre.md` | Pour mettre à jour le statut (déplacer entre dossiers) |

Un agent **ne modifie jamais** le manifest, les skills ou les rules. Seul l'humain a ce pouvoir.

---

## Scalabilité

Le nombre d'agents est déterminé par la complexité du sprint, pas par une organisation fixe.

- Sprint simple (3-4 issues indépendantes) → 1 agent séquentiel suffit
- Sprint complexe (10+ issues avec dépendances) → plusieurs agents en parallèle
- L'orchestrateur gère l'allocation selon le graph de dépendances

---

## Documentation complémentaire

- [orchestrator.md](./orchestrator.md) — Comment l'orchestrateur lit les dépendances et alloue les agents

---

*Les agents sont le véhicule. Le Socle est la route. Le manifest est la destination.*
