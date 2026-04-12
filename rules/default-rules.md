# Rules — Règles par défaut

*Ces règles sont les critères de qualité universels applicables à tout projet utilisant Le Socle. Elles sont lues par les agents avant chaque tâche. Elles définissent ce que "bien fait" signifie.*

---

## Structure du code

| Règle | Seuil | Justification |
|-------|-------|---------------|
| Taille maximale d'un fichier | 300 lignes | Au-delà, le fichier a trop de responsabilités |
| Taille maximale d'une fonction | 30 lignes (50 max) | Une fonction longue fait trop de choses |
| Nesting maximal | 3 niveaux | Au-delà, le code est illisible — utiliser early return |
| Paramètres par fonction | 4 max | Au-delà, regrouper dans un objet |

---

## Documentation

| Règle | Détail |
|-------|--------|
| Documentation obligatoire (docstring, JSDoc, PHPDoc, GoDoc...) | Sur toute fonction et méthode publique |
| Commentaires inline | Seulement pour expliquer le **pourquoi**, jamais le **quoi** |
| README par module | Chaque module majeur a un README minimal |

---

## Valeurs en dur — interdites

Aucune valeur magique dans le code de production.

| Interdit | Remplacement |
|----------|-------------|
| Nombres magiques (`1.20`, `86400`, `3`) | Constante nommée (`TVA_FRANCE`, `SECONDES_PAR_JOUR`, `MAX_TENTATIVES`) |
| Couleurs en dur (`#FF6B35`, `red`) | Variable CSS (`var(--color-accent)`) ou constante de thème |
| URLs en dur | Variable d'environnement ou fichier de configuration |
| Chaînes de configuration | Constante ou fichier `.env` |

---

## Gestion des erreurs

| Règle | Détail |
|-------|--------|
| Pas de fail silencieux | Toute erreur doit être gérée explicitement |
| Pas de `catch` vide | Un catch doit au minimum logger l'erreur |
| Messages d'erreur clairs | L'erreur doit dire **quoi** a échoué et **pourquoi** |
| Validation des entrées | Toute donnée externe (utilisateur, API) est validée avant traitement |

---

## Code de production — interdit

| Interdit | Pourquoi |
|----------|----------|
| `console.log()`, `print()`, `var_dump()`, `fmt.Println()` | Utiliser un logger structuré — pas de debug en production |
| `// TODO` sans référence | Un TODO doit pointer vers une issue : `// TODO(ISS-XXXX)` |
| Code commenté | Si c'est commenté, c'est mort — le supprimer. Git est l'historique |
| `@ts-ignore` / `@phpstan-ignore` sans justification | Si on ignore un warning, expliquer pourquoi |

---

## Tests

| Règle | Seuil |
|-------|-------|
| Couverture tests unitaires | 80% des fonctions publiques minimum |
| Tests pour toute nouvelle feature | Obligatoire avant merge |
| Tests pour tout fix | Le test doit prouver que le bug ne revient pas |
| Tests E2E sur parcours critiques | Obligatoire (auth, paiement, inscription) |

---

## Sécurité

| Règle | Détail |
|-------|--------|
| Pas de secret dans le code | Clés API, tokens, mots de passe → fichier `.env` uniquement |
| Entrées utilisateur échappées | Protection contre injection SQL, XSS, commandes |
| Permissions vérifiées | Avant toute action sensible |
| Dépendances à jour | Pas de vulnérabilité connue dans les deps |

---

## Git

| Règle | Détail |
|-------|--------|
| Format de commit | `type(scope): message` |
| Branche par issue | `type/ISS-XXXX-slug` |
| Pas de push sur main/dev | Tout passe par PR |
| Review obligatoire | Au moins une review avant merge |

---

## Comportement des agents

| Règle | Détail |
|-------|--------|
| Pas d'interprétation silencieuse | Si une instruction (skill, rule, issue) est ambiguë, l'agent **signale l'ambiguïté à l'humain** au lieu de deviner. Combler un trou sans le dire est pire que poser une question |
| Pas de "si approprié" | Un agent ne décide pas seul de ce qui est "approprié". Si une étape d'un skill n'est pas applicable dans le contexte, il le signale — il ne la saute pas |
| Traçabilité des décisions | Quand un agent fait un choix technique (entre deux approches, une lib plutôt qu'une autre), il le mentionne explicitement avec la raison, pour que l'humain puisse valider ou corriger |

---

## Comment appliquer ces règles

1. Les agents chargent ce fichier **avant chaque tâche**
2. Chaque point est un critère vérifiable — pas une recommandation vague
3. Une violation de règle est signalée comme **AVERTISSEMENT** ou **CRITIQUE** selon le skill code-review
4. Les règles spécifiques au projet (dans un fichier séparé) **complètent** ces règles, elles ne les remplacent pas

---

*Ces règles sont le standard minimum. Un projet peut ajouter ses propres règles spécifiques en créant des fichiers supplémentaires dans ce dossier.*
