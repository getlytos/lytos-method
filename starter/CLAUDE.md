# CLAUDE.md

This project uses **Le Socle** — a human-first method for working with AI agents.

## First session (setup)

If the manifest is empty or incomplete, read first:
- .socle/SOCLE.md — understand the method and how to help fill the files

## Every session

Read these files in order:
1. .socle/manifest.md — the project constitution (identity, stack, principles, AI models)
2. .socle/memory/MEMORY.md — the memory summary (then load relevant cortex/ sections)
3. .socle/rules/default-rules.md — quality criteria

## To work on a task

4. .socle/issue-board/BOARD.md — board state
5. .socle/skills/session-start.md — full start and end-of-task procedure

## Rules

- The YAML frontmatter of issues is the source of truth
- Don't interpret silently — ask if an instruction is ambiguous
- At end of task: update frontmatter, move the file, update BOARD.md
- Check the issue's `complexity` field + the manifest table for which model to use

Documentation: https://github.com/le-socle/socle
