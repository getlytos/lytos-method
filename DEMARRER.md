# Démarrer en 5 minutes

*Ce guide te rend opérationnel immédiatement — une commande, un manifest à remplir, et c'est parti.*

---

## Étape 1 — Installer (30 secondes)

### Installation recommandée (une commande)

```bash
cd ton-projet/
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash
```

Le script te demande le nom du projet et ton outil IA, puis crée tout le nécessaire : manifest pré-rempli, memory, skills, rules, issue-board et le fichier de config pour ton outil (CLAUDE.md ou .cursorrules).

Tu peux aussi passer les options directement :

```bash
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash -s -- --name "Mon Projet" --tool claude
```

### Alternative — Git submodule

Si tu préfères avoir le repo complet (exemples, documentation, adapters) :

```bash
git submodule add https://github.com/le-socle/socle .socle
cp .socle/templates/manifest.md .socle/manifest.md
```

## Étape 2 — Remplir ton manifest (3 minutes)

Ouvre `.socle/manifest.md` et remplis **seulement ces 4 sections** :

1. **Identité** — le nom et la description courte du projet
2. **Pourquoi ce projet existe** — 3 phrases max, le "pourquoi"
3. **Stack technique** — les langages et outils utilisés
4. **Principes de développement** — 2-3 règles de décision ("on préfère X plutôt que Y")

Le reste peut attendre. Ces 4 sections suffisent pour qu'un agent IA comprenne ton projet.

## Étape 3 — C'est fait

Si tu as utilisé le script d'installation, la memory est initialisée et ton outil IA est configuré. Tout est prêt.

Si tu as utilisé le submodule, initialise la memory :

```bash
# Remplacer [Nom du projet] dans .socle/memory/MEMORY.md
```

Et crée le fichier de connexion pour ton outil (voir ci-dessous).

### Connexion pour Claude Code

Le script crée automatiquement `CLAUDE.md`. Sinon, crée-le à la racine :

```markdown
# CLAUDE.md

Au démarrage de chaque session, lis ces fichiers :
1. .socle/manifest.md
2. .socle/memory/MEMORY.md
3. .socle/rules/default-rules.md
```

### Connexion pour Cursor

Le script crée automatiquement `.cursorrules`. Sinon, crée-le à la racine avec le même contenu.

### Autre outil

Mets ces lignes dans les instructions système de ton outil, ou colle-les au début de ta conversation.

---

## C'est fait

Tu peux maintenant travailler avec ton IA. Elle connaît ton projet, et sa mémoire s'enrichira à chaque session.

Quand tu voudras aller plus loin, voici les prochaines étapes — dans l'ordre :

| Quand | Quoi | Fichier |
|-------|------|---------|
| Tu veux poser des critères de qualité | Lis les rules | `.socle/rules/default-rules.md` |
| Tu veux structurer tes tâches | Crée ton premier sprint | `.socle/templates/sprint.md` |
| Tu veux que l'IA suive une procédure précise | Charge un skill | `.socle/skills/` |
| Tu veux un suivi visuel de l'avancement | Utilise le board | `.socle/issue-board/BOARD.md` |

Tout est optionnel. Le manifest + la memory suffisent pour commencer.

---

*Tu veux comprendre la philosophie derrière tout ça ? Lis [MANIFESTE.md](./MANIFESTE.md).*
