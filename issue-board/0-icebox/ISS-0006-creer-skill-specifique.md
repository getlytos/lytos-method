# ISS-0006 — Créer un skill spécifique au projet

**Type** : `feat`
**Priorité** : `P2-moyenne`
**Effort** : `M`
**Domaine** : méthode
**Agent-skill** : documentation
**Status** : `0-icebox`
**Créé** : YYYY-MM-DD
**Modifié** : YYYY-MM-DD
**Depends** : ISS-0004

---

## Contexte

Les skills fournis par Le Socle (code-review, testing, documentation, git-workflow, code-structure) couvrent les cas génériques. Mais certains projets ont des procédures spécifiques qui méritent d'être formalisées en skill : déploiement, migration de données, gestion des traductions, etc.

## Solution proposée

Identifier un process récurrent dans le projet et le formaliser en skill dans `.socle/skills/`. Le skill doit être opérationnel immédiatement — un agent peut l'appliquer sans interprétation.

## Checklist

- [ ] Identifier un process répétitif qui pourrait bénéficier d'un skill
- [ ] Rédiger le skill au format standard (titre, quand invoquer, procédure, checklist)
- [ ] Tester le skill sur un cas réel
- [ ] Ajuster et valider

## Notes

Exemples de skills spécifiques possibles :
- `deployment.md` — procédure de déploiement du projet
- `migration.md` — comment faire une migration de données
- `i18n.md` — comment gérer les traductions
- `api-design.md` — comment concevoir un endpoint API

Voir les skills existants dans `.socle/skills/` pour le format.

---

*Dernière mise à jour : YYYY-MM-DD*
