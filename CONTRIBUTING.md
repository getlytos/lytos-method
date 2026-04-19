# Contributing to Lytos

*Contribution guide for Lytos project. Before submitting a PR, read this document in full.*

---

## How to contribute

Lytos is an open project. Contributions are welcome in the following areas:

| Contribution type | Description |
|-------------------|-------------|
| **New skill** | A reusable procedure for an uncovered use case |
| **New adapter** | A connector for an AI tool not yet supported |
| **Improvement** | Fix or enhancement of an existing skill, rule, or template |
| **Example** | A concrete example of using Lytos on a project type |
| **Documentation** | Correction, clarification, or translation |
| **Bug report** | Reporting an inconsistency or error |

---

## Proposing a new skill

A skill is an operational procedure that an agent can apply immediately. To propose a new skill:

### Acceptance criteria

1. **Operational** — an agent can apply it without additional interpretation
2. **Reusable** — useful across multiple projects, not specific to a single context
3. **Structured** — follows the format of existing skills (title, when to invoke, procedure, checklist)
4. **Verifiable** — each step produces an observable result. No vague verbs
5. **In French** — conceptual content is in French, code examples in English

### Writing unambiguous steps

A poorly written skill produces procedural hallucination: the agent believes it is following the procedure but fills in the gaps with its own logic, without flagging it.

**Forbidden words** in skill steps:

| Forbidden | Why | Replace with |
|-----------|-----|--------------|
| "si approprie" (if appropriate) | The agent decides alone, without flagging | Explicit criterion or "flag to human if..." |
| "evaluer" (evaluate) — alone | Too vague — evaluate what, how? | Checklist of points to verify |
| "considerer" (consider) | No observable result | Concrete action with output |
| "ameliorer" (improve) | Subjective — improve by what criterion? | Measurable criterion ("< 300 lines", "0 warnings") |
| "si necessaire" (if necessary) | The agent interprets what "necessary" means | Explicit condition ("if the file exceeds 300 lines") |

**Quality test**: for each step of the skill, ask — "can an agent follow this step mechanically, without subjective judgment?" If the answer is no, the step is too vague.

### Expected format

```markdown
# Skill — [Skill name]

*One sentence describing what this skill does.*

---

## When to invoke this skill

- ...

## Procedure

### 1. [Step]
...

## Checklist

- [ ] ...

---

*This skill is immediately operational...*
```

### Process

1. Open an issue with the **Skill Request** template
2. Discuss the scope in the issue
3. Write the skill
4. Submit a PR

---

## Proposing a new adapter

An adapter bridges Lytos and an AI tool. To propose a new adapter:

### Acceptance criteria

1. **Tested** — the adapter has been tested on a real project
2. **Complete** — it covers: configuration, loading the manifest/memory/skills, skill invocation, typical workflow
3. **Faithful to the method** — it does not modify the method, it adapts the tool

### Process

1. Create the folder `docs/en/adapters/[tool-name]/`
2. Place a complete `README.md` in it
3. Submit a PR

---

## PR format

### Title

```
type: short description
```

Types: `feat`, `fix`, `docs`, `chore`

Examples:
- `feat: add the deployment skill`
- `docs: clarify the code review procedure`
- `feat: add the adapter for Windsurf`

### PR body

```markdown
## Context
Why this contribution.

## Changes
- List of main modifications

## Tests
How to verify the contribution works.
```

### PR checklist

- [ ] Conceptual content is in French
- [ ] File and folder names are in English
- [ ] The format of existing files is respected
- [ ] No unnecessary jargon — understandable by a non-developer

---

## Conventions

### Language

- **Conceptual and philosophical content** → French
- **File names, folders, code** → English
- **Code examples** → comments can be in French or English, consistent with the example

### Style

- Each file starts with a sentence stating what it is and what it is for
- No unnecessary jargon — Lytos should be understandable by a non-developer
- Bullet lists rather than paragraphs when possible
- Tables for structured information

### Structure

- One file = one topic
- Long files are split up
- Each section is separated by `---`

---

## Code of conduct

- **Kindness** — every contribution is helpful, even if imperfect
- **Clarity** — favor understanding over exhaustiveness
- **Respect** — constructive feedback, no gratuitous criticism
- **Pragmatism** — what works in practice takes precedence over theory

Discussions take place in issues and PRs. No personal attacks, no condescension, no gatekeeping.

---

## Questions

For any question before contributing, open an issue with the `question` tag.

---

*Lytos is a community project. Every contribution improves it for everyone who uses it.*
