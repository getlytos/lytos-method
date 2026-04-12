# Skill — Documentation

*Ce skill définit comment documenter le code, les modules et les apprentissages sur un projet utilisant Le Socle. Un agent chargé de ce skill sait quoi documenter, dans quel format, et quand mettre à jour la mémoire du projet.*

---

## Quand invoquer ce skill

- Après l'écriture ou la modification d'une fonction publique
- Après un sprint, pour consolider les apprentissages dans la memory
- Lors de la création d'un nouveau module ou composant
- Pour rédiger ou mettre à jour une issue

---

## Documentation du code

### PHPDoc

Toute fonction et méthode publique doit avoir un bloc PHPDoc complet.

```php
/**
 * Calcule le prix TTC à partir du prix HT et du taux de TVA.
 *
 * @param float $prixHT    Le prix hors taxes en euros.
 * @param float $tauxTVA   Le taux de TVA (ex: 0.20 pour 20%).
 *
 * @return float Le prix TTC arrondi à 2 décimales.
 *
 * @throws InvalidArgumentException Si le prix HT est négatif.
 */
public function calculerTTC(float $prixHT, float $tauxTVA): float
```

#### Règles PHPDoc

- Première ligne : **ce que fait** la fonction (verbe à l'infinitif)
- `@param` : type + nom + description en une phrase
- `@return` : type + description de ce qui est retourné
- `@throws` : chaque exception possible avec sa condition
- Pas de PHPDoc sur les getters/setters triviaux sans logique

### JSDoc

Même logique pour JavaScript/TypeScript.

```javascript
/**
 * Filtre les produits selon les critères donnés.
 *
 * @param {Product[]} produits - La liste complète des produits.
 * @param {FilterCriteria} criteres - Les critères de filtrage à appliquer.
 * @returns {Product[]} Les produits correspondant aux critères. Tableau vide si aucun résultat.
 */
function filtrerProduits(produits, criteres) {
```

#### Règles JSDoc

- Première ligne : ce que fait la fonction
- `@param` : `{type}` nom - description
- `@returns` : `{type}` description, incluant les cas limites (tableau vide, null)
- Pour TypeScript avec des types explicites : la JSDoc reste utile pour la description en langage naturel

### Commentaires inline

Les commentaires inline ne servent **pas** à répéter ce que fait le code — ils servent à expliquer **pourquoi**.

```javascript
// ✅ Bon — explique le pourquoi
// On arrondit à l'entier supérieur car l'API de paiement n'accepte pas les centimes
const montant = Math.ceil(total);

// ❌ Mauvais — répète le code
// On arrondit le total
const montant = Math.ceil(total);
```

#### Quand commenter

- Une décision technique non évidente
- Un workaround ou une contrainte externe
- Un comportement contre-intuitif volontaire
- Un TODO avec référence à l'issue : `// TODO(ISS-0042): refactorer quand l'API v2 sera stable`

#### Quand ne PAS commenter

- Le code est lisible et le nommage suffit
- Pour expliquer du code trop complexe → simplifier le code plutôt que commenter

---

## Documentation des modules

Chaque module ou composant majeur a un README dans son dossier.

```markdown
# [Nom du module]

*Une phrase qui dit ce que fait ce module.*

## Responsabilité

Ce module gère [X]. Il ne gère pas [Y] (voir `chemin/vers/autre-module`).

## Utilisation

\`\`\`php
$resultat = MonModule::faire($input);
\`\`\`

## Dépendances

- `autre-module` — pour [raison]
- `lib-externe` v2.x — pour [raison]

## Points d'attention

- [Contrainte ou piège connu]
```

---

## Mise à jour de la Memory

La memory est le cerveau persistant du projet. Elle doit être mise à jour dans ces situations :

### Quand mettre à jour

| Situation | Section de la memory |
|-----------|---------------------|
| Décision architecturale prise | Architecture & Décisions techniques |
| Pattern de code qui fonctionne bien | Patterns découverts |
| Bug récurrent résolu | Problèmes récurrents & Solutions |
| Approche testée et abandonnée | Ce qui ne fonctionne pas |
| Nouveau fichier critique créé | Fichiers clés |
| Apprentissage métier | Contexte métier accumulé |
| Fin de sprint | Historique des sprints |

### Format d'une entrée memory

Chaque entrée est concise et actionnable :

```markdown
### [Date] — [Titre court]

**Contexte** : Pourquoi cette entrée existe.
**Décision** : Ce qui a été décidé ou découvert.
**Conséquence** : Ce que ça implique pour la suite.
```

### Règles de la memory

- Ne jamais supprimer une entrée — seulement ajouter ou mettre à jour
- Consolider les entrées redondantes lors des reviews de fin de sprint
- Garder chaque entrée sous 5 lignes — si c'est plus long, c'est de la documentation, pas de la mémoire
- Toujours dater les entrées

---

## Rédaction d'issues

### Issue feature (issue-feature.md)

Pour les fonctionnalités complexes, multi-fichiers :

- **Contexte** : pourquoi l'issue existe — pas juste "il faut faire X", mais "parce que Y"
- **Solution proposée** : description concrète, pas vague
- **Checklist** : tâches précises avec fichiers concernés, groupées par domaine
- **Fichiers concernés** : tous les fichiers impactés, listés explicitement

### Issue task (issue-task.md)

Pour les micro-tâches (XS/S) :

- **Quoi faire** : une ou deux phrases max
- **Fichiers concernés** : le ou les fichiers à toucher
- **Critère de done** : comment on sait que c'est terminé

### Règles communes

- Le titre de l'issue commence par un verbe d'action : "Ajouter", "Corriger", "Refactorer"
- L'ID suit le format ISS-XXXX (numérotation séquentielle)
- Le champ `Depends` est renseigné si l'issue dépend d'une autre
- Le skill à invoquer est toujours précisé

---

## Checklist avant de considérer la documentation terminée

- [ ] Toutes les fonctions publiques nouvelles ou modifiées ont une PHPDoc/JSDoc
- [ ] Les décisions non évidentes sont commentées (le pourquoi, pas le quoi)
- [ ] La memory est mise à jour si un apprentissage a eu lieu
- [ ] Les issues sont rédigées avec contexte, solution et checklist
- [ ] Les modules nouveaux ont un README minimal

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge peut documenter du code, rédiger des issues et mettre à jour la memory sans interprétation supplémentaire.*
