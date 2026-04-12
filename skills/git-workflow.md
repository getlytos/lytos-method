# Skill — Git Workflow

*Ce skill définit les conventions Git à suivre sur un projet utilisant Le Socle. Il couvre le nommage des branches, le format des commits, le workflow de merge et les règles de collaboration. Un agent chargé de ce skill applique ces conventions sans écart.*

---

## Quand invoquer ce skill

- À chaque création de branche
- À chaque commit
- Lors de l'ouverture d'une PR
- En cas de conflit ou de question sur le workflow

---

## Convention de nommage des branches

### Format

```
type/ISS-XXXX-slug-descriptif
```

### Types de branches

| Type | Usage | Exemple |
|------|-------|---------|
| `feat` | Nouvelle fonctionnalité | `feat/ISS-0012-ajout-panier` |
| `fix` | Correction de bug | `fix/ISS-0034-erreur-connexion` |
| `refactor` | Refactoring sans changement fonctionnel | `refactor/ISS-0045-extraction-service-auth` |
| `chore` | Tâche technique (config, deps, CI) | `chore/ISS-0050-mise-a-jour-dependencies` |
| `docs` | Documentation uniquement | `docs/ISS-0022-readme-module-paiement` |
| `test` | Ajout ou correction de tests | `test/ISS-0028-tests-unitaires-calcul-tva` |

### Règles

- Toujours lier à une issue (ISS-XXXX)
- Le slug est en kebab-case, en français ou anglais selon le projet
- Pas de branche sans issue — si le travail n'est pas dans une issue, créer l'issue d'abord
- Pas de branches longues — une branche = une issue = un périmètre défini

---

## Format des commits

### Format

```
type(scope): message court

Corps optionnel — explication du pourquoi si nécessaire.

Refs: ISS-XXXX
```

### Exemples

```
feat(panier): ajouter le calcul de TVA par pays

Le taux de TVA est maintenant déterminé dynamiquement selon
le pays de livraison au lieu d'utiliser un taux fixe.

Refs: ISS-0012
```

```
fix(auth): corriger la redirection après connexion OAuth

Le callback OAuth renvoyait vers /home au lieu de la page
d'origine stockée en session.

Refs: ISS-0034
```

```
chore(deps): mettre à jour Laravel 11.x vers 11.5

Refs: ISS-0050
```

### Types de commits

| Type | Description |
|------|-------------|
| `feat` | Nouvelle fonctionnalité visible par l'utilisateur |
| `fix` | Correction de bug |
| `refactor` | Changement de code sans modification de comportement |
| `chore` | Tâche technique sans impact fonctionnel |
| `docs` | Modification de documentation uniquement |
| `test` | Ajout ou modification de tests |
| `style` | Formatage, espaces, points-virgules (pas de changement logique) |
| `perf` | Amélioration de performance |

### Règles des commits

- Le message court fait **max 72 caractères**
- Le message est en français ou anglais — cohérent avec le projet
- Le verbe est à l'**infinitif** en français ("ajouter", "corriger") ou impératif en anglais ("add", "fix")
- Un commit = un changement logique. Pas de commits fourre-tout
- Pas de `WIP` ou `temp` dans l'historique final (squash avant merge si nécessaire)
- Toujours référencer l'issue avec `Refs: ISS-XXXX`

---

## Workflow

### Le cycle standard

Le dossier de l'issue représente son statut. Déplacer le fichier `.md` à chaque changement d'étape.

```
1. Créer l'issue           →  issue-board/0-icebox/ISS-XXXX-titre.md
2. Prioriser               →  déplacer vers 1-backlog/
3. Planifier dans le sprint →  déplacer vers 2-sprint/
4. Démarrer le travail     →  créer la branche type/ISS-XXXX-slug
                              déplacer vers 3-in-progress/
                              mettre à jour BOARD.md
5. Développer              →  commits atomiques, bien nommés
6. Pousser                 →  git push -u origin type/ISS-XXXX-slug
7. Ouvrir une PR           →  vers la branche dev (ou main selon le projet)
                              déplacer vers 4-review/
                              mettre à jour BOARD.md
8. Code review             →  via le skill code-review
9. Corrections si besoin   →  commits supplémentaires sur la branche
10. Merge                  →  squash & merge, supprimer la branche
                              déplacer vers 5-done/
                              mettre à jour BOARD.md
11. Mettre à jour la memory → si apprentissage
```

> **Règle** : le fichier .md DOIT être déplacé à chaque changement de statut.
> Le BOARD.md DOIT être mis à jour à chaque déplacement.

### Branches principales

| Branche | Rôle | Qui merge |
|---------|------|-----------|
| `main` | Production — toujours stable | L'humain uniquement |
| `dev` | Intégration — PR cible par défaut | Après review approuvée |
| `type/ISS-XXXX-*` | Branche de travail — éphémère | L'auteur de la PR |

### Règles de merge

- **Jamais** de push direct sur `main` ou `dev`
- Toute modification passe par une PR
- Une PR doit avoir au moins une review (agent ou humain)
- Les conflits se résolvent sur la branche de travail, pas sur `dev`
- Après merge, la branche est supprimée

---

## Pull Requests

### Titre de PR

```
[ISS-XXXX] Type: Description courte
```

Exemples :
- `[ISS-0012] feat: Ajout du calcul de TVA par pays`
- `[ISS-0034] fix: Correction redirection OAuth`

### Corps de PR

```markdown
## Contexte
Pourquoi cette PR existe — lien vers l'issue.

## Changements
- Liste des modifications principales
- Pas chaque ligne changée — les points importants

## Tests
- Comment vérifier que ça fonctionne
- Tests ajoutés ou modifiés

## Captures d'écran
(si changement visuel)
```

### Checklist PR

- [ ] Les tests passent
- [ ] Le code respecte les rules du projet
- [ ] La documentation est à jour
- [ ] L'issue est liée
- [ ] La branche est à jour avec `dev`

---

## Gestion des conflits

1. Se placer sur la branche de travail
2. Récupérer les dernières modifications de `dev` : `git rebase dev` ou `git merge dev`
3. Résoudre les conflits fichier par fichier
4. Vérifier que les tests passent après résolution
5. Pousser la branche mise à jour

**Ne jamais** résoudre un conflit en écrasant aveuglément les changements de l'autre branche.

---

## Checklist avant de considérer le workflow terminé

- [ ] La branche suit la convention de nommage
- [ ] Les commits suivent le format `type(scope): message`
- [ ] Chaque commit référence l'issue
- [ ] La PR est ouverte avec titre et corps corrects
- [ ] La review est demandée

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge applique les conventions Git du projet sans interprétation supplémentaire.*
