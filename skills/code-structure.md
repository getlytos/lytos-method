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

| Langage | Convention | Exemple |
|---------|-----------|---------|
| PHP (classes) | PascalCase | `ProductService.php` |
| PHP (fonctions) | kebab-case | `format-helpers.php` |
| JS/TS | kebab-case | `product-service.js` |
| CSS/SCSS | kebab-case | `product-card.scss` |
| Tests | suffixe `.test` ou `.spec` | `product-service.test.js` |

### Variables

| Type | Convention | Exemple |
|------|-----------|---------|
| Variables locales | camelCase | `$prixTotal`, `const prixTotal` |
| Constantes | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT`, `API_BASE_URL` |
| Booléens | préfixe is/has/can/should | `$isActive`, `hasPermission` |
| Tableaux/listes | pluriel | `$produits`, `const utilisateurs` |
| Élément unique | singulier | `$produit`, `const utilisateur` |

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

Les imports sont organisés dans cet ordre, séparés par une ligne vide :

```javascript
// 1. Modules natifs / built-in
import path from 'path';
import fs from 'fs';

// 2. Dépendances externes (node_modules)
import express from 'express';
import { z } from 'zod';

// 3. Modules internes — chemins absolus
import { authMiddleware } from '@/middlewares/auth';
import { ProductService } from '@/services/product';

// 4. Modules relatifs — même module
import { formatPrice } from './helpers';
import { PRODUCT_STATUS } from './constants';
```

```php
// 1. Namespace du framework
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

// 2. Dépendances externes
use Stripe\Stripe;

// 3. Namespace du projet
use App\Services\ProductService;
use App\Models\Product;
```

---

## Structure des fonctions

### Longueur

- Une fonction fait idéalement **moins de 30 lignes**
- Si elle dépasse 50 lignes, envisager un découpage

### Nesting

- Maximum **3 niveaux** d'imbrication
- Utiliser le **early return** pour réduire le nesting

```php
// ✅ Bon — early return
function traiterCommande($commande) {
    if (!$commande->estValide()) {
        return new Erreur('Commande invalide');
    }

    if (!$commande->client->peutCommander()) {
        return new Erreur('Client non autorisé');
    }

    return $this->executerCommande($commande);
}

// ❌ Mauvais — nesting profond
function traiterCommande($commande) {
    if ($commande->estValide()) {
        if ($commande->client->peutCommander()) {
            return $this->executerCommande($commande);
        } else {
            return new Erreur('Client non autorisé');
        }
    } else {
        return new Erreur('Commande invalide');
    }
}
```

### Paramètres

- Maximum **4 paramètres** par fonction
- Au-delà, regrouper dans un objet ou un DTO

```javascript
// ✅ Bon — objet de configuration
function creerUtilisateur({ nom, email, role, departement }) {

// ❌ Mauvais — trop de paramètres
function creerUtilisateur(nom, email, role, departement, dateDebut, manager) {
```

---

## Valeurs en dur — interdit

Aucune valeur magique dans le code. Tout doit être nommé.

```javascript
// ✅ Bon
const TVA_FRANCE = 0.20;
const prixTTC = prixHT * (1 + TVA_FRANCE);

// ❌ Mauvais
const prixTTC = prixHT * 1.20;
```

```css
/* ✅ Bon */
color: var(--color-primary);
margin: var(--spacing-md);

/* ❌ Mauvais */
color: #3B82F6;
margin: 16px;
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
