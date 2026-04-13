# The Manifesto of Le Socle

*Version 1.0 — April 2026*

---

## I. The bias of origins

Humanity has always understood the new by analogy with the old.

The first cars were called *horseless carriages*. The first web pages were digitized paper brochures. The first voice interfaces mimicked the telephone.

At every technological revolution, the first reflex is to reproduce what we know in the new medium. This is not intellectual laziness — it is a universal human cognitive mechanism. We cling to what we master in order to tame what we do not yet understand.

Today, facing the AI agent revolution, the industry is repeating the same reflex.

We build virtual agile teams. We name agents "LeadDev", "UX Expert", "Data Scientist". We give them roles, personas, backstories. We organize sprints with an orchestrator playing PM and sub-agents playing developers.

We put a costume on artificial intelligence.

And in doing so, we limited it.

---

## II. Why the agile team does not transpose

The agile team is a remarkable invention. It solved a real problem: how to make human beings collaborate effectively on complex projects.

But it was designed to compensate for specifically human constraints:

- **Limited memory** — a human cannot remember everything, so they specialize
- **Cognitive fatigue** — no one can maintain peak focus on everything
- **Communication cost** — coordination is expensive, so we group by domain
- **Skill acquisition** — learning takes years, hence early specialization
- **Ego and motivation** — humans need identity, role, recognition

An AI agent has none of these constraints.

It can be expert in ten languages simultaneously. It does not get tired. Communication between instances costs nothing. It has no ego to manage. It can "forget" or "know" instantly depending on the context in which it is invoked.

Imposing a fixed role on it — telling it "you are a senior LeadDev, behave accordingly" — does not improve its performance. It steers its response register, filters it toward certain angles, certain vocabulary. It is reassuring for the human who needs an identifiable counterpart.

It is not architecture. It is theater.

---

## III. The reversal

Le Socle starts from a hypothesis that is the inverse of the dominant orthodoxy.

**What the industry does today:**
Agents at the center → skills, memory, rules as configuration accessories

**What Le Socle proposes:**
Skills, memory, rules at the center → agents as scalable computational resource

This reversal changes everything.

The agent is no longer the subject — it is the vehicle. What matters is what it carries and the framework within which it operates. An agent without a socle is intelligence without direction. A socle without an agent is a system on standby. It is their articulation that creates value.

---

## IV. The Kubernetes analogy

Kubernetes did not revolutionize computing by improving containers. It revolutionized it by changing the question.

Before: *how do I manage my servers?*
After: *what is the desired state of my system?*

You no longer manage machines individually. You define a manifest — the desired state — and the orchestrator allocates resources to reach it. Pods scale up and down as needed. You do not give them names, you do not give them costumes. They are compute, not people.

Le Socle applies this same reversal to AI agents.

The human defines the manifest — the intent, the constraints, the procedures, the quality criteria. The orchestrator allocates agents as needed. Agents execute, then release. The system improves with every cycle.

The manifest is the source of truth. Not the agents.

---

## V. The four pillars

### Skills — capitalized know-how

Skills are procedures. Not personas.

"How we do a code review in this project." "How we structure a module." "How we document an API." "How we write a Playwright test."

These are reusable, versioned, auditable processes. They grow richer with project experience. An agent that receives a skill knows exactly how to proceed — not because it plays a role, but because it applies a defined procedure.

### Rules — quality criteria

Rules define what "well done" means in this project.

Files under 300 lines. Systematic PHPDoc. Minimum 80% test coverage. No hardcoded colors in components. These rules are not generic — they are project-specific, defined by the human, and they do not change depending on which agent is working.

### Memory — the persistent brain

Memory is transversal across all sprints.

It accumulates architectural decisions, discovered patterns, recurring problems, solutions that worked. It grows with the project. An agent starting a new sprint is not a blank slate — it has access to everything learned before it.

This is close to project-specific machine learning: an accumulation that makes the system genuinely better in that precise context.

### Manifest — human intent

The manifest is the project's constitution.

It states why the project exists, what it seeks to accomplish, its fundamental constraints, its shared vocabulary. It is written once by the human, rarely modified. It is the compass agents consult when a decision exceeds technical scope.

The manifest is what no agent can infer on its own. It comes from the outside. It carries the meaning.

---

## VI. The role of the human

The human is no longer a "doer".

This is not a loss — it is a reallocation toward what the human does best and what AI cannot replace.

**System architect** — they define the socle. The skills, the rules, the structure, the criteria. No one else can do this, because it demands an intimate understanding of the project, its stakes, its business context.

**Conductor** — they set the desired state. The sprint, the objectives, the priorities. They do not manage agents individually, but they decide where the system must go.

**Bearer of intent** — they know the why. The "why" of a project cannot be read from files. It comes from the human, from their vision, from their knowledge of the terrain. It is the cement that holds everything else together.

**Controller** — they validate outputs. Not every line of code, but the deliverables, the directions, the trade-offs. The human is in the loop not to micromanage, but to ensure the system optimizes toward the right objective.

---

## VII. Complementarity, not mimicry

We do not ask an entity different from humans to behave like a human.

That would be like asking a calculator to "think like a mathematician" in order to calculate better. The image is reassuring but counterproductive.

An AI agent can read and understand every programming language in existence. No human can do the same. This is not a human defeat — it is simply that AI and humans are not playing the same game. They play different games, complementary ones.

The human brings: meaning, intent, business context, judgment, vision.
The agent brings: execution, scalability, technical precision, perfect recall of procedures.

Le Socle is the interface between the two.

---

## VIII. What Le Socle is not

**It is not an agent framework.** There is no code to install to "run agents". Le Socle is agnostic — it works with Claude Code, Cursor, GPT, any LLM.

**It is not an AI tool.** It is a method. Like Agile is a method. Like DevOps is a method. It is implemented with whatever tools you choose.

**It is not a virtual team.** There are no permanent agent "members". There are resources invoked as needed, that vanish once the task is done.

**It is not a turnkey solution.** Le Socle provides the structure and the templates. The human fills in the manifest, defines the skills, sets the rules. Without this initial human investment, the system has no direction.

---

## IX. The principles

1. **The manifest comes first.** Everything starts from what the human has defined. An agent without a manifest is blind.

2. **Agents are formless.** No persona, no fixed role. They take the shape of the need, defined by the skill invoked.

3. **Memory is alive.** It grows with every sprint. A project that has been using Le Socle for six months is smarter than on day one.

4. **Control is human.** Agents execute and propose. The human validates, steers, arbitrates. The "why" always remains on the human side.

5. **Complementarity, not mimicry.** We do not ask AI to be human. We ask it to be what it is — and we build around that.

6. **Agnostic by principle.** Le Socle depends on no vendor. Claude Code today, something else tomorrow. The method persists, the tools change.

7. **Structure before scale.** You do not scale chaos. A well-defined socle first, agents in numbers second.

8. **Sovereignty through text.** Project knowledge does not live inside a vendor. It lives in files you own, you version, you migrate freely. The manifest is markdown. Skills are markdown. Memory is markdown. Rules are markdown. The AI is an interchangeable engine. The socle is what persists. The day a vendor changes its terms, raises its prices, or ships a model that breaks your workflow — you switch the engine. You do not start over.

---

## X. For whom

For developers, designers, project managers who work with AI agents and seek a method rather than a pile of tools.

For those who understand that "vibe coding" and "traditional engineering" are not the only options — that a third path exists, structured and complementary.

For those who want their AI projects to be maintainable, auditable, and improved by accumulated experience.

For those who refuse to put a costume on artificial intelligence.

---

*Le Socle was born from an observation and a conviction: the AI revolution is not won by imitating what we know. It is won by inventing what we do not yet know.*

*This manifesto is a starting point, not a conclusion. It will evolve with the experiences of those who use it.*

---
**Author**: Frédéric Galliné
**License**: MIT
**Repo**: [github.com/le-socle/socle](https://github.com/le-socle/socle)
**Site**: [le-socle.org](https://le-socle.org)
