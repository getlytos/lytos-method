# Manifest — BookShelf API

*Ce manifest est la constitution du projet BookShelf API. Il est lu par les agents au démarrage de chaque session de travail.*

---

## Identité

| Champ | Valeur |
|-------|--------|
| Nom | BookShelf API |
| Description | API REST de gestion de bibliothèque personnelle |
| Responsable | Marie Dupont |
| Repo | github.com/exemple/bookshelf-api |

---

## Pourquoi ce projet existe

Les applications de suivi de lecture existantes sont soit trop complexes (Goodreads), soit trop simplistes (une feuille Excel). BookShelf API est le backend d'une application qui permet de gérer sa bibliothèque personnelle de façon simple, avec une API propre que n'importe quel frontend peut consommer.

---

## Ce que ce projet est

- Une API REST qui gère des livres, des collections et des notes de lecture
- Un backend consommable par n'importe quel client (web, mobile, CLI)
- Un projet conçu pour être hébergé facilement (Docker, Railway, Fly.io)

## Ce que ce projet n'est pas

- Pas un réseau social de lecture
- Pas un moteur de recommandation
- Pas un scraper de catalogues éditeurs

---

## Stack technique

| Composant | Technologie |
|-----------|-------------|
| Langage | Python 3.12 |
| Framework | FastAPI |
| ORM | SQLAlchemy 2.0 |
| Base de données | PostgreSQL 16 |
| Tests | Pytest + httpx |
| CI/CD | GitHub Actions |
| Conteneurisation | Docker |

---

## Vocabulaire du projet

| Terme | Définition |
|-------|------------|
| Book | Un livre avec titre, auteur, ISBN, et métadonnées |
| Collection | Un regroupement thématique de livres (ex: "Science-fiction", "À lire cet été") |
| Reading | Une session de lecture : livre + dates + progression + note |
| Shelf | L'ensemble de la bibliothèque d'un utilisateur |

---

## Ce que ce projet n'est pas

- Un réseau social — pas de fonctionnalité de partage ou de suivi d'amis
- Un moteur de recommandation — pas d'algorithme de suggestion
- Un outil d'import — pas de scraping de catalogues éditeurs

---

## Principes de développement

*Quand un agent hésite entre deux approches, il consulte ces principes pour trancher.*

- **API-first plutôt que UI-first** — on conçoit les endpoints avant l'interface. Le contrat API est la source de vérité.
- **Explicite plutôt que magique** — pas de comportement implicite. Si une route crée un effet de bord, c'est documenté dans la docstring.
- **Idempotent par défaut** — les requêtes PUT et DELETE sont idempotentes. Deux appels identiques produisent le même résultat.
- **Fail fast** — une erreur de validation retourne immédiatement un 422 avec un message clair, plutôt que de tenter de "deviner" ce que l'utilisateur voulait dire.

---

## Modèles IA par complexité

| Complexité | Usage | Modèle |
|------------|-------|--------|
| `light` | Documentation, formatage, boilerplate | Claude Haiku |
| `standard` | Développement courant, code review, tests | Claude Sonnet |
| `heavy` | Architecture, requêtes SQL complexes, sécurité auth | Claude Opus |

---

## Liens importants

| Ressource | URL |
|-----------|-----|
| Repo principal | github.com/exemple/bookshelf-api |
| Documentation API | /docs (Swagger auto-généré par FastAPI) |
| Staging | staging.bookshelf.example.com |
| Production | api.bookshelf.example.com |

---

*Dernière mise à jour : 2026-04-10*
