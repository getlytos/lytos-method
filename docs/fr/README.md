# Le Socle

> Une méthode de travail humain-IA qui place les Skills, la Memory et les Rules au centre — pas les agents.

[Read in English](../../README.md)

---

## Pourquoi Le Socle ?

Tu utilises l'IA pour coder. À chaque session, tu repars de zéro — tu réexpliques ton projet, tes contraintes, tes conventions. L'IA oublie tout. Tu te répètes. Le résultat est générique.

Tu as essayé de donner un persona à ton agent — "Tu es un développeur Senior avec 20 ans d'expérience." Ça change le ton. Ça ne change pas la qualité.

**Le Socle règle ce problème.** Au lieu de déguiser ton IA, tu lui donnes ce qui la rend vraiment meilleure : du contexte qui persiste, des procédures précises, et des critères de qualité vérifiables.

Une installation. Ton IA comprend ton projet, se souvient de ce qu'elle apprend, suit tes procédures, et respecte tes standards — dès la première session.

[Lire la philosophie complète → MANIFESTE.md](./MANIFESTE.md)

---

## Démarrer

Choisis ton chemin :

### Nouveau projet (vibe coders, pas besoin d'IDE)

Utilise le [template starter](https://github.com/le-socle/starter) → clique **"Use this template"** sur GitHub → ouvre dans Claude Code ou Codex → dis **"Aide-moi à configurer le Socle."**

### Projet existant (terminal)

```bash
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh -o install.sh
bash install.sh
```

### Projet existant (GitHub Actions, pas de terminal)

Copie [`.github/workflows/init-socle.yml`](../../.github/workflows/init-socle.yml) dans ton repo → va dans Actions → lance **"Add Le Socle"**.

---

Puis ouvre ton outil IA et dis-lui : **"Aide-moi à configurer le Socle pour ce projet."**

Guide complet → [DEMARRER.md](./DEMARRER.md)

---

## L'idée

L'industrie IA reproduit l'organisation humaine — des agents avec des rôles, des titres, des personas. C'est rassurant. Ce n'est pas efficace.

Un agent IA n'a pas de fatigue, pas d'ego, pas de politique de bureau. Mais il a une fenêtre de contexte limitée — et il oublie tout entre les sessions. Lui donner un rôle fixe ne résout pas ça. Lui donner le bon contexte, si.

**Le Socle propose un renversement** : on ne gère plus les agents, on définit le cadre dans lequel ils opèrent.

---

## Comment ça marche

```
L'humain définit          →    Les agents exécutent
─────────────────               ──────────────────
manifest.md                     Invoqués selon le besoin
skills/                         Stateless, sans identité fixe  
rules/                          Libérés après exécution
memory/                         Scalables selon la complexité
```

### Les 4 piliers

| Pilier | C'est quoi | Exemple concret |
|--------|-----------|-----------------|
| **Manifest** | La constitution du projet — le pourquoi | "Ce projet est une API de gestion de bibliothèque pour..." |
| **Skills** | Les procédures réutilisables — le comment | "Pour faire une code review, vérifier lisibilité, sécurité, tests..." |
| **Rules** | Les critères de qualité — le standard | "Fichiers < 300 lignes, pas de valeurs en dur, tests obligatoires" |
| **Memory** | Le cerveau persistant — ce qu'on a appris | "On a choisi l'API REST plutôt que admin-ajax parce que..." |

Les agents ne sont pas le sujet. Le socle l'est.

---

## 3 niveaux d'adoption

### Niveau 1 — Le minimum (5 minutes)

Manifest + memory. Ton IA comprend ton projet et se souvient de ce qu'elle apprend.

### Niveau 2 — La qualité (30 minutes)

+ rules + skills. Ton IA suit des procédures précises et respecte des critères de qualité.

### Niveau 3 — La méthode complète (1 heure)

+ issue-board + sprint + orchestrateur. Tu gères un vrai projet structuré avec des agents coordonnés.

---

## Compatible avec tout

- **Tout langage** : Python, JavaScript, PHP, Go, Rust, Swift...
- **Tout outil IA** : Claude Code, Cursor, OpenAI, et tout ce qui viendra

---

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint — et elle se consolide.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.
6. **Progressif par design.** On commence petit, on ajoute quand on en a besoin.

---

## Auteur

Créé par **Frederic Galliné** — [ubeez.com](https://ubeez.com)

- GitHub : [@FredericGalline](https://github.com/FredericGalline)
- X : [@fred](https://x.com/fred)
- Email : frederic@galline.fr

Questions, retours, idées ? Ouvre une [Discussion](https://github.com/le-socle/socle/discussions) ou contacte-moi directement.

---

## Licence

MIT — voir [LICENSE](../../LICENSE)

---

*Le Socle est né d'un constat simple : on ne demande pas à une entité différente de l'humain de se comporter comme un humain. On construit autour de ce qu'elle est vraiment.*
