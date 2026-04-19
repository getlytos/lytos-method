# Adapter — OpenAI API / Assistants

*Comment utiliser Lytos avec l'API OpenAI ou les Assistants GPT. Ce guide explique comment mapper les concepts de Lytos vers les mécanismes d'OpenAI.*

---

## Prérequis

- Un compte OpenAI avec accès à l'API ou aux Assistants
- Un projet avec Lytos initialisé dans `.lytos/`

---

## Mapping des concepts

| Lytos | OpenAI Assistants | OpenAI API (chat) |
|----------|-------------------|-------------------|
| Manifest | Instructions système (partie fixe) | Message système |
| Memory | File search / knowledge base | Injecté dans le contexte |
| Skills | Instructions système (partie variable) | Message système dynamique |
| Rules | Instructions système (contraintes) | Message système |
| Issue | Message utilisateur structuré | Message utilisateur |
| Agent | Un Assistant ou un thread | Un appel API |

---

## Avec les Assistants OpenAI

### 1. Créer l'Assistant de base

L'Assistant reçoit en instructions système le contenu du manifest et des rules :

```python
import openai

client = openai.OpenAI()

# Lire les fichiers de Lytos
with open('.lytos/manifest.md') as f:
    manifest = f.read()
with open('.lytos/rules/default-rules.md') as f:
    rules = f.read()
with open('.lytos/memory/MEMORY.md') as f:
    memory = f.read()

assistant = client.beta.assistants.create(
    name="Lytos Agent",
    instructions=f"""
Tu es un agent qui travaille selon la méthode Lytos.

# Manifest du projet
{manifest}

# Rules à respecter
{rules}

# Memory du projet
{memory}

# Comment travailler
1. Lis l'issue qui t'est assignée
2. Applique le skill correspondant
3. Respecte les rules à chaque instant
4. Signale tout apprentissage pour la memory
""",
    model="gpt-4o"
)
```

### 2. Charger un skill dynamiquement

Quand une tâche est assignée, le skill est injecté dans le thread :

```python
with open('.lytos/skills/code-review.md') as f:
    skill = f.read()

with open('.lytos/issue-board/ISS-0012.md') as f:
    issue = f.read()

thread = client.beta.threads.create()

# Injecter le skill et l'issue
client.beta.threads.messages.create(
    thread_id=thread.id,
    role="user",
    content=f"""
# Skill à appliquer
{skill}

# Issue à traiter
{issue}

Applique ce skill sur cette issue.
"""
)
```

### 3. Utiliser File Search pour la memory

Pour les projets avec une memory volumineuse, utiliser le File Search des Assistants :

```python
# Upload de la memory comme fichier searchable
file = client.files.create(
    file=open('.lytos/memory/MEMORY.md', 'rb'),
    purpose='assistants'
)

# Attacher au vector store de l'assistant
# L'assistant peut maintenant chercher dans la memory
```

---

## Avec l'API Chat (sans Assistants)

### Structure du message système

```python
def construire_contexte_lytos(skill_name, issue_id):
    """Construit le contexte Lytos pour un appel API."""

    with open('.lytos/manifest.md') as f:
        manifest = f.read()
    with open('.lytos/rules/default-rules.md') as f:
        rules = f.read()
    with open('.lytos/memory/MEMORY.md') as f:
        memory = f.read()
    with open(f'.lytos/skills/{skill_name}.md') as f:
        skill = f.read()
    with open(f'.lytos/issue-board/{issue_id}.md') as f:
        issue = f.read()

    return f"""
Tu es un agent qui travaille selon la méthode Lytos.
Tu n'as pas de persona, pas de rôle fixe. Tu appliques une procédure.

# Manifest
{manifest}

# Memory
{memory}

# Rules
{rules}

# Skill à appliquer
{skill}

# Issue en cours
{issue}
"""


# Appel API
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {
            "role": "system",
            "content": construire_contexte_lytos("code-review", "ISS-0012")
        },
        {
            "role": "user",
            "content": "Effectue la tâche décrite dans l'issue en suivant le skill chargé."
        }
    ]
)
```

---

## Orchestration multi-agents

Pour paralléliser des tâches (comme décrit dans `docs/en/agents/orchestrator.md`), lancer plusieurs appels API en parallèle :

```python
import asyncio

async def executer_tache(skill_name, issue_id):
    """Exécute une tâche de Lytos via l'API OpenAI."""
    contexte = construire_contexte_lytos(skill_name, issue_id)

    response = await client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": contexte},
            {"role": "user", "content": "Effectue la tâche."}
        ]
    )
    return response.choices[0].message.content


async def executer_vague(taches):
    """Exécute une vague de tâches en parallèle."""
    return await asyncio.gather(*[
        executer_tache(t['skill'], t['issue_id'])
        for t in taches
    ])


# Exemple : exécuter la vague 3 du sprint
vague_3 = [
    {"skill": "testing", "issue_id": "ISS-0003"},
    {"skill": "code-structure", "issue_id": "ISS-0004"},
]

resultats = asyncio.run(executer_vague(vague_3))
```

---

## Mise à jour de la memory

Après chaque tâche, demander à l'agent s'il y a des apprentissages :

```python
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": contexte},
        {"role": "user", "content": """
La tâche est terminée. Y a-t-il des apprentissages à ajouter 
à la memory du projet ? Si oui, formule-les au format :

### [Date] — [Titre court]
**Contexte** : ...
**Décision** : ...
**Conséquence** : ...
"""}
    ]
)
```

---

## Bonnes pratiques OpenAI

- **Ne pas mettre tout dans le system prompt** — le manifest et les rules suffisent. Le skill et l'issue viennent en message utilisateur
- **Utiliser GPT-4o** pour les tâches complexes (code review, architecture). GPT-4o mini suffit pour les tâches simples (documentation, formatage)
- **File Search pour les gros projets** — quand la memory dépasse la fenêtre de contexte
- **Pas de persona dans les instructions** — "Tu es un agent qui applique une procédure", pas "Tu es un expert senior"

---

*Cet adapter fait le pont entre l'API OpenAI et Lytos. La méthode reste la même — seul le mécanisme d'appel change.*
