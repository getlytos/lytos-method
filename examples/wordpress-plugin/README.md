# Exemple — Plugin WordPress avec Le Socle

*Cet exemple montre comment un projet WordPress concret utilise Le Socle. Il peut servir de point de départ pour initialiser Le Socle sur votre propre projet.*

---

## Le projet fictif

**Mon Plugin Réservation** — un plugin WordPress qui permet aux utilisateurs de réserver des créneaux horaires via un formulaire front-end.

---

## Structure

```
mon-plugin-reservation/
├── .socle/
│   ├── manifest.md              ← constitution du projet
│   ├── sprint.md                ← sprint en cours
│   ├── memory/
│   │   └── MEMORY.md            ← mémoire persistante
│   ├── skills/                  ← skills du Socle (via submodule)
│   ├── rules/                   ← rules du Socle + rules WordPress
│   └── issue-board/
│       ├── ISS-0001.md
│       ├── ISS-0002.md
│       └── ISS-0003.md
├── includes/
│   ├── class-reservation.php
│   ├── class-admin-page.php
│   └── helpers.php
├── assets/
│   ├── css/reservation-form.css
│   └── js/reservation-form.js
├── templates/
│   └── reservation-form.php
├── tests/
│   ├── unit/
│   └── e2e/
├── mon-plugin-reservation.php   ← fichier principal du plugin
└── README.md
```

---

## Comment reproduire sur votre projet

### 1. Initialiser Le Socle

```bash
cd mon-projet-wordpress/
git submodule add https://github.com/le-socle/socle .socle
```

### 2. Remplir le manifest

Copiez `.socle/templates/manifest.md` vers `.socle/manifest.md` et remplissez-le avec les informations de votre projet. Voir l'exemple ci-dessous.

### 3. Créer votre premier sprint

Copiez `.socle/templates/sprint.md` vers `.socle/sprint.md` et définissez vos premières issues.

### 4. Configurer votre outil IA

Selon votre outil, suivez l'adapter correspondant :
- Claude Code → voir `adapters/claude-code/`
- Cursor → voir `adapters/cursor/`
- OpenAI → voir `adapters/openai/`

### 5. Travailler

Commencez à travailler sur vos issues en chargeant les skills appropriés.

---

## Les fichiers d'exemple

Les fichiers suivants dans ce dossier montrent à quoi ressemble un Socle rempli sur un vrai projet. Ils sont fournis à titre d'illustration — adaptez-les à votre contexte.

- [manifest.md](./manifest.md) — le manifest rempli
- [sprint.md](./sprint.md) — un sprint avec des issues liées
- [memory/MEMORY.md](./memory/MEMORY.md) — une memory avec quelques entrées

---

*Cet exemple est minimaliste volontairement. Le Socle s'adapte à la taille du projet — un plugin WordPress simple n'a pas besoin de la même profondeur qu'une application SaaS.*
