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

### Principe universel

Toute fonction et méthode publique doit être documentée. Le format dépend du langage, le contenu est le même :

1. **Première ligne** : ce que fait la fonction (verbe à l'infinitif)
2. **Paramètres** : type + nom + description en une phrase
3. **Retour** : type + description, incluant les cas limites (liste vide, null, erreur)
4. **Erreurs** : chaque exception ou erreur possible avec sa condition

### Exemples par langage

```python
def calculer_ttc(prix_ht: float, taux_tva: float) -> float:
    """Calcule le prix TTC à partir du prix HT et du taux de TVA.

    Args:
        prix_ht: Le prix hors taxes en euros.
        taux_tva: Le taux de TVA (ex: 0.20 pour 20%).

    Returns:
        Le prix TTC arrondi à 2 décimales.

    Raises:
        ValueError: Si le prix HT est négatif.
    """
```

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

```go
// CalculerTTC calcule le prix TTC à partir du prix HT et du taux de TVA.
// Retourne une erreur si le prix HT est négatif.
func CalculerTTC(prixHT, tauxTVA float64) (float64, error) {
```

```php
/**
 * Calcule le prix TTC à partir du prix HT et du taux de TVA.
 *
 * @param float $prixHT    Le prix hors taxes en euros.
 * @param float $tauxTVA   Le taux de TVA (ex: 0.20 pour 20%).
 * @return float Le prix TTC arrondi à 2 décimales.
 * @throws InvalidArgumentException Si le prix HT est négatif.
 */
public function calculerTTC(float $prixHT, float $tauxTVA): float
```

### Pas de documentation sur

- Les getters/setters triviaux sans logique
- Les fonctions privées dont le nom est suffisamment explicite
- Les wrappers évidents d'une seule ligne

### Commentaires inline

Les commentaires inline ne servent **pas** à répéter ce que fait le code — ils servent à expliquer **pourquoi**.

```python
# ✅ Bon — explique le pourquoi
# On arrondit à l'entier supérieur car l'API de paiement n'accepte pas les centimes
montant = math.ceil(total)

# ❌ Mauvais — répète le code
# On arrondit le total
montant = math.ceil(total)
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

### Où écrire

La memory est structurée en fichiers spécialisés dans `memory/cortex/`. Écrire dans le bon fichier :

| Situation | Fichier cortex |
|-----------|----------------|
| Décision architecturale prise | `cortex/architecture.md` |
| Pattern de code qui fonctionne bien | `cortex/patterns.md` |
| Bug récurrent résolu | `cortex/bugs.md` |
| Apprentissage backend (API, BDD) | `cortex/backend.md` |
| Apprentissage frontend (UI, JS, CSS) | `cortex/frontend.md` |
| Apprentissage métier | `cortex/business.md` |
| Fin de sprint | `cortex/sprints.md` |

Après ajout, mettre à jour le compteur d'entrées et le résumé vivant dans `MEMORY.md`.

### Format d'une entrée memory

Chaque entrée est concise et actionnable :

```markdown
### [Date] — [Titre court]

**Contexte** : Pourquoi cette entrée existe.
**Décision** : Ce qui a été décidé ou découvert.
**Conséquence** : Ce que ça implique pour la suite.
```

### Règles de la memory

- Garder chaque entrée sous 5 lignes — si c'est plus long, c'est de la documentation, pas de la mémoire
- Toujours dater les entrées
- Écrire dans le fichier cortex correspondant au domaine, pas dans MEMORY.md

### Consolidation de la memory — procédure de fin de sprint

La memory grossit à chaque sprint. Sans entretien, elle devient du bruit. À chaque fin de sprint, effectuer cette consolidation :

#### 1. Nettoyer

Pour chaque fichier dans `cortex/` :

- **Supprimer** les entrées qui ne sont plus vraies (décision inversée, code supprimé, bug corrigé définitivement)
- **Fusionner** les entrées redondantes (deux entrées qui disent la même chose → une seule, plus précise)
- **Archiver** les entrées qui ne sont plus utiles au quotidien mais qu'on veut garder (les déplacer dans une section `## Archive` en bas du fichier)

#### 2. Vérifier la taille

Chaque fichier cortex devrait rester sous **50 entrées**. Au-delà, c'est un signe que :
- Des entrées sont devenues de la documentation (→ les déplacer dans le code ou un README)
- Des entrées sont obsolètes (→ les supprimer ou archiver)
- Le fichier couvre trop de domaines (→ le découper en deux fichiers cortex)

#### 3. Mettre à jour le sommaire

Après la consolidation :
- Mettre à jour le compteur dans `MEMORY.md`
- Mettre à jour le **résumé vivant** (3-5 lignes qui décrivent l'état actuel du projet)
- Ajouter le sprint à `cortex/sprints.md`

#### 4. Valider avec l'humain

La consolidation est proposée par l'agent, validée par l'humain. On ne supprime pas de la mémoire sans accord.

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
