# Lytos

> Une méthode de travail humain-IA qui place les Skills, la Memory et les Rules au centre — pas seulement les personas.

[Read in English](../../README.md)

---

## Pourquoi Lytos ?

Tu utilises l'IA pour coder. À chaque session, tu repars de zéro — tu réexpliques ton projet, tes contraintes, tes conventions. L'IA oublie tout. Tu te répètes. Le résultat est générique.

Tu as essayé de donner un persona à ton agent — "Tu es un développeur Senior avec 20 ans d'expérience." Ça peut changer le ton. D'après notre expérience, ce n'est pas le levier le plus fiable pour améliorer durablement la qualité.

**Lytos prend le problème autrement.** Au lieu de déguiser ton IA, tu lui donnes ce qui tend à la rendre meilleure de façon plus fiable : du contexte qui persiste, des procédures précises, et des critères de qualité vérifiables.

Une installation. Ton IA comprend ton projet, se souvient de ce qu'elle apprend, suit tes procédures, et respecte tes standards — dès la première session.

[Lire la philosophie complète → MANIFESTE.md](./MANIFESTE.md)

---

## Démarrer

Choisis ton chemin :

### Nouveau projet (vibe coders, pas besoin d'IDE)

Utilise le [template starter](https://github.com/getlytos/starter) → clique **"Use this template"** sur GitHub → ouvre dans Claude Code ou Codex → dis **"Aide-moi à configurer Lytos."**

### Projet existant (terminal)

```bash
curl -fsSL https://raw.githubusercontent.com/getlytos/lytos-method/main/install.sh -o install.sh
bash install.sh
```

### Projet existant (GitHub Actions, pas de terminal)

Copie [`.github/workflows/init-lytos.yml`](../../.github/workflows/init-lytos.yml) dans ton repo → va dans Actions → lance **"Add Lytos"**.

---

Puis ouvre ton outil IA et dis-lui : **"Aide-moi à configurer Lytos pour ce projet."**

Guide complet → [DEMARRER.md](./DEMARRER.md)

---

## L'idée

L'industrie IA reproduit souvent l'organisation humaine — des agents avec des rôles, des titres, des personas. C'est rassurant. D'après notre expérience, ce n'est pas le mécanisme le plus robuste pour obtenir qualité, mémoire et cohérence.

Un agent IA n'a pas de fatigue, pas d'ego, pas de politique de bureau. Mais il a une fenêtre de contexte limitée — et il oublie tout entre les sessions. Lui donner un rôle fixe peut aider à cadrer une réponse, mais ça ne résout pas ça de manière fiable. Lui donner le bon contexte aide davantage.

Ce n'est pas un dogme sur le prompting. C'est un choix de design : placer la couche la plus stable dans des fichiers que tu contrôles, surtout dans un monde où les modèles changent vite.

**Lytos propose un renversement** : on ne gère plus les agents, on définit le cadre dans lequel ils opèrent.

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
| **Memory** | La mémoire externe et persistante — ce qu'on a appris | "On a choisi l'API REST plutôt que admin-ajax parce que..." |

Les agents ne sont pas le sujet. Lytos l'est.

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

## Interopérabilité et souveraineté — une question de survie

Ce n'est pas un avantage technique. C'est une position philosophique.

GPT-4 remplacé par GPT-4o remplacé par o1 remplacé par o3. Claude 2 → 3 → 3.5 → 4. Les modèles changent tous les 3–6 mois. Les APIs évoluent. Les prix changent. Des features disparaissent. Des vendors pivotent.

Sans Lytos, ton contexte projet vit dans des conversations propriétaires. Ton workflow est câblé sur un outil spécifique. Le jour où le vendor change ses conditions, augmente ses prix, ou sort un nouveau modèle qui casse ton workflow — tu recommences à zéro.

C'est exactement le problème du vendor lock-in qu'on a connu avec AWS, Salesforce, Adobe. Sauf que là, ça change quatre fois par an.

**La réponse de Lytos :** tout est du markdown. Le manifest, les skills, la memory, les rules — des fichiers texte que tu possèdes, que tu versionnes dans git, que tu relis, sauvegardes et migres librement. L'IA est un moteur. Les moteurs se changent. Lytos est ce qui persiste.

Ce n'est pas une promesse d'équivalence parfaite entre tous les modèles. C'est une garantie de portabilité de ton contexte, de tes procédures et de ta mémoire quand les modèles, les APIs ou les vendors changent.

Ça tourne sur Claude Code aujourd'hui. Ça tournera sur le modèle de demain. Ça peut tourner sur un LLM local si les conditions d'un vendor deviennent inacceptables.

Ce que ça change concrètement :

- **Auditabilité** — ce qui guide l'IA est visible, lisible, révisable et diffable dans git.
- **Réversibilité** — changer de modèle ou de vendor n'efface ni ta mémoire projet ni ta manière de travailler.
- **Continuité d'équipe** — le savoir survit aux sessions, aux historiques de chat et aux personnes.
- **Gouvernance** — règles, décisions et procédures deviennent compatibles avec la revue, la sauvegarde, l'onboarding et la conformité.
- **Effet cumulatif** — chaque sprint laisse derrière lui des actifs réutilisables, pas juste une conversation de plus.

**Ton savoir projet t'appartient. Pas à un vendor.**

---

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona obligatoire, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint — et elle se consolide.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.
6. **Progressif par design.** On commence petit, on ajoute quand on en a besoin.
7. **La souveraineté par le texte.** Le savoir projet vit dans des fichiers que tu possèdes, versionnes, relis et migres — pas chez un vendor. L'IA est un moteur interchangeable.

---

## Les 9 skills intégrés

| Skill | Ce qu'il couvre |
|-------|----------------|
| **session-start** | Démarrage de session, chargement du contexte, clôture |
| **code-review** | Revue de code avec checklist, self-review, taille de PR |
| **testing** | Tests unitaires, intégration, E2E, stratégie de mocking |
| **documentation** | Docstrings, ADR, documentation API, changelog, mémoire |
| **git-workflow** | Branches, commits, CI checks, hooks, semantic versioning |
| **code-structure** | SOLID, 300 lignes max, injection de dépendances, nommage |
| **deployment** | Pré/post-deploy, observabilité, SLOs, migrations, incidents |
| **security** | OWASP Top 10, authentification, autorisation, secrets |
| **api-design** | Conventions REST, pagination, erreurs, rate limiting |

---

## Auteur

Créé par **Frederic Galliné** — [ubeez.com](https://ubeez.com)

- GitHub : [@FredericGalline](https://github.com/FredericGalline)
- X : [@fred](https://x.com/fred)
- Email : frederic@galline.fr

Questions, retours, idées ? Ouvre une [Discussion](https://github.com/getlytos/lytos-method/discussions) ou contacte-moi directement.

---

## Licence

MIT — voir [LICENSE](../../LICENSE)

---

*Lytos est né d'un constat simple : on ne demande pas à une entité différente de l'humain de se comporter comme un humain. On construit autour de ce qu'elle est vraiment.*
