# Rules

*Ce dossier contient les critères de qualité du projet. Les règles définissent ce que "bien fait" signifie — elles sont lues par les agents avant chaque tâche.*

---

## Fonctionnement

Les règles sont des fichiers markdown dans ce dossier. Elles sont chargées par les agents au même titre que les skills, mais avec un rôle différent :

- **Skills** = comment faire (procédures)
- **Rules** = quoi respecter (critères)

Un agent qui fait une code review charge le skill `code-review` **et** les rules du projet. Le skill lui dit comment procéder, les rules lui disent quoi vérifier.

---

## Fichiers fournis

| Fichier | Contenu |
|---------|---------|
| `default-rules.md` | Règles universelles applicables à tout projet Le Socle |

---

## Créer ses propres rules

Pour ajouter des règles spécifiques à votre projet, créez un nouveau fichier dans ce dossier.

### Format

```markdown
# Rules — [Nom du domaine]

*Description courte de ce que couvrent ces règles.*

---

## [Catégorie]

| Règle | Détail |
|-------|--------|
| Nom de la règle | Ce qui est attendu |

---
```

### Exemples de rules spécifiques

**`api-rules.md`** — pour une API REST :
```markdown
| Règle | Détail |
|-------|--------|
| Codes HTTP corrects | 201 pour création, 204 pour suppression, pas 200 partout |
| Pagination obligatoire | Tout endpoint qui liste des ressources est paginé |
| Versioning | Toutes les routes commencent par /api/v1/ |
```

**`frontend-rules.md`** — pour une app React/Next.js :
```markdown
| Règle | Détail |
|-------|--------|
| Composants < 150 lignes | Au-delà, découper en sous-composants |
| Server Components par défaut | `'use client'` uniquement quand nécessaire |
| Accessibilité | Tout composant interactif navigable au clavier + ARIA |
```

### Principes pour écrire de bonnes rules

1. **Vérifiables** — une règle doit pouvoir être vérifiée par un agent de façon binaire (respectée / pas respectée)
2. **Spécifiques** — "écrire du bon code" n'est pas une règle. "Fichiers < 300 lignes" en est une
3. **Justifiées** — chaque règle a une raison d'être. Si on ne peut pas l'expliquer, elle ne sert à rien
4. **Peu nombreuses** — mieux vaut 10 règles appliquées que 50 règles ignorées

---

## Hiérarchie

Les règles se cumulent :

1. `default-rules.md` — toujours actives
2. Fichiers spécifiques au projet — s'ajoutent par-dessus, ne remplacent pas

En cas de conflit, les règles spécifiques au projet priment sur les règles par défaut.

---

*Les rules sont un des quatre piliers du Socle. Elles garantissent un niveau de qualité constant, quel que soit l'agent qui travaille.*
