# Skill — Testing

*Ce skill définit comment écrire des tests sur un projet utilisant Le Socle. Il couvre les tests unitaires et les tests end-to-end (Playwright). Un agent chargé de ce skill sait quoi tester, comment structurer ses tests, et quels critères de couverture respecter.*

---

## Quand invoquer ce skill

- Après l'écriture d'une nouvelle fonctionnalité
- Après un fix — le test doit prouver que le bug ne reviendra pas
- Lors d'un refactoring — les tests existants doivent continuer à passer
- En audit qualité — vérifier la couverture globale

---

## Tests unitaires

### Principes

- Un test unitaire teste **une seule chose**
- Il est **indépendant** — ne dépend pas de l'ordre d'exécution ni d'un autre test
- Il est **rapide** — pas d'appel réseau, pas de base de données (utiliser des mocks)
- Il est **déterministe** — le même input donne toujours le même résultat

### Structure d'un fichier de test

```
tests/
├── unit/
│   ├── [module]/
│   │   ├── [Fonction]Test.php      ← PHP
│   │   └── [fonction].test.js      ← JS
│   └── ...
└── e2e/
    ├── [feature].spec.ts           ← Playwright
    └── ...
```

### Nommage

- **PHP** : `NomDeLaClasseTest.php` → `class NomDeLaClasseTest extends TestCase`
- **JS/TS** : `nom-du-module.test.js` ou `nom-du-module.spec.ts`
- **Fonctions de test** : décrire le comportement attendu, pas l'implémentation

```php
// ✅ Bon
public function test_retourne_null_si_utilisateur_inexistant()

// ❌ Mauvais
public function test_getUserById()
```

```javascript
// ✅ Bon
it('retourne un tableau vide quand aucun produit ne correspond au filtre')

// ❌ Mauvais
it('test filterProducts')
```

### Pattern AAA (Arrange, Act, Assert)

Chaque test suit cette structure :

```javascript
it('calcule le prix TTC avec la TVA française', () => {
  // Arrange — préparer les données
  const prixHT = 100;
  const tauxTVA = 0.20;

  // Act — exécuter l'action
  const prixTTC = calculerTTC(prixHT, tauxTVA);

  // Assert — vérifier le résultat
  expect(prixTTC).toBe(120);
});
```

### Ce qu'il faut tester

- Le **cas nominal** — le chemin principal qui fonctionne
- Les **cas limites** — valeurs nulles, tableaux vides, chaînes vides, zéro
- Les **cas d'erreur** — entrées invalides, exceptions attendues
- Les **cas de bordure** — valeurs min/max, overflow, formats inattendus

### Ce qu'il ne faut PAS tester

- L'implémentation interne (les détails privés)
- Le code du framework lui-même
- Les getters/setters triviaux sans logique
- Les constantes

---

## Tests E2E — Playwright

### Principes

- Un test E2E simule un **parcours utilisateur complet**
- Il teste l'application **de bout en bout** — front, API, base de données
- Il est plus lent et plus fragile qu'un test unitaire — ne tester que les parcours critiques
- Il vérifie le **comportement visible**, pas l'implémentation

### Structure

```typescript
// tests/e2e/[feature].spec.ts

import { test, expect } from '@playwright/test';

test.describe('Connexion utilisateur', () => {
  test('un utilisateur peut se connecter avec des identifiants valides', async ({ page }) => {
    // Navigation
    await page.goto('/login');

    // Actions utilisateur
    await page.fill('[data-testid="email"]', 'user@example.com');
    await page.fill('[data-testid="password"]', 'motdepasse123');
    await page.click('[data-testid="submit-login"]');

    // Vérification
    await expect(page).toHaveURL('/dashboard');
    await expect(page.locator('[data-testid="user-name"]')).toHaveText('Jean Dupont');
  });

  test('affiche une erreur avec des identifiants invalides', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'wrong@example.com');
    await page.fill('[data-testid="password"]', 'mauvais');
    await page.click('[data-testid="submit-login"]');

    await expect(page.locator('[data-testid="error-message"]')).toBeVisible();
    await expect(page).toHaveURL('/login');
  });
});
```

### Conventions Playwright

- Toujours utiliser `data-testid` pour cibler les éléments — jamais de sélecteurs CSS fragiles
- Chaque test doit pouvoir tourner indépendamment (pas de dépendance entre tests)
- Utiliser `test.describe` pour regrouper les tests par fonctionnalité
- Nommer les fichiers : `[feature].spec.ts`
- Attendre les éléments explicitement (`waitForSelector`, `expect(...).toBeVisible()`)

### Quoi tester en E2E

- Les parcours critiques : inscription, connexion, achat, soumission de formulaire
- Les parcours qui impliquent plusieurs pages ou étapes
- Les intégrations tierces visibles par l'utilisateur

### Quoi NE PAS tester en E2E

- Les cas limites unitaires — c'est le job des tests unitaires
- Chaque variante d'un formulaire — tester le cas nominal et un cas d'erreur
- Les styles CSS — sauf si critique pour l'UX

---

## Critères de couverture

| Type | Couverture minimum | Objectif |
|------|--------------------|----------|
| Tests unitaires | 80% des fonctions publiques | 100% des fonctions critiques (auth, paiement, données) |
| Tests E2E | 100% des parcours critiques | Tous les parcours principaux de l'application |

### Comment mesurer

- **PHP** : `phpunit --coverage-html`
- **JS** : `jest --coverage` ou `vitest --coverage`
- **Playwright** : vérifier que chaque parcours critique a un `.spec.ts`

---

## Checklist avant de considérer les tests terminés

- [ ] Tous les tests passent (`npm test` / `phpunit`)
- [ ] Les tests E2E passent (`npx playwright test`)
- [ ] La couverture ne régresse pas par rapport au sprint précédent
- [ ] Les nouveaux tests suivent le pattern AAA
- [ ] Les tests sont nommés de manière descriptive
- [ ] Pas de test commenté ou skip sans justification dans l'issue

---

## Quand mettre à jour la memory

- Un pattern de test récurrent émerge → le documenter
- Un piège de test spécifique au projet est découvert → le noter
- Une décision sur la stratégie de test est prise → la garder

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge peut écrire des tests unitaires et E2E sans interprétation supplémentaire.*
