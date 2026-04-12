# Skill — Deployment

*Ce skill définit comment préparer, exécuter et valider un déploiement. Un agent chargé de ce skill sait quoi vérifier avant de déployer, comment le faire, et comment confirmer que tout fonctionne.*

---

## Quand invoquer ce skill

- Avant chaque mise en production
- Lors de la mise en place d'un pipeline CI/CD
- Après un fix critique qui doit partir rapidement
- Pour documenter la procédure de déploiement d'un nouveau projet

---

## Procédure

### 1. Pré-déploiement — Checklist

Avant tout déploiement, vérifier chaque point :

#### Code

- [ ] Tous les tests passent (unitaires + E2E)
- [ ] La branche est à jour avec la branche principale
- [ ] Pas de conflit de merge
- [ ] Pas de `TODO` ou de code temporaire oublié
- [ ] Pas de secret en dur (clés API, mots de passe, tokens)

#### Dépendances

- [ ] Les dépendances sont verrouillées (lock file à jour)
- [ ] Pas de dépendance ajoutée sans justification dans l'issue
- [ ] Les versions de production sont cohérentes avec le développement

#### Configuration

- [ ] Les variables d'environnement de production sont définies
- [ ] Les URLs, ports et chemins pointent vers la production (pas le dev)
- [ ] Les migrations de base de données sont prêtes et réversibles

#### Review

- [ ] La PR a été revue (skill code-review)
- [ ] Les critères de done de l'issue sont remplis
- [ ] L'humain a validé le déploiement

### 2. Déploiement — Exécution

Le déploiement suit le pipeline défini par le projet. Formats courants :

#### Via CI/CD (recommandé)

```bash
# Le merge sur la branche de production déclenche le pipeline
git checkout main
git merge --no-ff feat/ISS-XXXX-slug
git push origin main
# → Le CI/CD prend le relais (build, test, deploy)
```

#### Via commande manuelle

```bash
# 1. Build
npm run build          # ou python -m build, cargo build --release, etc.

# 2. Test de production
npm run test:prod      # tests sur le build de production

# 3. Deploy
npm run deploy         # ou rsync, scp, docker push, kubectl apply, etc.
```

#### Rollback — toujours prévoir

Avant de déployer, s'assurer qu'un rollback est possible :

```bash
# Identifier la version actuelle en production
git log --oneline -1 origin/production

# En cas de problème
git revert HEAD
git push origin main
# ou : redéployer le tag précédent
```

### 3. Post-déploiement — Validation

Après le déploiement, vérifier que tout fonctionne :

- [ ] L'application répond (health check, page d'accueil)
- [ ] Les fonctionnalités critiques marchent (test manuel ou smoke test automatisé)
- [ ] Les logs ne montrent pas d'erreur
- [ ] Les métriques sont normales (temps de réponse, taux d'erreur)
- [ ] Les migrations de base de données se sont appliquées correctement

### 4. Documentation

Après un déploiement réussi :

- Mettre à jour l'issue (status → `5-done`)
- Mettre à jour le BOARD.md
- Si un problème a été rencontré et résolu → ajouter dans `cortex/bugs.md`
- Si une procédure de déploiement a changé → mettre à jour ce skill ou les notes du projet

---

## Stratégies de déploiement

| Stratégie | Quand l'utiliser | Risque |
|-----------|-----------------|--------|
| **Direct** (push to prod) | Petits projets, équipe solo | Élevé — pas de filet |
| **Blue-green** | Applications critiques | Faible — rollback instantané |
| **Canary** | Beaucoup d'utilisateurs | Faible — exposition progressive |
| **Feature flags** | Fonctionnalités risquées | Faible — activation/désactivation sans redéploiement |

Pour la plupart des projets utilisant Le Socle, la stratégie **CI/CD avec merge sur main** est suffisante.

---

## Environnements

| Environnement | Usage | Qui déploie |
|---------------|-------|-------------|
| `local` | Développement | L'agent ou le développeur |
| `staging` | Test avant production | CI/CD automatique sur merge vers `dev` ou `staging` |
| `production` | Utilisateurs finaux | CI/CD automatique sur merge vers `main` (après validation humaine) |

---

## Checklist finale

- [ ] Pré-déploiement vérifié (code, dépendances, config, review)
- [ ] Rollback préparé
- [ ] Déploiement exécuté
- [ ] Post-déploiement validé (health check, fonctionnalités, logs)
- [ ] Issue et BOARD.md mis à jour
- [ ] Memory enrichie si apprentissage

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge peut préparer et valider un déploiement sans interprétation supplémentaire.*
