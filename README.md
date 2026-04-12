# Le Socle

> Une méthode de travail humain-IA qui place les Skills, la Memory et les Rules au centre — pas les agents.

*A human-first method for working with AI agents. Skills, Memory and Rules over personas.*

---

## Le problème

Depuis l'émergence des agents IA, l'industrie reproduit par réflexe l'organisation humaine — des agents avec des rôles, des titres, des personas. Un "LeadDev", un "Expert UX", un "Data Scientist", tous artificiels, tous en costume.

C'est le même réflexe qu'avec les premières voitures, appelées "horseless carriages". On comprend le nouveau par analogie avec l'ancien.

**Le Socle propose un renversement.**

---

## La philosophie

L'équipe agile a été inventée pour compenser les limites humaines — mémoire limitée, fatigue cognitive, coût de communication. Un agent IA n'a aucune de ces contraintes.

Lui imposer un rôle fixe, c'est le limiter. Le compléter, c'est construire autour de ce qu'il est vraiment.

**Les agents ne sont pas le sujet. Le socle l'est.**

---

## Comment ça marche

Le Socle s'inspire de Kubernetes : tu ne gères pas les containers individuellement, tu définis un **état désiré** et l'orchestrateur alloue les ressources.

```
L'humain définit          →    Les agents exécutent
─────────────────               ──────────────────
skills/                         Invoqués selon le besoin
rules/                          Stateless, sans identité fixe  
memory/                         Libérés après exécution
manifest.md                     Scalables selon la complexité
sprint.md
```

### Les 4 piliers

| Pilier | Rôle |
|--------|------|
| **Skills** | Les procédures réutilisables, le savoir-faire capitalisé |
| **Rules** | Les critères de qualité, les contraintes du projet |
| **Memory** | Le cerveau persistant qui s'enrichit à chaque sprint |
| **Manifest** | La constitution — l'intention humaine, le pourquoi |

Les agents sont des pods — de l'intelligence scalable sans forme fixe.

---

## Démarrage rapide

```bash
# Cloner le socle dans ton projet
git submodule add https://github.com/le-socle/socle .socle

# Ou via le CLI (bientôt disponible)
npx le-socle init
```

Le socle crée automatiquement la structure dans ton projet :

```
.socle/
├── manifest.md       ← à remplir par l'humain
├── sprint.md         ← kanban du sprint en cours
├── skills/           ← procédures réutilisables
├── rules/            ← critères qualité
├── memory/           ← mémoire persistante du projet
│   ├── MEMORY.md     ← sommaire (lu à chaque session)
│   └── cortex/       ← zones spécialisées (chargées à la demande)
└── issue-board/      ← issues au format .md (Kanban par dossier)
```

---

## Structure du repo

```
le-socle/
├── MANIFESTE.md              ← la philosophie complète
├── README.md                 ← ce fichier
├── templates/
│   ├── manifest.md           ← template manifest projet
│   ├── sprint.md             ← template sprint
│   ├── memory/MEMORY.md      ← template mémoire
│   └── issue/
│       ├── issue-feature.md  ← template issue complexe
│       └── issue-task.md     ← template micro-tâche
├── skills/                   ← skills de base fournis
├── rules/                    ← rules par défaut
├── agents/                   ← documentation orchestrateur
├── adapters/                 ← connecteurs multi-IA
│   ├── claude-code/
│   ├── cursor/
│   └── openai/
└── examples/                 ← projets concrets
```

---

## Principes fondateurs

1. **Le manifest prime.** Tout part de ce que l'humain a défini.
2. **Les agents sont sans forme.** Pas de persona, pas de rôle fixe.
3. **La mémoire est vivante.** Elle grandit à chaque sprint.
4. **Le contrôle est humain.** Les agents exécutent. L'humain valide et oriente.
5. **Complémentarité, pas mimétisme.** L'IA n'est pas un humain dématérialisé.

---

## Multi-IA

Le Socle ne dépend d'aucun vendor. Claude Code aujourd'hui, autre chose demain. Les adapters font le pont — la méthode reste identique, l'outil change.

---

## Contribuer

Le Socle est en construction. Les contributions sont les bienvenues — qu'il s'agisse de nouveaux skills, d'adapters pour d'autres IAs, ou d'améliorer la méthode elle-même.

Lire [CONTRIBUER.md](./CONTRIBUER.md) avant de soumettre une PR.

---

## Licence

MIT — voir [LICENSE](./LICENSE)

---

*Le Socle est né d'un constat simple : on ne demande pas à une entité différente de l'humain de se comporter comme un humain. On construit autour de ce qu'elle est vraiment.*