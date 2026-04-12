# Le Socle

> Une méthode de travail humain-IA qui place les Skills, la Memory et les Rules au centre — pas les agents.

[Read in English](../../README.md)

---

## Par où commencer ?

**Démarrer maintenant** — une seule commande :

```bash
curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash
```

Puis ouvre ton outil IA et dis-lui : **"Aide-moi à configurer le Socle pour ce projet."**

Guide complet → [DEMARRER.md](./DEMARRER.md)

**Comprendre la philosophie** → [MANIFESTE.md](./MANIFESTE.md)

**Contribuer** → [CONTRIBUTING.md](../../CONTRIBUTING.md)

---

## Le problème

L'industrie IA reproduit l'organisation humaine — des agents avec des rôles, des titres, des personas. Un "LeadDev", un "Expert UX", tous en costume. C'est rassurant. Ce n'est pas efficace.

Un agent IA n'a pas de mémoire limitée, pas de fatigue, pas d'ego. Lui imposer un rôle fixe, c'est le limiter.

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
