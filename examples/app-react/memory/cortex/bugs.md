# Memory — Problèmes récurrents & Solutions

---

| Problème | Cause | Solution |
|----------|-------|----------|
| Hydration mismatch sur les dates | Le serveur formate la date en UTC, le client en locale | Utiliser `suppressHydrationWarning` sur le composant date, ou formater côté client uniquement |
| Drag & drop ne fonctionne pas sur mobile | `@dnd-kit` nécessite les touch sensors | Ajouter `TouchSensor` et `MouseSensor` dans `useSensors()` |
| Store Zustand vide au premier render SSR | Les stores client ne sont pas disponibles côté serveur | Hydrater le store dans un `useEffect` après le mount, ou passer les données initiales en props |
