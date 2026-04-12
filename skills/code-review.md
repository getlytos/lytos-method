# Skill — Code Review

*Ce skill définit comment effectuer une code review sur un projet utilisant Le Socle. Un agent chargé de ce skill sait exactement quoi vérifier, dans quel ordre, et comment formuler ses retours.*

---

## Quand invoquer ce skill

- Après chaque PR avant merge
- À la demande explicite de l'humain sur un fichier ou module
- En fin de sprint, pour un audit qualité global

---

## Procédure

### 1. Prise de contexte

Avant de commencer la review :

- Lire le **manifest** du projet — comprendre les contraintes fondamentales
- Lire la **memory** — vérifier s'il y a des décisions architecturales pertinentes
- Lire les **rules** actives — ce sont les critères de qualité à appliquer
- Lire l'**issue liée** — comprendre le "pourquoi" du changement

### 2. Checklist de review

Appliquer chaque point de cette checklist sur le code soumis :

#### Lisibilité
- [ ] Le code se lit de haut en bas sans effort
- [ ] Les noms de variables, fonctions et classes sont explicites
- [ ] Pas d'abréviation obscure (sauf conventions établies du projet)
- [ ] Les blocs logiques sont séparés visuellement

#### Structure
- [ ] Chaque fichier fait moins de 300 lignes
- [ ] Une fonction = une responsabilité
- [ ] Pas de nesting excessif (max 3 niveaux)
- [ ] Les imports sont organisés et triés

#### Nommage
- [ ] Les fonctions décrivent ce qu'elles font (verbe + nom)
- [ ] Les variables décrivent ce qu'elles contiennent
- [ ] Les constantes sont en UPPER_SNAKE_CASE
- [ ] Le nommage est cohérent avec le reste du projet

#### Duplication
- [ ] Pas de copier-coller — si un pattern se répète 3+ fois, il doit être factorisé
- [ ] Les fonctions utilitaires existantes sont réutilisées
- [ ] Pas de réinvention de ce qui existe déjà dans les dépendances

#### Gestion d'erreurs
- [ ] Les erreurs sont gérées explicitement (pas de fail silencieux)
- [ ] Les messages d'erreur sont compréhensibles
- [ ] Les cas limites sont couverts
- [ ] Pas de `catch` vide ou de `try/catch` qui avale tout

#### Sécurité
- [ ] Pas d'injection possible (SQL, XSS, commande)
- [ ] Les entrées utilisateur sont validées et échappées
- [ ] Pas de secret en dur dans le code (clé API, mot de passe, token)
- [ ] Les permissions sont vérifiées avant chaque action sensible

#### Tests
- [ ] Les nouvelles fonctions ont des tests unitaires
- [ ] Les cas limites sont testés
- [ ] Les tests existants passent toujours
- [ ] La couverture ne régresse pas

#### Performance
- [ ] Pas de requête en base dans une boucle (N+1)
- [ ] Pas de calcul coûteux non mis en cache
- [ ] Pas de chargement inutile de données
- [ ] Les assets sont optimisés si modifiés

#### Documentation
- [ ] Les fonctions publiques sont documentées (docstring, PHPDoc, JSDoc, GoDoc...)
- [ ] Les comportements non évidents ont un commentaire
- [ ] Le README est mis à jour si l'interface publique change

### 3. Classification des retours

Chaque retour de review doit être classifié :

| Niveau | Signification | Action attendue |
|--------|--------------|-----------------|
| **CRITIQUE** | Bug, faille de sécurité, perte de données | Bloque le merge — doit être corrigé |
| **AVERTISSEMENT** | Mauvaise pratique, dette technique, risque futur | Doit être corrigé sauf justification explicite |
| **SUGGESTION** | Amélioration possible, style, optimisation | À la discrétion du développeur |

### 4. Format de sortie

Chaque retour suit ce format :

```
[CRITIQUE | AVERTISSEMENT | SUGGESTION] fichier:ligne
Description du problème.
Suggestion de correction (si applicable).
```

Exemple :

```
[CRITIQUE] src/auth/login.py:42
Le mot de passe est loggué en clair dans le fichier de debug.
→ Supprimer le print() ou remplacer par un hash avant logging.

[AVERTISSEMENT] src/components/ProductCard.tsx:128
Couleur #FF6B35 en dur dans le style inline.
→ Utiliser une variable de thème ou une constante nommée.

[SUGGESTION] src/utils/format.go:15
La fonction FormatDate pourrait utiliser time.Format avec un layout plus standard.
```

### 5. Synthèse

À la fin de la review, produire un résumé :

```
## Résumé de review

**Fichiers revus** : X
**Critiques** : X (bloquants)
**Avertissements** : X
**Suggestions** : X

**Verdict** : ✅ Prêt à merger | ⛔ Corrections requises | ⚠️ Corrections mineures recommandées

**Points forts** :
- ...

**Points d'attention** :
- ...
```

---

## Règles spécifiques à ce skill

- Ne jamais approuver un code avec un retour CRITIQUE non résolu
- Ne pas faire de review sur son propre code — un autre agent ou l'humain doit valider
- Si un pattern problématique est récurrent, le signaler pour ajout dans les **rules**
- Si une décision architecturale est découverte pendant la review, la documenter dans la **memory**

---

*Ce skill est opérationnel immédiatement. Un agent qui le charge peut effectuer une code review complète sans interprétation supplémentaire.*
