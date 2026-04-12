# Memory — Frontend

*Patterns, pièges et solutions côté client. Charger ce fichier pour toute tâche frontend : UI, composants, styles, JavaScript.*

---

### Fichiers clés frontend

| Fichier | Rôle |
|---------|------|
| `templates/reservation-form.php` | Template front du formulaire (surchargable par le thème) |
| `assets/js/reservation-form.js` | JS du formulaire — validation + appel API REST |
| `assets/css/reservation-form.css` | Styles du formulaire (namespacé pour ne pas casser le thème) |

### Notes

- JavaScript vanilla uniquement — pas de jQuery
- Le formulaire est rendu via le shortcode `[mpr_reservation]`
- Le template peut être surchargé : le thème place `mpr/reservation-form.php` dans son dossier
