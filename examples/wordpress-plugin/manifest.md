# Manifest — Mon Plugin Réservation

*Ce fichier est la constitution du projet. Il est écrit par l'humain, lu par les agents à chaque session. Il ne change que si la vision change.*

---

## Identité

**Nom du projet** : Mon Plugin Réservation
**Description courte** : Plugin WordPress de réservation de créneaux horaires
**Date de création** : 2026-03-01
**Responsable** : Jean Dupont
**Version du socle** : 1.0

---

## Pourquoi ce projet existe

Les clients du site ont besoin de réserver des créneaux de consultation directement en ligne, sans passer par un échange de mails. Le plugin existant (BooklyLite) est trop lourd et ne correspond pas aux besoins spécifiques du métier. On construit un plugin sur mesure, léger, intégré au thème existant.

---

## Ce que ce projet est

Un plugin WordPress qui :
- Affiche un formulaire de réservation côté front (shortcode)
- Permet de choisir un créneau parmi les disponibilités définies en admin
- Envoie un email de confirmation à l'utilisateur et à l'admin
- Affiche la liste des réservations dans l'admin WordPress

---

## Ce que ce projet n'est pas

- Pas un système de paiement en ligne — la facturation est gérée séparément
- Pas un calendrier complet — juste des créneaux de réservation
- Pas multi-site — un seul site WordPress
- Pas compatible WooCommerce — c'est standalone

---

## Stack technique

```
Langage(s)     : PHP 8.1, JavaScript (vanilla)
Framework(s)   : WordPress 6.4+
Base de données : MySQL (tables custom via $wpdb)
Hébergement    : OVH mutualisé
Outils IA      : Claude Code
Autres         : Playwright pour les tests E2E
```

---

## Vocabulaire du projet

| Terme | Définition |
|-------|-----------|
| Créneau | Une plage horaire disponible à la réservation |
| Réservation | Un créneau réservé par un utilisateur |
| Disponibilité | L'ensemble des créneaux ouverts pour une semaine |
| Admin | L'interface d'administration WordPress |

---

## Contraintes fondamentales

- Compatible PHP 8.1+ et WordPress 6.4+
- Pas de dépendance npm côté front — JavaScript vanilla uniquement
- Les données restent dans la base WordPress (pas d'API externe)
- Accessibilité WCAG 2.1 AA sur le formulaire front

---

## Critères de succès

- Un utilisateur peut réserver un créneau en moins de 3 clics
- L'email de confirmation part dans les 30 secondes
- Le plugin s'active sans erreur sur une installation WordPress fraîche
- Les tests E2E couvrent le parcours complet de réservation

---

## Principes de développement

*Quand un agent hésite entre deux approches, il consulte ces principes pour trancher.*

- **WordPress natif plutôt que custom** — on utilise les API WordPress ($wpdb, WP_REST, wp_mail) plutôt que des librairies externes. Moins de dépendances = moins de risques de casse sur les mises à jour.
- **Simplicité plutôt que flexibilité** — ce plugin fait de la réservation. Pas un framework de réservation. On ne prévoit pas ce qui n'est pas dans le sprint.
- **Isolation plutôt qu'intégration** — le plugin ne doit jamais casser le thème existant. Préfixe `mpr_` sur tout, namespace CSS, template surchargeable.
- **Sécurité par défaut** — `$wpdb->prepare()` systématique, nonces sur tout, `esc_html()` sur tout output. Pas d'exception, pas de raccourci.

---

## Liens importants

| Ressource | URL |
|-----------|-----|
| Repo principal | https://github.com/jeandupont/mon-plugin-reservation |
| Documentation | /docs (dans le repo) |
| Staging | https://staging.monsitewp.fr |
| Production | https://www.monsitewp.fr |

---

*Dernière mise à jour : 2026-03-01*
