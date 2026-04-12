# Memory — Frontend

---

### Fichiers clés

| Fichier | Rôle |
|---------|------|
| `src/app/layout.tsx` | Layout racine, providers |
| `src/app/board/[id]/page.tsx` | Page d'un board (Server Component) |
| `src/components/board/Board.tsx` | Composant board client (drag & drop) |
| `src/components/card/Card.tsx` | Composant carte individuelle |
| `src/components/column/Column.tsx` | Composant colonne du Kanban |
| `src/stores/board-store.ts` | Store Zustand pour l'état du board |
| `src/hooks/use-drag.ts` | Hook custom pour le drag & drop |

### Dépendances frontend

- **@dnd-kit/core** — drag & drop accessible et performant
- **clsx + tailwind-merge** — gestion conditionnelle des classes CSS
- **zustand** — state management
- **lucide-react** — icônes
