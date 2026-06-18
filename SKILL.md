---
name: agent-harness
description: Install and maintain a lightweight project Harness with dashboard, active task files, archive templates, and memory stubs. Use when a user asks to initialize, repair, package, or apply this Harness structure to a repository.
---

# Agent Harness

Use this skill to install or repair the reusable Harness template in a project.

## Scope

This skill only manages Harness files:

```text
AGENTS.md
tasks/dashboard.md
tasks/active/
tasks/archive/
memory/project.md
memory/decisions.md
memory/pitfalls.md
.harness/
```

Do not inspect, copy, summarize, or modify project business code, dependency files, or README content while applying the Harness.

## Install

1. Check whether the target project already has Harness files.
2. Copy missing files from `templates/default/`.
3. Create missing directories.
4. Do not overwrite existing project files unless the user explicitly confirms.
5. Preserve project-level edits in existing `AGENTS.md`, `.harness/*.md`, `tasks/dashboard.md`, and `memory/*.md`.
6. After installation, the target project's own `AGENTS.md` controls future workflow.

## Completeness Check

Required paths:

```text
AGENTS.md
tasks/dashboard.md
tasks/active/.gitkeep
tasks/archive/.gitkeep
memory/project.md
memory/decisions.md
memory/pitfalls.md
.harness/active-create.md
.harness/active-task-template.md
.harness/active-execution.md
.harness/archive-template.md
```

If a path is missing, copy only that missing template. If a path exists, leave it unchanged unless the user explicitly asks for replacement.

## Maintenance

When updating this Harness template:

- Keep changes limited to Harness files.
- Do not add project-specific tasks, archive history, memory facts, or business context.
- Keep `tasks/dashboard.md` empty.
- Keep `memory/*.md` as blank structural stubs.
- Keep `tasks/active/` and `tasks/archive/` empty except `.gitkeep`.
- Do not introduce extra workflow directories unless the user explicitly requests a template expansion.
