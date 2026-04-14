# Skill — Testing

*This skill defines how to write tests on a project using Lytos. It covers unit tests and end-to-end tests. An agent loaded with this skill knows what to test, how to structure tests, and what coverage criteria to meet.*

---

## When to invoke this skill

- After writing a new feature
- After a fix — the test must prove the bug won't come back
- During a refactoring — existing tests must continue to pass
- During a quality audit — check overall coverage

---

## Unit tests

### Principles

- A unit test tests **one single thing**
- It is **independent** — does not depend on execution order or another test
- It is **fast** — no network calls, no database (use mocks)
- It is **deterministic** — the same input always gives the same result

### Test file structure

```
tests/
├── unit/
│   ├── [module]/
│   │   └── [module].test.*    <- depends on the project language
│   └── ...
└── e2e/
    ├── [feature].spec.*       <- end-to-end tests
    └── ...
```

Naming conventions by language:

| Language | Test file | Example |
|----------|-----------|---------|
| JavaScript/TypeScript | `module.test.js` or `module.spec.ts` | `cart.test.js` |
| Python | `test_module.py` | `test_cart.py` |
| PHP | `ModuleTest.php` | `CartTest.php` |
| Go | `module_test.go` | `cart_test.go` |
| Rust | `mod tests` in the file or `tests/` | `#[cfg(test)]` |

### Test naming

The test name describes the **expected behavior**, not the implementation.

```javascript
// ✅ Good
it('returns an empty array when no product matches the filter')
// ❌ Bad
it('test filterProducts')
```

```python
# ✅ Good
def test_returns_none_if_user_does_not_exist():
# ❌ Bad
def test_get_user():
```

```go
// ✅ Good
func TestReturnsErrorIfCartIsEmpty(t *testing.T) {
// ❌ Bad
func TestCheckout(t *testing.T) {
```

### AAA Pattern (Arrange, Act, Assert)

Every test follows this structure, regardless of language:

```python
def test_calculates_gross_price_with_tax():
    # Arrange — prepare the data
    net_price = 100
    tax_rate = 0.20

    # Act — execute the action
    gross_price = calculate_gross(net_price, tax_rate)

    # Assert — verify the result
    assert gross_price == 120
```

```javascript
it('calculates the gross price with tax', () => {
  // Arrange
  const netPrice = 100;
  const taxRate = 0.20;

  // Act
  const grossPrice = calculateGross(netPrice, taxRate);

  // Assert
  expect(grossPrice).toBe(120);
});
```

### What to test

- The **nominal case** — the main path that works
- **Edge cases** — null values, empty lists, empty strings, zero
- **Error cases** — invalid inputs, expected exceptions
- **Boundary cases** — min/max values, overflow, unexpected formats

### What NOT to test

- Internal implementation (private details)
- The framework code itself
- Trivial getters/setters with no logic
- Constants

---

## E2E tests (end-to-end)

### Principles

- An E2E test simulates a **complete user journey**
- It tests the application **end-to-end** — interface, API, database
- It is slower and more fragile than a unit test — only test critical journeys
- It verifies **visible behavior**, not implementation

### Tools by context

| Context | Common tools |
|---------|-------------|
| Web application | Playwright, Cypress, Selenium |
| REST/GraphQL API | Supertest, httpx, Postman/Newman |
| Mobile application | Detox, Appium, XCTest |
| CLI | Shell tests, subprocess |

### Example — Web application (Playwright)

```typescript
test.describe('User login', () => {
  test('a user can log in with valid credentials', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'user@example.com');
    await page.fill('[data-testid="password"]', 'motdepasse123');
    await page.click('[data-testid="submit-login"]');

    await expect(page).toHaveURL('/dashboard');
    await expect(page.locator('[data-testid="user-name"]')).toHaveText('Jean Dupont');
  });
});
```

### Example — API (Python httpx)

```python
def test_create_reservation_returns_201():
    response = client.post("/api/reservations", json={
        "date": "2026-04-15",
        "heure": "14:00",
        "nom": "Jean Dupont"
    })
    assert response.status_code == 201
    assert response.json()["nom"] == "Jean Dupont"
```

### E2E conventions

- Target elements by `data-testid` or stable identifiers — never by fragile CSS selectors
- Each test must be able to run independently
- Group tests by feature
- Wait for elements explicitly

### What to test in E2E

- Critical journeys: sign-up, login, purchase, form submission
- Journeys that involve multiple steps
- Third-party integrations visible to the user

### What NOT to test in E2E

- Unit-level edge cases — that's the job of unit tests
- Every variation of a form — test the nominal case and one error case
- Visual styling — unless critical for UX

---

## Coverage criteria

| Type | Minimum coverage | Target |
|------|-----------------|--------|
| Unit tests | 80% of public functions | 100% of critical functions (auth, payment, data) |
| E2E tests | 100% of critical journeys | All main application journeys |

### How to measure

| Language | Coverage command |
|----------|----------------|
| JavaScript | `jest --coverage` or `vitest --coverage` |
| Python | `pytest --cov` |
| PHP | `phpunit --coverage-html` |
| Go | `go test -cover` |
| Rust | `cargo tarpaulin` |

---

## Checklist before considering tests complete

- [ ] All tests pass
- [ ] E2E tests pass
- [ ] Coverage does not regress compared to the previous sprint
- [ ] New tests follow the AAA pattern
- [ ] Tests are descriptively named
- [ ] No commented-out or skipped test without justification in the issue

---

## When to update the memory

- A recurring test pattern emerges -> document it in `cortex/patterns.md`
- A project-specific test pitfall is discovered -> note it in `cortex/bugs.md`
- A decision about test strategy is made -> `cortex/architecture.md`

---

*This skill is immediately operational. An agent that loads it can write unit and E2E tests without further interpretation.*
