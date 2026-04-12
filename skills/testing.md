# Skill — Testing

*Ce skill définit comment écrire des tests sur un projet utilisant Le Socle. Il couvre les tests unitaires et les tests end-to-end. Un agent chargé de ce skill sait quoi tester, comment structurer ses tests, et quels critères de couverture respecter.*

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
│   │   └── [module].test.*    ← selon le langage du projet
│   └── ...
└── e2e/
    ├── [feature].spec.*       ← tests end-to-end
    └── ...
```

Conventions de nommage par langage :

| Langage | Fichier de test | Exemple |
|---------|----------------|---------|
| JavaScript/TypeScript | `module.test.js` ou `module.spec.ts` | `cart.test.js` |
| Python | `test_module.py` | `test_cart.py` |
| PHP | `ModuleTest.php` | `CartTest.php` |
| Go | `module_test.go` | `cart_test.go` |
| Rust | `mod tests` dans le fichier ou `tests/` | `#[cfg(test)]` |

### Nommage des tests

Le nom d'un test décrit le **comportement attendu**, pas l'implémentation.

```javascript
// ✅ Bon
it('retourne un tableau vide quand aucun produit ne correspond au filtre')
// ❌ Mauvais
it('test filterProducts')
```

```python
# ✅ Bon
def test_retourne_none_si_utilisateur_inexistant():
# ❌ Mauvais
def test_get_user():
```

```go
// ✅ Bon
func TestRetourneErreurSiPanierVide(t *testing.T) {
// ❌ Mauvais
func TestCheckout(t *testing.T) {
```

### Pattern AAA (Arrange, Act, Assert)

Chaque test suit cette structure, quel que soit le langage :

```python
def test_calcule_prix_ttc_avec_tva():
    # Arrange — préparer les données
    prix_ht = 100
    taux_tva = 0.20

    # Act — exécuter l'action
    prix_ttc = calculer_ttc(prix_ht, taux_tva)

    # Assert — vérifier le résultat
    assert prix_ttc == 120
```

```javascript
it('calcule le prix TTC avec la TVA', () => {
  // Arrange
  const prixHT = 100;
  const tauxTVA = 0.20;

  // Act
  const prixTTC = calculerTTC(prixHT, tauxTVA);

  // Assert
  expect(prixTTC).toBe(120);
});
```

### Ce qu'il faut tester

- Le **cas nominal** — le chemin principal qui fonctionne
- Les **cas limites** — valeurs nulles, listes vides, chaînes vides, zéro
- Les **cas d'erreur** — entrées invalides, exceptions attendues
- Les **cas de bordure** — valeurs min/max, overflow, formats inattendus

### Ce qu'il ne faut PAS tester

- L'implémentation interne (les détails privés)
- Le code du framework lui-même
- Les getters/setters triviaux sans logique
- Les constantes

---

## Tests E2E (end-to-end)

### Principes

- Un test E2E simule un **parcours utilisateur complet**
- Il teste l'application **de bout en bout** — interface, API, base de données
- Il est plus lent et plus fragile qu'un test unitaire — ne tester que les parcours critiques
- Il vérifie le **comportement visible**, pas l'implémentation

### Outils selon le contexte

| Contexte | Outils courants |
|----------|----------------|
| Application web | Playwright, Cypress, Selenium |
| API REST/GraphQL | Supertest, httpx, Postman/Newman |
| Application mobile | Detox, Appium, XCTest |
| CLI | Tests shell, subprocess |

### Exemple — Application web (Playwright)

```typescript
test.describe('Connexion utilisateur', () => {
  test('un utilisateur peut se connecter avec des identifiants valides', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'user@example.com');
    await page.fill('[data-testid="password"]', 'motdepasse123');
    await page.click('[data-testid="submit-login"]');

    await expect(page).toHaveURL('/dashboard');
    await expect(page.locator('[data-testid="user-name"]')).toHaveText('Jean Dupont');
  });
});
```

### Exemple — API (Python httpx)

```python
def test_creer_reservation_retourne_201():
    response = client.post("/api/reservations", json={
        "date": "2026-04-15",
        "heure": "14:00",
        "nom": "Jean Dupont"
    })
    assert response.status_code == 201
    assert response.json()["nom"] == "Jean Dupont"
```

### Conventions E2E

- Cibler les éléments par `data-testid` ou identifiants stables — jamais par sélecteurs CSS fragiles
- Chaque test doit pouvoir tourner indépendamment
- Regrouper les tests par fonctionnalité
- Attendre les éléments explicitement

### Quoi tester en E2E

- Les parcours critiques : inscription, connexion, achat, soumission de formulaire
- Les parcours qui impliquent plusieurs étapes
- Les intégrations tierces visibles par l'utilisateur

### Quoi NE PAS tester en E2E

- Les cas limites unitaires — c'est le job des tests unitaires
- Chaque variante d'un formulaire — tester le cas nominal et un cas d'erreur
- Le style visuel — sauf si critique pour l'UX

---

## Critères de couverture

| Type | Couverture minimum | Objectif |
|------|--------------------|----------|
| Tests unitaires | 80% des fonctions publiques | 100% des fonctions critiques (auth, paiement, données) |
| Tests E2E | 100% des parcours critiques | Tous les parcours principaux de l'application |

### Comment mesurer

| Langage | Commande de couverture |
|---------|----------------------|
| JavaScript | `jest --coverage` ou `vitest --coverage` |
| Python | `pytest --cov` |
| PHP | `phpunit --coverage-html` |
| Go | `go test -cover` |
| Rust | `cargo tarpaulin` |

---

## Checklist avant de considérer les tests terminés

- [ ] Tous les tests passent
- [ ] Les tests E2E passent
- [ ] La couverture ne régresse pas par rapport au sprint précédent
- [ ] Les nouveaux tests suivent le pattern AAA
- [ ] Les tests sont nommés de manière descriptive
- [ ] Pas de test commenté ou skip sans justification dans l'issue

---

## Quand mettre à jour la memory

- Un pattern de test récurrent émerge → le documenter dans `cortex/patterns.md`
- Un piège de test spécifique au projet est découvert → le noter dans `cortex/bugs.md`
- Une décision sur la stratégie de test est prise → `cortex/architecture.md`

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge peut écrire des tests unitaires et E2E sans interprétation supplémentaire.*
