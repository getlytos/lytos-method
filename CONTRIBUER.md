# Contribuer au Socle

*Guide de contribution au projet Le Socle. Avant de soumettre une PR, lire ce document en entier.*

---

## Comment contribuer

Le Socle est un projet ouvert. Les contributions sont les bienvenues dans ces domaines :

| Type de contribution | Description |
|---------------------|-------------|
| **Nouveau skill** | Une procédure réutilisable pour un cas d'usage non couvert |
| **Nouvel adapter** | Un connecteur pour un outil IA non encore supporté |
| **Amélioration** | Correction ou enrichissement d'un skill, rule ou template existant |
| **Exemple** | Un exemple concret d'utilisation du Socle sur un type de projet |
| **Documentation** | Correction, clarification ou traduction |
| **Bug report** | Signalement d'une incohérence ou d'une erreur |

---

## Proposer un nouveau skill

Un skill est une procédure opérationnelle qu'un agent peut appliquer immédiatement. Pour proposer un nouveau skill :

### Critères d'acceptation

1. **Opérationnel** — un agent peut l'appliquer sans interprétation supplémentaire
2. **Réutilisable** — utile sur plusieurs projets, pas spécifique à un seul contexte
3. **Structuré** — suit le format des skills existants (titre, quand invoquer, procédure, checklist)
4. **En français** — le contenu conceptuel est en français, les exemples de code en anglais

### Format attendu

```markdown
# Skill — [Nom du skill]

*Une phrase qui dit ce que fait ce skill.*

---

## Quand invoquer ce skill

- ...

## Procédure

### 1. [Étape]
...

## Checklist

- [ ] ...

---

*Ce skill est opérationnel immédiatement...*
```

### Processus

1. Ouvrir une issue avec le template **Skill Request**
2. Discuter du périmètre dans l'issue
3. Écrire le skill
4. Soumettre une PR

---

## Proposer un nouvel adapter

Un adapter fait le pont entre Le Socle et un outil IA. Pour proposer un nouvel adapter :

### Critères d'acceptation

1. **Testé** — l'adapter a été testé sur un projet réel
2. **Complet** — il couvre : configuration, chargement du manifest/memory/skills, invocation de skill, workflow type
3. **Fidèle à la méthode** — il ne modifie pas la méthode, il adapte l'outil

### Processus

1. Créer le dossier `adapters/[nom-de-loutil]/`
2. Y placer un `README.md` complet
3. Soumettre une PR

---

## Format des PR

### Titre

```
type: description courte
```

Types : `feat`, `fix`, `docs`, `chore`

Exemples :
- `feat: ajouter le skill deployment`
- `docs: clarifier la procédure de code review`
- `feat: ajouter l'adapter pour Windsurf`

### Corps de la PR

```markdown
## Contexte
Pourquoi cette contribution.

## Changements
- Liste des modifications principales

## Tests
Comment vérifier que la contribution fonctionne.
```

### Checklist PR

- [ ] Le contenu conceptuel est en français
- [ ] Les noms de fichiers et dossiers sont en anglais
- [ ] Le format des fichiers existants est respecté
- [ ] Pas de jargon inutile — compréhensible par un non-développeur

---

## Conventions

### Langue

- **Contenu conceptuel et philosophique** → français
- **Noms de fichiers, dossiers, code** → anglais
- **Exemples de code** → les commentaires peuvent être en français ou anglais, cohérent avec l'exemple

### Style

- Chaque fichier commence par une phrase qui dit ce qu'il est et à quoi il sert
- Pas de jargon inutile — Le Socle doit être compréhensible par un non-développeur
- Les listes à puces plutôt que les paragraphes quand c'est possible
- Les tableaux pour les informations structurées

### Structure

- Un fichier = un sujet
- Les fichiers longs sont découpés
- Chaque section est séparée par `---`

---

## Code de conduite

- **Bienveillance** — toute contribution est une aide, même imparfaite
- **Clarté** — privilégier la compréhension à l'exhaustivité
- **Respect** — des retours constructifs, pas de critique gratuite
- **Pragmatisme** — ce qui fonctionne en pratique prime sur la théorie

Les discussions se font dans les issues et les PR. Pas d'attaque personnelle, pas de condescendance, pas de gatekeeping.

---

## Questions

Pour toute question avant de contribuer, ouvrir une issue avec le tag `question`.

---

*Le Socle est un projet communautaire. Chaque contribution l'améliore pour tous ceux qui l'utilisent.*
