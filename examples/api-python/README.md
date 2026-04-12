# Exemple — API Python (FastAPI)

*Cet exemple montre comment utiliser Le Socle sur un projet d'API REST Python. Tous les fichiers `.socle/` sont remplis avec des données réalistes.*

---

## Le projet fictif

**BookShelf API** — une API REST de gestion de bibliothèque personnelle. Les utilisateurs peuvent ajouter, organiser et noter leurs livres.

Stack : Python 3.12, FastAPI, SQLAlchemy, PostgreSQL, Pytest.

---

## Structure

```
bookshelf-api/
├── .socle/
│   ├── manifest.md              ← constitution du projet
│   ├── sprint.md                ← sprint en cours
│   ├── memory/
│   │   ├── MEMORY.md            ← sommaire de la mémoire
│   │   └── cortex/              ← zones spécialisées
│   ├── rules/
│   │   └── bookshelf-rules.md   ← rules spécifiques au projet
│   └── issue-board/
│       └── BOARD.md             ← board Kanban
├── app/
│   ├── main.py
│   ├── models/
│   ├── routes/
│   └── services/
├── tests/
├── requirements.txt
└── README.md
```

---

## Comment reproduire sur votre projet

```bash
cd votre-projet/
git submodule add https://github.com/le-socle/socle .socle
cp .socle/templates/manifest.md .socle/manifest.md
# Remplir le manifest, initialiser la memory, c'est parti
```

Voir [DEMARRER.md](../../DEMARRER.md) pour le guide complet.
