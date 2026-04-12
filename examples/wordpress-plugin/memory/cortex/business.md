# Memory — Contexte métier

*Ce qu'on a appris sur le domaine métier au fil du projet.*

---

### Créneaux de réservation

**Règle** : Un créneau dure toujours 1 heure — pas de créneaux de durée variable pour le MVP.
**Pourquoi** : Le client a des consultations d'une heure. Simplification volontaire pour le MVP.
**Impact code** : Pas besoin de champ `durée` dans la table. Le créneau est défini par son heure de début.

### Confirmation immédiate

**Règle** : Les réservations sont confirmées immédiatement, pas de workflow de validation.
**Pourquoi** : Le client ne veut pas valider manuellement chaque réservation.
**Impact code** : Pas de champ `status` à gérer (confirmé/en attente). L'email part dès la soumission.

### Gestion des disponibilités

**Règle** : L'admin définit les créneaux manuellement — pas d'import calendrier externe.
**Pourquoi** : Le client utilise un agenda papier. L'import Google Calendar est envisagé pour le sprint #02.
**Impact code** : Interface admin simple avec un tableau de créneaux par semaine.

### Sprint #02 — anticipé

Le client a mentionné qu'il voudrait un export CSV des réservations. À prévoir.
