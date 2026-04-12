#!/usr/bin/env bash
#
# Le Socle — Installation
#
# Usage :
#   curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash
#
#   ou avec options :
#   curl -fsSL https://raw.githubusercontent.com/le-socle/socle/main/install.sh | bash -s -- --name "Mon Projet" --tool claude
#
# Ce script crée la structure .socle/ dans le dossier courant avec le minimum
# opérationnel : manifest, memory, rules, skills, issue-board, scripts.
#
set -euo pipefail

# --- Configuration ---
SOCLE_DIR=".socle"
REPO_RAW="https://raw.githubusercontent.com/le-socle/socle/main"
PROJECT_NAME=""
TOOL=""

# --- Couleurs ---
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

# --- Fonctions ---
info()  { echo -e "${BLUE}→${NC} $1"; }
ok()    { echo -e "${GREEN}✓${NC} $1"; }
err()   { echo -e "${RED}✗${NC} $1"; exit 1; }

download() {
    local url="$1"
    local dest="$2"
    mkdir -p "$(dirname "$dest")"
    if command -v curl &> /dev/null; then
        curl -fsSL "$url" -o "$dest" 2>/dev/null
    elif command -v wget &> /dev/null; then
        wget -q "$url" -O "$dest" 2>/dev/null
    else
        err "curl ou wget requis pour l'installation"
    fi
}

# --- Parse arguments ---
while [[ $# -gt 0 ]]; do
    case $1 in
        --name)  PROJECT_NAME="$2"; shift 2 ;;
        --tool)  TOOL="$2"; shift 2 ;;
        --dir)   SOCLE_DIR="$2"; shift 2 ;;
        --help|-h)
            echo "Usage : install.sh [--name \"Nom du projet\"] [--tool claude|cursor|openai] [--dir .socle]"
            exit 0 ;;
        *)       shift ;;
    esac
done

# --- Mode interactif si pas d'arguments ---
if [ -t 0 ] && [ -z "$PROJECT_NAME" ]; then
    echo ""
    echo -e "${BOLD}Le Socle${NC} — Installation"
    echo ""
    read -p "Nom du projet : " PROJECT_NAME
    echo ""
    echo "Quel outil IA utilises-tu ?"
    echo "  1) Claude Code"
    echo "  2) Cursor"
    echo "  3) OpenAI / Autre"
    echo ""
    read -p "Choix (1/2/3) : " tool_choice
    case $tool_choice in
        1) TOOL="claude" ;;
        2) TOOL="cursor" ;;
        3) TOOL="openai" ;;
        *) TOOL="" ;;
    esac
fi

PROJECT_NAME="${PROJECT_NAME:-Mon Projet}"

# --- Vérifications ---
if [ -d "$SOCLE_DIR" ]; then
    err "Le dossier $SOCLE_DIR existe déjà. Supprime-le d'abord ou utilise --dir."
fi

echo ""
info "Installation du Socle dans $SOCLE_DIR/"

# --- Créer la structure ---
info "Création de la structure..."

mkdir -p "$SOCLE_DIR"/{memory/cortex,rules,skills,issue-board/{0-icebox,1-backlog,2-sprint,3-in-progress,4-review,5-done,templates},scripts}

# .gitkeep pour les dossiers vides
for dir in 0-icebox 1-backlog 2-sprint 3-in-progress 4-review 5-done; do
    touch "$SOCLE_DIR/issue-board/$dir/.gitkeep"
done

ok "Structure créée"

# --- Télécharger les fichiers essentiels ---
info "Téléchargement des skills..."
for skill in session-start code-review testing documentation git-workflow code-structure deployment; do
    download "$REPO_RAW/skills/$skill.md" "$SOCLE_DIR/skills/$skill.md"
done
ok "7 skills installés"

info "Téléchargement du briefing IA..."
download "$REPO_RAW/SOCLE.md" "$SOCLE_DIR/SOCLE.md"
ok "Briefing installé"

info "Téléchargement des rules..."
download "$REPO_RAW/rules/default-rules.md" "$SOCLE_DIR/rules/default-rules.md"
download "$REPO_RAW/rules/README.md" "$SOCLE_DIR/rules/README.md"
ok "Rules installées"

info "Téléchargement des templates d'issues..."
download "$REPO_RAW/issue-board/templates/issue-feature.md" "$SOCLE_DIR/issue-board/templates/issue-feature.md"
download "$REPO_RAW/issue-board/templates/issue-task.md" "$SOCLE_DIR/issue-board/templates/issue-task.md"
ok "Templates installés"

info "Téléchargement du script generate-board..."
download "$REPO_RAW/scripts/generate-board.py" "$SOCLE_DIR/scripts/generate-board.py"
chmod +x "$SOCLE_DIR/scripts/generate-board.py"
ok "Script installé"

# --- Créer le manifest pré-rempli ---
info "Création du manifest..."
cat > "$SOCLE_DIR/manifest.md" << MANIFEST
# Manifest — $PROJECT_NAME

*Ce manifest est la constitution du projet $PROJECT_NAME. Il est lu par les agents au démarrage de chaque session de travail.*

---

## Identité

| Champ | Valeur |
|-------|--------|
| Nom | $PROJECT_NAME |
| Description | |
| Responsable | |
| Repo | |

---

## Pourquoi ce projet existe

*3-5 phrases. Le "pourquoi" de ce projet.*

---

## Ce que ce projet est

-

## Ce que ce projet n'est pas

-

---

## Stack technique

| Composant | Technologie |
|-----------|-------------|
| Langage | |
| Framework | |
| Base de données | |
| Tests | |

---

## Vocabulaire du projet

| Terme | Définition |
|-------|------------|
| | |

---

## Principes de développement

*Quand un agent hésite entre deux approches, il consulte ces principes pour trancher. Formuler comme des arbitrages : "on préfère X plutôt que Y, parce que Z."*

-
-

---

## Modèles IA par complexité

*Mapper vos propres modèles selon votre budget et vos outils. Mettre à jour quand de meilleurs modèles sortent.*

| Complexité | Usage | Modèle |
|------------|-------|--------|
| \`light\` | Documentation, formatage, renommage, boilerplate | |
| \`standard\` | Développement courant, code review, tests | |
| \`heavy\` | Architecture complexe, algorithmes critiques, sécurité | |

---

## Liens importants

| Ressource | URL |
|-----------|-----|
| Repo principal | |
| Documentation | |
| Staging | |
| Production | |

---

*Dernière mise à jour : $(date +%Y-%m-%d)*
MANIFEST
ok "Manifest créé — à remplir"

# --- Créer la memory ---
info "Création de la memory..."
cat > "$SOCLE_DIR/memory/MEMORY.md" << MEMORY
# Memory — $PROJECT_NAME

*Ce fichier est le sommaire de la mémoire du projet. Ne pas tout lire — charger uniquement ce qui est pertinent pour la tâche en cours.*

> **Dernière mise à jour** : $(date +%Y-%m-%d)
> **Nombre d'entrées** : 0

---

## Index des sections

| Fichier | Contenu | Charger quand... |
|---------|---------|------------------|
| [architecture.md](./cortex/architecture.md) | Décisions architecturales, choix techniques | Toute tâche structurante |
| [backend.md](./cortex/backend.md) | Patterns et pièges côté serveur | Tâche backend |
| [frontend.md](./cortex/frontend.md) | Patterns et pièges côté client | Tâche frontend |
| [patterns.md](./cortex/patterns.md) | Patterns de code récurrents | Code review, nouveau code |
| [bugs.md](./cortex/bugs.md) | Problèmes récurrents et solutions | Debug, fix |
| [business.md](./cortex/business.md) | Contexte métier, vocabulaire | Logique métier, UX |
| [sprints.md](./cortex/sprints.md) | Historique des sprints | Planification |

---

## Résumé vivant

*3-5 lignes. L'état actuel du projet en un coup d'œil.*

---

*Le dossier est la structure. Le fichier est le contenu. Ce sommaire est la carte.*
MEMORY

# Créer les fichiers cortex pré-remplis avec exemples
cat > "$SOCLE_DIR/memory/cortex/architecture.md" << 'CORTEX'
# Memory — Architecture & Décisions techniques

*Charger ce fichier pour toute tâche qui touche à la structure du projet.*

---

<!-- Exemple à adapter ou supprimer :

### 2026-04-12 — Choix de la base de données

**Contexte** : Hésitation entre SQLite (simple) et PostgreSQL (robuste).
**Décision** : PostgreSQL dès le début.
**Conséquence** : Besoin de Docker pour le dev local, mais pas de migration douloureuse plus tard.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/backend.md" << 'CORTEX'
# Memory — Backend

*Charger ce fichier pour toute tâche backend : API, base de données, services.*

---

<!-- Exemple à adapter ou supprimer :

### Fichiers clés

| Fichier | Rôle |
|---------|------|
| `src/main.py` | Point d'entrée de l'application |
| `src/models/` | Modèles de données |
| `src/routes/` | Endpoints API |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/frontend.md" << 'CORTEX'
# Memory — Frontend

*Charger ce fichier pour toute tâche frontend : UI, composants, styles.*

---

<!-- Exemple à adapter ou supprimer :

### Fichiers clés

| Fichier | Rôle |
|---------|------|
| `src/App.tsx` | Composant racine |
| `src/components/` | Composants réutilisables |
| `src/hooks/` | Hooks custom |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/patterns.md" << 'CORTEX'
# Memory — Patterns découverts

*Charger ce fichier pour du code review, du refactoring, ou de l'écriture de nouveau code.*

---

<!-- Exemple à adapter ou supprimer :

### Nom du pattern

**Quoi** : Description du pattern en une phrase.
**Où** : Fichier(s) où il est appliqué.
**Pourquoi ça marche** : Ce qui le rend efficace dans ce contexte.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/bugs.md" << 'CORTEX'
# Memory — Problèmes récurrents & Solutions

*Charger ce fichier avant de debug — le problème a peut-être déjà été résolu.*

---

<!-- Exemple à adapter ou supprimer :

| Problème | Cause | Solution |
|----------|-------|----------|
| Les tests échouent sur CI mais passent en local | Variables d'env manquantes dans le pipeline | Ajouter les secrets dans les settings CI |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/business.md" << 'CORTEX'
# Memory — Contexte métier

*Charger ce fichier pour toute tâche qui touche à la logique métier ou à l'UX.*

---

<!-- Exemple à adapter ou supprimer :

### Nom du concept métier

**Règle** : Ce que le métier impose.
**Pourquoi** : La raison métier (pas technique).
**Impact code** : Ce que ça implique concrètement.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/sprints.md" << 'CORTEX'
# Memory — Historique des sprints

*Charger ce fichier en début de sprint, en rétrospective, ou en planification.*

---

| Sprint | Objectif | Résultat | Apprentissage clé |
|--------|----------|----------|-------------------|

CORTEX
ok "Memory initialisée"

# --- Créer le BOARD.md ---
info "Création du board..."
cat > "$SOCLE_DIR/issue-board/BOARD.md" << BOARD
# Issue Board — $PROJECT_NAME

> Chaque issue = un fichier \`ISS-XXXX-titre.md\` dans le dossier de son statut.
>
> **Dernière mise à jour** : $(date +%Y-%m-%d)
> **Prochain numéro** : ISS-0001

> Régénérer : \`python .socle/scripts/generate-board.py\`

---

## Index des issues

### 0-icebox (idées)

_Aucune issue._

### 1-backlog (priorisé)

_Aucune issue._

### 2-sprint (engagé)

_Aucune issue._

### 3-in-progress (en dev)

_Aucune issue._

### 4-review (review/test)

_Aucune issue._

### 5-done (terminé)

_Aucune issue._

---

*Le frontmatter YAML est la source de vérité. Le dossier est le statut visuel. Le BOARD.md est la carte.*
BOARD
ok "Board créé"

# --- Créer le fichier de connexion IA ---
if [ "$TOOL" = "claude" ]; then
    info "Création du CLAUDE.md..."
    cat > "CLAUDE.md" << CLAUDE
# CLAUDE.md

Ce projet utilise **Le Socle** — une méthode de travail humain-IA.

## Première session (setup)

Si le manifest est vide ou incomplet, lis d'abord :
- .socle/SOCLE.md — comprendre la méthode et comment aider à remplir les fichiers

## À chaque session

Lis ces fichiers dans l'ordre :
1. .socle/manifest.md — la constitution du projet (identité, stack, principes, modèles IA)
2. .socle/memory/MEMORY.md — le sommaire de la mémoire (puis charge les sections cortex/ pertinentes)
3. .socle/rules/default-rules.md — les critères de qualité

## Pour travailler sur une tâche

4. .socle/issue-board/BOARD.md — l'état du board
5. .socle/skills/session-start.md — la procédure complète de démarrage et de fin de tâche

## Règles

- Le frontmatter YAML des issues est la source de vérité
- Ne pas interpréter silencieusement — demander si une instruction est ambiguë
- En fin de tâche : mettre à jour le frontmatter, déplacer le fichier, mettre à jour le BOARD.md
- Consulter le champ \`complexity\` de l'issue + la table du manifest pour savoir quel modèle utiliser

Documentation : https://github.com/le-socle/socle
CLAUDE
    ok "CLAUDE.md créé à la racine du projet"

elif [ "$TOOL" = "cursor" ]; then
    info "Création du .cursorrules..."
    cat > ".cursorrules" << CURSOR
Ce projet utilise Le Socle — une méthode de travail humain-IA.

Première session (setup) : si le manifest est vide, lis @.socle/SOCLE.md pour comprendre la méthode.

À chaque session, lis dans l'ordre :
1. @.socle/manifest.md — la constitution du projet
2. @.socle/memory/MEMORY.md — le sommaire de la mémoire (puis les sections cortex/ pertinentes)
3. @.socle/rules/default-rules.md — les critères de qualité

Pour travailler sur une tâche :
4. @.socle/issue-board/BOARD.md — l'état du board
5. @.socle/skills/session-start.md — procédure de démarrage et fin de tâche

Règles :
- Le frontmatter YAML des issues est la source de vérité
- Ne pas interpréter silencieusement — demander si une instruction est ambiguë
- En fin de tâche : mettre à jour le frontmatter, déplacer le fichier, mettre à jour le BOARD.md
- Consulter le champ complexity de l'issue + la table du manifest pour le modèle à utiliser

Documentation : https://github.com/le-socle/socle
CURSOR
    ok ".cursorrules créé à la racine du projet"
fi

# --- Résumé ---
echo ""
echo -e "${BOLD}${GREEN}Le Socle est installé.${NC}"
echo ""
echo "  Prochaine étape — lance ton IA et dis-lui :"
echo ""
echo -e "  ${BOLD}\"Aide-moi à configurer le Socle pour ce projet.\"${NC}"
echo ""
echo "  L'IA va lire le briefing, comprendre la méthode, et te poser"
echo "  les bonnes questions pour remplir ton manifest."
echo ""
echo "  Structure installée :"
echo "  $SOCLE_DIR/"
echo "  ├── SOCLE.md              ← briefing IA (lu à la première session)"
echo "  ├── manifest.md           ← à remplir avec l'aide de ton IA"
echo "  ├── memory/"
echo "  │   ├── MEMORY.md"
echo "  │   └── cortex/           ← se remplira au fil du travail"
echo "  ├── skills/               ← 7 skills opérationnels"
echo "  ├── rules/                ← critères de qualité"
echo "  ├── issue-board/          ← board Kanban"
echo "  └── scripts/              ← outils d'automatisation"
echo ""
echo "  Documentation : https://github.com/le-socle/socle"
echo ""
