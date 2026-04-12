# Sprint — [Nom du sprint]

*Ce fichier est l'état désiré du sprint en cours. L'orchestrateur le lit pour allouer les agents. L'humain le met à jour.*

---

## Méta

**Sprint** : #XX
**Objectif** : *Une phrase qui dit ce que ce sprint doit accomplir*
**Début** : YYYY-MM-DD
**Fin prévue** : YYYY-MM-DD
**Statut** : `en-cours` | `terminé` | `bloqué`

---

## Objectif du sprint

*Qu'est-ce qui doit être livrable à la fin de ce sprint ? Pas une liste de tâches — un résultat.*

---

## Backlog du sprint

### 🔴 P0 — Critique

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-XXXX](./issue-board/ISS-XXXX.md) | | XS/S/M/L/XL | | | open |

### 🟠 P1 — Haute

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-XXXX](./issue-board/ISS-XXXX.md) | | | | | open |

### 🟡 P2 — Normale

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-XXXX](./issue-board/ISS-XXXX.md) | | | | | open |

### 🔵 P3 — Basse

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-XXXX](./issue-board/ISS-XXXX.md) | | | | | open |

---

## Graph de dépendances

*Les tâches sans dépendances peuvent partir en parallèle. Les autres attendent.*

```
ISS-XXXX ──────────────────────────► ISS-XXXX
                                          │
ISS-XXXX ──────────────────────────►     ▼
                                     ISS-XXXX (gate)
ISS-XXXX ──► ISS-XXXX ──────────►       │
                                         ▼
                                     ISS-XXXX (livrable)
```

---

## Gates qualité

*Les vérifications obligatoires avant de considérer le sprint terminé.*

- [ ] Tests unitaires passent
- [ ] Tests Playwright passent
- [ ] Code review effectuée
- [ ] Documentation mise à jour
- [ ] Memory mise à jour

---

## Blocages

*Ce qui empêche d'avancer. À résoudre en priorité.*

| Blocage | Impact | Action |
|---------|--------|--------|
| | | |

---

## Notes de sprint

*Décisions prises, contexte important, changements de direction.*

---

## Retrospective

*À remplir en fin de sprint.*

**Ce qui a bien fonctionné :**

**Ce qui a mal fonctionné :**

**Ce qu'on change au prochain sprint :**

---

*Dernière mise à jour : YYYY-MM-DD*
