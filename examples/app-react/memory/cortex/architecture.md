# Memory — Architecture & Décisions techniques

---

### 2026-03-20 — Next.js App Router plutôt que Pages Router

**Contexte** : Le Pages Router est plus documenté, mais l'App Router est le futur de Next.js.
**Décision** : App Router avec Server Components par défaut.
**Conséquence** : Les composants qui ont besoin d'état ou d'événements doivent être marqués `'use client'`. Plus de discipline mais meilleure performance.

### 2026-03-20 — Zustand plutôt que Redux ou Context

**Contexte** : Redux est trop verbeux pour ce projet. Context re-rend trop.
**Décision** : Zustand pour le state management global.
**Conséquence** : Stores simples, pas de boilerplate. Chaque store est un hook. Les Server Components ne peuvent pas accéder aux stores — le state est passé en props ou via des Client Components wrapper.

### 2026-03-21 — Tailwind plutôt que CSS Modules

**Contexte** : L'équipe est à l'aise avec Tailwind. Cohérent avec l'écosystème Next.js/Vercel.
**Décision** : Tailwind CSS pour tout le styling.
**Conséquence** : Pas de fichiers CSS séparés. Les variantes sont gérées via `clsx` + `tailwind-merge`.
