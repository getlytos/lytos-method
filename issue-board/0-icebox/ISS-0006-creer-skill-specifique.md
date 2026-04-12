---
id: ISS-0006
title: "Créer un skill spécifique au projet"
type: feat
priority: P2-moyenne
effort: M
domain: [méthode]
skill: documentation
status: 0-icebox
depends: [ISS-0004]
created: YYYY-MM-DD
---

# ISS-0006 — Créer un skill spécifique au projet

## Contexte

Les skills fournis par Le Socle (code-review, testing, documentation, git-workflow, code-structure, session-start) couvrent les cas génériques. Mais certains projets ont des procédures spécifiques qui méritent d'être formalisées en skill : déploiement, migration de données, gestion des traductions, etc.

## Solution proposée

Identifier un process récurrent dans le projet et le formaliser en skill dans `.socle/skills/`. Le skill doit être opérationnel immédiatement — un agent peut l'appliquer sans interprétation.

## Critère de done

- [ ] Process répétitif identifié
- [ ] Skill rédigé au format standard (titre, quand invoquer, procédure, checklist)
- [ ] Testé sur un cas réel
- [ ] Ajusté et validé

## Notes

Exemples de skills spécifiques possibles :
- `deployment.md` — procédure de déploiement du projet
- `migration.md` — comment faire une migration de données
- `i18n.md` — comment gérer les traductions
- `api-design.md` — comment concevoir un endpoint API
