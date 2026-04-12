# Démarrer en 5 minutes

*Tu viens d'installer Le Socle. Ce guide te rend opérationnel immédiatement — manifest + memory, c'est tout. Le reste viendra quand tu en auras besoin.*

---

## Étape 1 — Installer (30 secondes)

```bash
cd ton-projet/
git submodule add https://github.com/le-socle/socle .socle
```

Tu as maintenant un dossier `.socle/` avec tout ce qu'il faut.

## Étape 2 — Remplir ton manifest (3 minutes)

Copie le template :

```bash
cp .socle/templates/manifest.md .socle/manifest.md
```

Ouvre `.socle/manifest.md` et remplis **seulement ces 4 sections** :

1. **Identité** — le nom et la description courte du projet
2. **Pourquoi ce projet existe** — 3 phrases max, le "pourquoi"
3. **Stack technique** — les langages et outils utilisés
4. **Principes de développement** — 2-3 règles de décision ("on préfère X plutôt que Y")

Le reste peut attendre. Ces 4 sections suffisent pour qu'un agent IA comprenne ton projet.

## Étape 3 — Initialiser ta memory (1 minute)

La memory est déjà prête dans `.socle/memory/`. Ouvre `.socle/memory/MEMORY.md` et remplace `[Nom du projet]` par le nom de ton projet.

C'est tout. La memory se remplira naturellement au fil du travail.

## Étape 4 — Connecter ton outil IA (1 minute)

### Si tu utilises Claude Code

Crée un fichier `CLAUDE.md` à la racine de ton projet :

```markdown
# CLAUDE.md

Au démarrage de chaque session, lis ces fichiers :
1. .socle/manifest.md
2. .socle/memory/MEMORY.md
```

### Si tu utilises Cursor

Crée un fichier `.cursorrules` à la racine de ton projet :

```
Au démarrage de chaque session, lis ces fichiers :
1. .socle/manifest.md
2. .socle/memory/MEMORY.md
```

### Si tu utilises un autre outil

Mets ces deux lignes dans les instructions système de ton outil, ou colle-les au début de ta conversation.

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
