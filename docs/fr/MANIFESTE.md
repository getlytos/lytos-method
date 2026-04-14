# Le Manifeste de Lytos

*Version 1.0 — Avril 2026*

---

## I. Le biais des origines

L'humanité a toujours compris le nouveau par analogie avec l'ancien.

Les premières voitures s'appelaient des *horseless carriages* — des calèches sans cheval. Les premières pages web étaient des brochures papier numérisées. Les premières interfaces vocales imitaient le téléphone.

À chaque révolution technologique, le premier réflexe est de reproduire ce qu'on connaît dans le nouveau médium. Ce n'est pas de la paresse intellectuelle — c'est un mécanisme cognitif humain universel. On s'accroche à ce qu'on maîtrise pour apprivoiser ce qu'on ne comprend pas encore.

Aujourd'hui, face à la révolution des agents IA, l'industrie reproduit ce même réflexe.

On construit des équipes agiles virtuelles. On nomme des agents "LeadDev", "Expert UX", "Data Scientist". On leur donne des rôles, des personas, des backstories. On organise des sprints avec un orchestrateur qui joue le PM et des sous-agents qui jouent les développeurs.

On a mis un costume à l'intelligence artificielle.

Et ce faisant, on la limite peut-être plus qu'on ne le pense.

---

## II. Pourquoi l'équipe agile ne se transpose pas

L'équipe agile est une invention remarquable. Elle a résolu un problème réel : comment faire collaborer efficacement des êtres humains sur des projets complexes.

Mais elle a été conçue pour compenser des contraintes spécifiquement humaines :

- **La mémoire limitée** — un humain ne peut pas tout retenir, il se spécialise
- **La fatigue cognitive** — on ne peut pas maintenir une concentration maximale sur tout
- **Le coût de communication** — coordonner coûte cher, donc on regroupe par domaine
- **La montée en compétence** — apprendre prend des années, d'où la spécialisation précoce
- **L'ego et la motivation** — les humains ont besoin d'identité, de rôle, de reconnaissance

Un agent IA n'a pas ces contraintes sous la même forme.

Il peut travailler sur dix langages simultanément. Il ne se fatigue pas. La communication entre instances ne coûte presque rien. Il n'a pas d'ego à ménager. Il peut "oublier" ou "savoir" instantanément selon le contexte dans lequel on l'invoque.

Lui imposer un rôle fixe — lui dire "tu es un LeadDev senior, comporte-toi comme tel" — n'améliore pas, dans notre expérience, ses performances de manière fiable sur les dimensions qui comptent ici. Cela oriente son registre de réponse, le filtre vers certains angles, certain vocabulaire. C'est rassurant pour l'humain qui a besoin d'un interlocuteur identifiable.

Pris isolément, c'est davantage un cadrage rhétorique qu'une architecture opérationnelle.

Si les futures mises à jour des modèles rendent le prompting par personas plus fiable, la méthode pourra l'intégrer. Lytos n'est pas un dogme. Il cherche à placer la couche la plus robuste dans des fichiers que l'on contrôle.

---

## III. Le renversement

Lytos part d'une hypothèse inverse à la doxa dominante.

**Ce que fait l'industrie aujourd'hui :**
Les agents au centre → skills, memory, rules comme accessoires de configuration

**Ce que propose Lytos :**
Skills, memory, rules au centre → agents comme ressource computationnelle scalable

Ce renversement change tout.

L'agent n'est plus le sujet — il est le véhicule. Ce qui compte, c'est ce qu'il transporte et dans quel cadre il opère. Un agent sans fondation est une intelligence sans direction. Une fondation sans agent est un système en attente. C'est leur articulation qui crée la valeur.

---

## IV. L'analogie Kubernetes

Kubernetes n'a pas révolutionné l'informatique en améliorant les containers. Il l'a révolutionnée en changeant la question.

Avant : *comment je gère mes serveurs ?*
Après : *quel est l'état désiré de mon système ?*

Tu ne gères plus les machines individuellement. Tu définis un manifest — l'état désiré — et l'orchestrateur alloue les ressources pour l'atteindre. Les pods montent et descendent selon le besoin. Tu ne leur donnes pas de noms, tu ne leur fais pas de costumes. Ils sont de la compute, pas des personnes.

Lytos applique ce même renversement aux agents IA.

L'humain définit le manifest — l'intention, les contraintes, les procédures, les critères de qualité. L'orchestrateur alloue les agents selon le besoin. Les agents s'exécutent, se libèrent. Le système s'améliore à chaque cycle.

Le manifest est la source de vérité. Pas les agents.

---

## V. Les quatre piliers

### Skills — le savoir-faire capitalisé

Les skills sont d'abord des procédures. Pas des personas par défaut.

"Comment on fait une code review dans ce projet." "Comment on structure un module." "Comment on documente une API." "Comment on écrit un test Playwright."

Ce sont des process réutilisables, versionnés, auditables. Ils s'enrichissent avec l'expérience du projet. Un agent qui reçoit un skill sait exactement comment procéder — pas parce qu'il joue un rôle, mais parce qu'il applique une procédure définie.

### Rules — les critères de qualité

Les rules définissent ce que "bien fait" signifie dans ce projet.

Fichiers sous 300 lignes. PHPDoc systématique. Couverture de tests minimum 80%. Pas de couleurs en dur dans les composants. Ces règles ne sont pas génériques — elles sont spécifiques au projet, définies par l'humain, et elles ne changent pas selon l'agent qui travaille.

### Memory — le cerveau persistant

La memory est transversale à tous les sprints.

Elle accumule les décisions architecturales, les patterns découverts, les problèmes récurrents, les solutions qui ont fonctionné. Elle grandit avec le projet. Un agent qui démarre un nouveau sprint n'est pas vierge — il a accès à tout ce qui a été appris avant lui.

C'est proche du machine learning spécifique à un projet : une accumulation qui rend le système réellement meilleur sur ce contexte précis.

Ce n'est pas une fonctionnalité de mémoire propriétaire fournie par un vendor. C'est une mémoire projet externe : lisible, éditable, diffable, révisable, sauvegardable et portable.

### Manifest — l'intention humaine

Le manifest est la constitution du projet.

Il dit pourquoi le projet existe, ce qu'il cherche à accomplir, ses contraintes fondamentales, son vocabulaire commun. Il est écrit une fois par l'humain, rarement modifié. C'est la boussole que les agents consultent quand une décision dépasse le scope technique.

Le manifest est ce qu'aucun agent ne peut inférer seul. Il vient du dehors. Il porte le sens.

---

## VI. Le rôle de l'humain

L'humain n'est plus un "faiseur".

Ce n'est pas une perte — c'est une réaffectation vers ce que l'humain fait de mieux et que l'IA ne peut pas remplacer.

**Architecte du système** — il définit lytos. Les skills, les rules, la structure, les critères. Personne d'autre ne peut faire ça, parce que ça demande une compréhension intime du projet, de ses enjeux, de son contexte métier.

**Chef d'orchestre** — il fixe l'état désiré. Le sprint, les objectifs, les priorités. Il ne gère pas les agents individuellement, mais il décide où le système doit aller.

**Porteur d'intention** — il sait pourquoi. Le "pourquoi" d'un projet ne se lit pas dans les fichiers. Il vient de l'humain, de sa vision, de sa connaissance du terrain. C'est le ciment de tout le reste.

**Contrôleur** — il valide les outputs. Pas chaque ligne de code, mais les livrables, les directions, les arbitrages. L'humain est dans la boucle non pas pour micro-manager, mais pour s'assurer que le système optimise vers le bon objectif.

---

## VII. La complémentarité, pas le mimétisme

On ne demande pas à une entité différente de l'humain de se comporter comme un humain.

Ce serait comme demander à une calculatrice de "penser comme un mathématicien" pour mieux calculer. L'image est rassurante mais contre-productive.

Un agent IA peut lire et comprendre tous les langages de programmation existants. Aucun humain ne peut en faire autant. Ce n'est pas une défaite humaine — c'est simplement que l'IA et l'humain ne jouent pas le même jeu. Ils jouent des jeux différents, complémentaires.

L'humain apporte : le sens, l'intention, le contexte métier, le jugement, la vision.
L'agent apporte : l'exécution, la scalabilité, la précision technique, la mémoire parfaite des procédures.

Lytos est l'interface entre les deux.

---

## VIII. Ce que Lytos n'est pas

**Ce n'est pas un framework d'agents.** Il n'y a pas de code à installer pour "faire tourner des agents". Lytos est agnostique — il fonctionne avec Claude Code, Cursor, GPT, n'importe quel LLM.

**Ce n'est pas un outil IA.** C'est une méthode. Comme Agile est une méthode. Comme DevOps est une méthode. Elle s'implémente avec les outils que tu choisis.

**Ce n'est pas une équipe virtuelle.** Il n'y a pas de "membres" agents permanents. Il y a des ressources invoquées selon le besoin, qui disparaissent une fois la tâche accomplie.

**Ce n'est pas une solution clé en main.** Lytos fournit la structure et les templates. L'humain remplit le manifest, définit les skills, pose les rules. Sans cet investissement humain initial, le système n'a pas de direction.

---

## IX. Ce que la souveraineté change concrètement

Lytos ne rend pas seulement le contexte portable. Il change la nature de ce qu'un projet IA produit.

**Auditabilité** — ce qui guide l'IA n'est plus caché dans des conversations propriétaires. Cela devient de la matière projet visible et révisable.

**Réversibilité** — quand un modèle, une API ou un vendor change, tu ne perds pas ta méthode de travail. Tu changes de moteur sans reconstruire lytos depuis zéro.

**Capitalisation du savoir** — chaque sprint laisse des actifs derrière lui : décisions, procédures, règles, patterns. Le système s'améliore par accumulation.

**Continuité d'équipe** — le savoir projet survit aux resets de session, aux changements de personnes et aux migrations d'outils. Il est attaché au projet, pas enfermé dans l'historique de chat de quelqu'un.

**Gouvernance** — memory, rules et skills peuvent être versionnés, relus, sauvegardés, partagés et audités comme le reste du codebase.

---

## X. Les principes

1. **Le manifest prime.** Tout part de ce que l'humain a défini. Un agent sans manifest est aveugle.

2. **Les agents sont sans forme.** Pas de persona obligatoire, pas de rôle fixe. Ils prennent la forme du besoin, définie par le skill invoqué.

3. **La mémoire est vivante.** Elle grandit à chaque sprint. Un projet qui utilise Lytos depuis six mois est plus intelligent qu'au premier jour.

4. **Le contrôle est humain.** Les agents exécutent et proposent. L'humain valide, oriente, arbitre. Le "pourquoi" reste toujours côté humain.

5. **La complémentarité, pas le mimétisme.** On ne demande pas à l'IA d'être un humain. On lui demande d'être ce qu'elle est — et on construit autour de ça.

6. **Agnostique par principe.** Lytos ne dépend d'aucun vendor. Claude Code aujourd'hui, autre chose demain. La méthode persiste, les outils changent.

7. **La structure avant l'échelle.** On ne scale pas le chaos. Une fondation bien défini d'abord, des agents en nombre ensuite.

8. **La souveraineté par le texte.** Le savoir projet ne vit pas chez un vendor. Il vit dans des fichiers que tu possèdes, que tu versionnes, que tu relis, que tu sauvegardes et que tu migres librement. Le manifest est du markdown. Les skills sont du markdown. La memory est du markdown. Les rules sont du markdown. L'IA est un moteur interchangeable. Lytos est ce qui persiste. Cela ne garantit pas des outputs identiques entre tous les modèles. Cela garantit la continuité du contexte, des procédures et de la mémoire quand le moteur change. Le jour où un vendor change ses conditions, augmente ses prix, ou sort un modèle qui casse ton workflow — tu changes le moteur. Tu ne recommences pas à zéro.

---

## XI. Pour qui

Pour les développeurs, designers, chefs de projet qui travaillent avec des agents IA et qui cherchent une méthode plutôt qu'un empilement d'outils.

Pour ceux qui ont compris que "vibe coding" et "ingénierie traditionnelle" ne sont pas les seules options — qu'il existe un troisième chemin, structuré et complémentaire.

Pour ceux qui veulent que leurs projets IA soient maintenables, auditables, et améliorés par l'expérience accumulée.

Pour ceux qui ne veulent pas réduire l'intelligence artificielle à un costume.

---

*Lytos est né d'un constat et d'une conviction : la révolution IA ne se gagne pas en imitant ce qu'on connaît. Elle se gagne en inventant ce qu'on ne connaît pas encore.*

*Ce manifeste est un point de départ, pas une conclusion. Il évoluera avec les expériences de ceux qui l'utilisent.*

---
**Auteur** : Frédéric Galliné
**Licence** : MIT
**Repo** : [github.com/getlytos/lytos-method](https://github.com/getlytos/lytos-method)
**Site** : [lytos.org](https://lytos.org)
