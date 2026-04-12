# Skill — Code Structure

*Ce skill définit les règles de structure de fichiers, de nommage et d'organisation du code sur un projet utilisant Le Socle. Un agent chargé de ce skill produit du code propre, cohérent et maintenable.*

---

## Quand invoquer ce skill

- Lors de l'écriture de tout nouveau code
- Lors d'un refactoring
- En complément du skill code-review pour vérifier la structure
- Lors de la création d'un nouveau module ou composant

---

## Règle fondamentale — 300 lignes max par fichier

Un fichier ne doit jamais dépasser 300 lignes de code (hors commentaires et lignes vides).

**Pourquoi** : un fichier trop long est un signe de responsabilités multiples. Il est plus difficile à lire, à tester et à maintenir.

**Quand un fichier dépasse 300 lignes** :
1. Identifier les responsabilités distinctes dans le fichier
2. Extraire chaque responsabilité dans son propre fichier
3. Garder le fichier original comme point d'entrée si nécessaire
4. Mettre à jour les imports et dépendances

---

## Séparation des responsabilités

### Principe

Chaque fichier, chaque fonction, chaque classe a **une seule raison de changer**.

### En pratique

| Mauvais | Bon |
|---------|-----|
| Un fichier qui gère la route, la validation, la logique métier et la réponse | Route → Controller → Service → Repository |
| Une fonction qui calcule, formate et envoie | `calculer()` + `formater()` + `envoyer()` |
| Un composant React qui fetch, traite et affiche | Hook `useProduits()` + Composant `ListeProduits` |

### Structure type d'un module

```
module/
├── index.js          ← point d'entrée, exports publics
├── service.js        ← logique métier
├── repository.js     ← accès aux données
├── validator.js      ← validation des entrées
├── types.js          ← types/interfaces (TS)
└── __tests__/
    ├── service.test.js
    └── validator.test.js
```

---

## Nommage

### Fichiers

Suivre la convention du langage et de l'écosystème du projet :

| Langage | Convention | Exemple |
|---------|-----------|---------|
| Python | snake_case | `product_service.py` |
| JavaScript/TypeScript | kebab-case | `product-service.js` |
| PHP (classes) | PascalCase | `ProductService.php` |
| Go | snake_case | `product_service.go` |
| Rust | snake_case | `product_service.rs` |
| CSS/SCSS | kebab-case | `product-card.scss` |

### Variables

Suivre les conventions du langage. Les principes universels :

| Principe | Exemple |
|----------|---------|
| Constantes en UPPER_SNAKE_CASE | `MAX_RETRY_COUNT`, `API_BASE_URL` |
| Booléens : préfixe is/has/can/should | `is_active`, `hasPermission` |
| Listes/tableaux : pluriel | `produits`, `users` |
| Élément unique : singulier | `produit`, `user` |
| Pas d'abréviation obscure | `utilisateur` pas `usr`, `response` pas `resp` |

### Fonctions

| Règle | Exemple ✅ | Contre-exemple ❌ |
|-------|-----------|-------------------|
| Verbe + nom | `calculerTTC()` | `ttc()` |
| Décrire l'action | `envoyerEmailConfirmation()` | `email()` |
| Pas d'abréviation | `obtenirUtilisateurParId()` | `getUsrById()` |
| Booléen retourné → question | `estActif()`, `peutCommander()` | `actif()`, `commande()` |

### Classes

| Règle | Exemple |
|-------|---------|
| PascalCase | `ProductService` |
| Nom = responsabilité | `InvoiceGenerator`, pas `InvoiceManager` |
| Un suffixe clair | `Controller`, `Service`, `Repository`, `Validator` |

---

## Organisation des imports

Les imports sont organisés par catégorie, séparés par une ligne vide. L'ordre est le même quel que soit le langage :

1. **Bibliothèque standard** (built-in)
2. **Dépendances externes** (packages tiers)
3. **Modules internes** (chemins absolus dans le projet)
4. **Modules relatifs** (même dossier/module)

```python
# 1. Standard
import os
from pathlib import Path

# 2. Externe
from fastapi import FastAPI
from pydantic import BaseModel

# 3. Interne
from app.services.product import ProductService

# 4. Relatif
from .helpers import format_price
```

```javascript
// 1. Standard
import path from 'path';

// 2. Externe
import express from 'express';
import { z } from 'zod';

// 3. Interne
import { ProductService } from '@/services/product';

// 4. Relatif
import { formatPrice } from './helpers';
```

---

## Structure des fonctions

### Longueur

- Une fonction fait idéalement **moins de 30 lignes**
- Si elle dépasse 50 lignes, envisager un découpage

### Nesting

- Maximum **3 niveaux** d'imbrication
- Utiliser le **early return** pour réduire le nesting

```python
# ✅ Bon — early return
def traiter_commande(commande):
    if not commande.est_valide():
        raise ValueError("Commande invalide")

    if not commande.client.peut_commander():
        raise PermissionError("Client non autorisé")

    return executer_commande(commande)

# ❌ Mauvais — nesting profond
def traiter_commande(commande):
    if commande.est_valide():
        if commande.client.peut_commander():
            return executer_commande(commande)
        else:
            raise PermissionError("Client non autorisé")
    else:
        raise ValueError("Commande invalide")
```

Le principe est identique dans tous les langages : sortir tôt des cas d'erreur pour garder le chemin principal au niveau d'indentation le plus bas.

### Paramètres

- Maximum **4 paramètres** par fonction
- Au-delà, regrouper dans un objet, un dict, un struct ou un DTO

```python
# ✅ Bon — objet de configuration
def creer_utilisateur(config: UserConfig):

# ❌ Mauvais — trop de paramètres
def creer_utilisateur(nom, email, role, departement, date_debut, manager):
```

---

## Valeurs en dur — interdit

Aucune valeur magique dans le code. Tout doit être nommé.

```python
# ✅ Bon
TVA_FRANCE = 0.20
prix_ttc = prix_ht * (1 + TVA_FRANCE)

# ❌ Mauvais
prix_ttc = prix_ht * 1.20
```

```javascript
// ✅ Bon
const MAX_RETRIES = 3;
// ❌ Mauvais
if (attempts > 3) {
```

Pour le CSS, même principe — utiliser des variables, pas des valeurs en dur :

```css
/* ✅ Bon */
color: var(--color-primary);
/* ❌ Mauvais */
color: #3B82F6;
```

---

## Checklist avant de considérer le code structuré

- [ ] Aucun fichier ne dépasse 300 lignes
- [ ] Chaque fichier a une seule responsabilité
- [ ] Les fonctions font moins de 30 lignes (50 max)
- [ ] Le nesting ne dépasse pas 3 niveaux
- [ ] Les noms sont explicites et suivent les conventions
- [ ] Les imports sont organisés par catégorie
- [ ] Aucune valeur en dur — tout est nommé dans des constantes ou variables
- [ ] Les fonctions ont 4 paramètres max

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge produit du code structuré, lisible et maintenable sans interprétation supplémentaire.*
