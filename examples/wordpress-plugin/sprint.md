# Sprint — MVP Formulaire de Réservation

*Ce fichier est l'état désiré du sprint en cours. L'orchestrateur le lit pour allouer les agents. L'humain le met à jour.*

---

## Méta

**Sprint** : #01
**Objectif** : *Livrer le formulaire de réservation fonctionnel avec confirmation email*
**Début** : 2026-03-10
**Fin prévue** : 2026-03-24
**Statut** : `en-cours`

---

## Objectif du sprint

À la fin de ce sprint, un utilisateur peut réserver un créneau via le formulaire front-end et recevoir un email de confirmation. L'admin peut voir les réservations dans le back-office WordPress.

---

## Backlog du sprint

### 🔴 P0 — Critique

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-0001](./issue-board/ISS-0001.md) | Créer la table wp_mpr_reservations | S | code-structure | — | done |
| [ISS-0002](./issue-board/ISS-0002.md) | Implémenter le CRUD des réservations | M | code-structure | ISS-0001 | in-progress |

### 🟠 P1 — Haute

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| [ISS-0003](./issue-board/ISS-0003.md) | Créer le formulaire front de réservation | M | code-structure | ISS-0001 | open |
| ISS-0004 | Connecter le formulaire au CRUD via AJAX | S | code-structure | ISS-0002, ISS-0003 | open |

### 🟡 P2 — Normale

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| ISS-0005 | Envoyer l'email de confirmation | S | code-structure | ISS-0004 | open |
| ISS-0006 | Tests unitaires du CRUD | S | testing | ISS-0002 | open |
| ISS-0007 | Test E2E du parcours complet | M | testing | ISS-0005 | open |

### 🔵 P3 — Basse

| ID | Titre | Effort | Skill | Depends | Status |
|----|-------|--------|-------|---------|--------|
| ISS-0008 | Documentation du plugin | S | documentation | ISS-0005 | open |

---

## Graph de dépendances

```
ISS-0001 ──────────────────────────────────────────►
    Table BDD                                       │
                                          ┌─────────┤
                                          ▼         ▼
                                     ISS-0002   ISS-0003
                                     CRUD       Formulaire
                                      │  │          │
                                      │  └────┬─────┘
                                      │       ▼
                                      │   ISS-0004
                                      │   Connexion AJAX
                                      │       │
                                      ▼       ▼
                                  ISS-0006  ISS-0005
                                  Tests     Email
                                  unitaires    │
                                      │       ▼
                                      │   ISS-0007
                                      │   Test E2E
                                      │       │
                                      └───┬───┘
                                          ▼
                                      ISS-0008
                                      Documentation
```

---

## Gates qualité

- [ ] Tests unitaires passent
- [ ] Tests Playwright passent
- [ ] Code review effectuée
- [ ] Documentation mise à jour
- [ ] Memory mise à jour

---

## Blocages

| Blocage | Impact | Action |
|---------|--------|--------|
| — | — | — |

---

## Notes de sprint

- Le formulaire doit être rendu via un shortcode `[mpr_reservation]`
- L'email utilise `wp_mail()` — pas de service externe
- Les créneaux sont définis manuellement par l'admin pour le MVP

---

## Retrospective

*À remplir en fin de sprint.*

**Ce qui a bien fonctionné :**

**Ce qui a mal fonctionné :**

**Ce qu'on change au prochain sprint :**

---

*Dernière mise à jour : 2026-03-12*
