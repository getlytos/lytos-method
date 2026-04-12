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
    read -p "Project name: " PROJECT_NAME
    echo ""
    echo "Which AI tool do you use?"
    echo "  1) Claude Code"
    echo "  2) Cursor"
    echo "  3) OpenAI / Autre"
    echo ""
    read -p "Choice (1/2/3): " tool_choice
    case $tool_choice in
        1) TOOL="claude" ;;
        2) TOOL="cursor" ;;
        3) TOOL="openai" ;;
        *) TOOL="" ;;
    esac
fi

PROJECT_NAME="${PROJECT_NAME:-My Project}"

# --- Vérifications ---
if [ -d "$SOCLE_DIR" ]; then
    err "Directory $SOCLE_DIR already exists. Remove it first or use --dir."
fi

echo ""
info "Installing Le Socle in $SOCLE_DIR/"

# --- Créer la structure ---
info "Creating directory structure..."

mkdir -p "$SOCLE_DIR"/{memory/cortex,rules,skills,issue-board/{0-icebox,1-backlog,2-sprint,3-in-progress,4-review,5-done,templates},scripts}

# .gitkeep pour les dossiers vides
for dir in 0-icebox 1-backlog 2-sprint 3-in-progress 4-review 5-done; do
    touch "$SOCLE_DIR/issue-board/$dir/.gitkeep"
done

ok "Structure created"

# --- Télécharger les fichiers essentiels ---
info "Downloading skills..."
for skill in session-start code-review testing documentation git-workflow code-structure deployment; do
    download "$REPO_RAW/skills/$skill.md" "$SOCLE_DIR/skills/$skill.md"
done
ok "7 skills installed"

info "Downloading AI briefing..."
download "$REPO_RAW/SOCLE.md" "$SOCLE_DIR/SOCLE.md"
ok "Briefing installed"

info "Downloading rules..."
download "$REPO_RAW/rules/default-rules.md" "$SOCLE_DIR/rules/default-rules.md"
download "$REPO_RAW/rules/README.md" "$SOCLE_DIR/rules/README.md"
ok "Rules installed"

info "Downloading templates..."
download "$REPO_RAW/templates/sprint.md" "$SOCLE_DIR/templates/sprint.md"
download "$REPO_RAW/issue-board/templates/issue-feature.md" "$SOCLE_DIR/issue-board/templates/issue-feature.md"
download "$REPO_RAW/issue-board/templates/issue-task.md" "$SOCLE_DIR/issue-board/templates/issue-task.md"
ok "Templates installed"

info "Downloading generate-board script..."
download "$REPO_RAW/scripts/generate-board.py" "$SOCLE_DIR/scripts/generate-board.py"
chmod +x "$SOCLE_DIR/scripts/generate-board.py"
ok "Script installed"

# --- Create pre-filled manifest ---
info "Creating manifest..."
cat > "$SOCLE_DIR/manifest.md" << MANIFEST
# Manifest — $PROJECT_NAME

*This file is the project's constitution. It is read by agents at the start of each work session.*

---

## Identity

| Field | Value |
|-------|-------|
| Name | $PROJECT_NAME |
| Description | |
| Owner | |
| Repo | |

---

## Why this project exists

*3-5 sentences. The "why" of this project.*

---

## What this project is

-

## What this project is not

-

---

## Tech stack

| Component | Technology |
|-----------|------------|
| Language | |
| Framework | |
| Database | |
| Tests | |

---

## Project vocabulary

| Term | Definition |
|------|-----------|
| | |

---

## Development principles

*When an agent hesitates between two approaches, it consults these principles to decide. Formulate as trade-offs: "we prefer X over Y, because Z."*

-
-

---

## AI models by complexity

*Map your own models based on your budget and tools. Update when better models come out.*

| Complexity | Usage | Model |
|------------|-------|-------|
| \`light\` | Documentation, formatting, renaming, boilerplate | |
| \`standard\` | Day-to-day development, code review, tests | |
| \`heavy\` | Complex architecture, critical algorithms, security | |

---

## Important links

| Resource | URL |
|----------|-----|
| Main repo | |
| Documentation | |
| Staging | |
| Production | |

---

*Last updated: $(date +%Y-%m-%d)*
MANIFEST
ok "Manifest created — to be filled in"

# --- Create memory ---
info "Creating memory..."
cat > "$SOCLE_DIR/memory/MEMORY.md" << MEMORY
# Memory — $PROJECT_NAME

*This file is the project memory's table of contents. Do not read everything — load only what is relevant to the current task.*

> **Last updated**: $(date +%Y-%m-%d)
> **Number of entries**: 0

---

## Section index

| File | Content | Load when... |
|------|---------|--------------|
| [architecture.md](./cortex/architecture.md) | Architectural decisions, technical choices | Any structural task |
| [backend.md](./cortex/backend.md) | Server-side patterns and pitfalls | Backend task |
| [frontend.md](./cortex/frontend.md) | Client-side patterns and pitfalls | Frontend task |
| [patterns.md](./cortex/patterns.md) | Recurring code patterns | Code review, new code |
| [bugs.md](./cortex/bugs.md) | Recurring problems and solutions | Debug, fix |
| [business.md](./cortex/business.md) | Business context, vocabulary | Business logic, UX |
| [sprints.md](./cortex/sprints.md) | Sprint history | Planning |

---

## Living summary

*3-5 lines. The current state of the project at a glance.*

---

*The folder is the structure. The file is the content. This table of contents is the map.*
MEMORY

# Create pre-filled cortex files with examples
cat > "$SOCLE_DIR/memory/cortex/architecture.md" << 'CORTEX'
# Memory — Architecture & Technical Decisions

*Load this file for any task that affects the project structure.*

---

<!-- Example to adapt or remove:

### 2026-04-12 — Database choice

**Context**: Hesitation between SQLite (simple) and PostgreSQL (robust).
**Decision**: PostgreSQL from the start.
**Consequence**: Requires Docker for local dev, but no painful migration later.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/backend.md" << 'CORTEX'
# Memory — Backend

*Load this file for any backend task: API, database, services.*

---

<!-- Example to adapt or remove:

### Key files

| File | Role |
|------|------|
| `src/main.py` | Application entry point |
| `src/models/` | Data models |
| `src/routes/` | API endpoints |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/frontend.md" << 'CORTEX'
# Memory — Frontend

*Load this file for any frontend task: UI, components, styles.*

---

<!-- Example to adapt or remove:

### Key files

| File | Role |
|------|------|
| `src/App.tsx` | Root component |
| `src/components/` | Reusable components |
| `src/hooks/` | Custom hooks |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/patterns.md" << 'CORTEX'
# Memory — Discovered Patterns

*Load this file for code review, refactoring, or writing new code.*

---

<!-- Example to adapt or remove:

### Pattern name

**What**: One-sentence description of the pattern.
**Where**: File(s) where it is applied.
**Why it works**: What makes it effective in this context.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/bugs.md" << 'CORTEX'
# Memory — Recurring Problems & Solutions

*Load this file before debugging — the problem may have already been solved.*

---

<!-- Example to adapt or remove:

| Problem | Cause | Solution |
|---------|-------|----------|
| Tests fail on CI but pass locally | Missing env variables in pipeline | Add secrets in CI settings |

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/business.md" << 'CORTEX'
# Memory — Business Context

*Load this file for any task involving business logic or UX.*

---

<!-- Example to adapt or remove:

### Business concept name

**Rule**: What the business requires.
**Why**: The business reason (not technical).
**Code impact**: What this means concretely in the code.

-->
CORTEX

cat > "$SOCLE_DIR/memory/cortex/sprints.md" << 'CORTEX'
# Memory — Sprint History

*Load this file at sprint start, retrospective, or planning.*

---

| Sprint | Objective | Result | Key learning |
|--------|-----------|--------|--------------|

CORTEX
ok "Memory initialized"

# --- Create BOARD.md ---
info "Creating board..."
cat > "$SOCLE_DIR/issue-board/BOARD.md" << BOARD
# Issue Board — $PROJECT_NAME

> Each issue = a \`ISS-XXXX-title.md\` file in the folder matching its status.
>
> **Last updated**: $(date +%Y-%m-%d)
> **Next number**: ISS-0001

> Regenerate: \`python .socle/scripts/generate-board.py\`

---

## Issue index

### 0-icebox (ideas)

_No issues._

### 1-backlog (prioritized)

_No issues._

### 2-sprint (committed)

_No issues._

### 3-in-progress (in dev)

_No issues._

### 4-review (review/test)

_No issues._

### 5-done (completed)

_No issues._

---

*The YAML frontmatter is the source of truth. The folder is the visual status. The BOARD.md is the map.*
BOARD
ok "Board created"

# --- Créer le fichier de connexion IA ---
if [ "$TOOL" = "claude" ]; then
    info "Creating CLAUDE.md..."
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
    ok "CLAUDE.md created at project root"

elif [ "$TOOL" = "cursor" ]; then
    info "Creating .cursorrules..."
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
    ok ".cursorrules created at project root"
fi

# --- Résumé ---
echo ""
echo -e "${BOLD}${GREEN}Le Socle est installé.${NC}"
echo ""
echo "  Next step — open your AI tool and say:"
echo ""
echo -e "  ${BOLD}\"Help me configure Le Socle for this project.\"${NC}"
echo ""
echo "  The AI will read the briefing, understand the method, and ask"
echo "  you the right questions to fill your manifest."
echo ""
echo "  Installed structure:"
echo "  $SOCLE_DIR/"
echo "  ├── SOCLE.md              <- AI briefing (read on first session)"
echo "  ├── manifest.md           <- fill with your AI's help"
echo "  ├── memory/"
echo "  │   ├── MEMORY.md"
echo "  │   └── cortex/           <- will fill up as you work"
echo "  ├── skills/               <- 7 operational skills"
echo "  ├── rules/                <- quality criteria"
echo "  ├── issue-board/          <- Kanban board"
echo "  └── scripts/              <- automation tools"
echo ""
echo "  Documentation : https://github.com/le-socle/socle"
echo ""
