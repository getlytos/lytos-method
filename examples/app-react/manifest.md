# Manifest — TaskFlow

*Ce manifest est la constitution du projet TaskFlow. Il est lu par les agents au démarrage de chaque session de travail.*

---

## Identité

| Champ | Valeur |
|-------|--------|
| Nom | TaskFlow |
| Description | Application web de gestion de tâches en équipe |
| Responsable | Alex Martin |
| Repo | github.com/exemple/taskflow |

---

## Pourquoi ce projet existe

Les outils de gestion de tâches existants sont soit trop lourds (Jira), soit trop basiques (Todoist pour les équipes). TaskFlow vise le juste milieu : un Kanban simple, rapide, avec juste assez de fonctionnalités pour une équipe de 2 à 10 personnes.

---

## Ce que ce projet est

- Une application web de gestion de tâches avec vue Kanban
- Un outil collaboratif temps réel (drag & drop, mise à jour live)
- Une app optimisée pour la vitesse (SSR, cache, optimistic updates)

## Ce que ce projet n'est pas

- Pas un outil de gestion de projet complet (pas de Gantt, pas de resource planning)
- Pas un outil pour les grandes équipes (optimisé pour 2-10 personnes)
- Pas une app mobile native (responsive web uniquement)

---

## Stack technique

| Composant | Technologie |
|-----------|-------------|
| Langage | TypeScript |
| Framework | Next.js 14 (App Router) |
| Style | Tailwind CSS |
| State management | Zustand |
| Tests unitaires | Vitest |
| Tests E2E | Playwright |
| CI/CD | GitHub Actions + Vercel |

---

## Vocabulaire du projet

| Terme | Définition |
|-------|------------|
| Board | Un tableau Kanban avec des colonnes (To Do, In Progress, Done) |
| Card | Une tâche individuelle avec titre, description, assignee, labels |
| Column | Une colonne du board, représentant un statut |
| Workspace | L'espace de travail d'une équipe, contient plusieurs boards |

---

## Principes de développement

*Quand un agent hésite entre deux approches, il consulte ces principes pour trancher.*

- **Composants petits plutôt que monolithiques** — un composant fait une seule chose. Si un fichier dépasse 150 lignes, le découper.
- **Server Components par défaut** — n'utiliser `'use client'` que quand c'est nécessaire (interactions, état local, hooks navigateur).
- **Optimistic updates plutôt qu'attente serveur** — l'UI réagit immédiatement, puis synchronise. L'utilisateur ne doit jamais "attendre".
- **Accessibilité non négociable** — tout composant interactif doit être navigable au clavier et avoir les attributs ARIA appropriés.

---

## Modèles IA par complexité

| Complexité | Usage | Modèle |
|------------|-------|--------|
| `light` | Documentation, CSS, renommage, boilerplate | GPT-4o-mini |
| `standard` | Composants React, hooks, tests | GPT-4o |
| `heavy` | Architecture state management, optimisation rendering, SSR | Claude Opus |

---

## Liens importants

| Ressource | URL |
|-----------|-----|
| Repo principal | github.com/exemple/taskflow |
| Design (Figma) | figma.com/exemple/taskflow |
| Staging | staging.taskflow.example.com |
| Production | taskflow.example.com |

---

*Dernière mise à jour : 2026-04-08*
