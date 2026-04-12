# Memory — Patterns découverts

---

### Compound Components pour les formulaires

**Quoi** : Les formulaires complexes sont construits avec des sous-composants composables (`Form.Field`, `Form.Label`, `Form.Error`).
**Où** : `src/components/form/`
**Pourquoi ça marche** : Chaque sous-composant est simple et testable. La composition permet de varier la mise en page sans réécrire la logique.

### Optimistic updates via Zustand

**Quoi** : L'UI met à jour le store immédiatement, puis envoie la requête au serveur. Si la requête échoue, on rollback.
**Où** : `src/stores/board-store.ts` — actions `moveCard`, `updateCard`
**Pourquoi ça marche** : L'utilisateur ne voit jamais de "loading" sur le drag & drop. L'expérience est fluide.

### Server Component → Client Component boundary

**Quoi** : Les pages sont des Server Components qui fetchent les données. Les composants interactifs sont des Client Components qui reçoivent les données en props.
**Où** : `src/app/board/[id]/page.tsx` → `<Board data={boardData} />`
**Pourquoi ça marche** : Le fetch est côté serveur (rapide, pas de waterfall), l'interactivité est côté client.
