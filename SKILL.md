---
name: agent-harness
description: Install, initialize, repair, check, or apply the reusable Harness scaffold itself, including AGENTS.md, task dashboard, active/archive task directories, memory stubs, and .harness templates. Use only when a user asks to install, initialize, repair, audit, or update Harness files in a project, such as 初始化 Harness, 安装 Harness, 修复 Harness, 初始化项目看板, 创建任务管理结构, or set up task dashboard. Do not use for ordinary project task creation after Harness is installed; follow the target project's AGENTS.md and .harness workflow instead.
---

# Agent Harness

IRON LAW: Never overwrite an existing target-project Harness file unless the user explicitly asks for replacement in the current turn.

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

## Workflow

- [ ] Step 1: Inspect Target ⚠️ REQUIRED
  - [ ] Check only Harness paths listed in Scope.
  - [ ] Record which required paths already exist.
  - [ ] Do not inspect project business code, dependency files, or README content.
- [ ] Step 2: Install Or Repair ⚠️ REQUIRED
  - [ ] Copy only missing files from `templates/default/`.
  - [ ] Create only missing Harness directories.
  - [ ] Ask before replacing any existing Harness file.
  - [ ] Preserve project-level edits in existing `AGENTS.md`, `.harness/*.md`, `tasks/dashboard.md`, and `memory/*.md`.
- [ ] Step 3: Verify ⚠️ REQUIRED
  - [ ] Confirm every Required Path exists.
  - [ ] Confirm no non-Harness files were changed.
  - [ ] Report created, preserved, and skipped paths.

The `scripts/` directory installs this skill into an agent environment; do not use those scripts to scaffold a target project.

After installation, the target project's own `AGENTS.md` controls future workflow.

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
- Keep `tasks/dashboard.md` as the blank backlog scaffold with no real project tasks.
- Keep `memory/*.md` as blank structural stubs.
- Keep `tasks/active/` and `tasks/archive/` empty except `.gitkeep`.
- Do not introduce extra workflow directories unless the user explicitly requests a template expansion.

## Anti-Patterns

- Do not scan or summarize project source code while installing Harness.
- Do not overwrite existing Harness files without current-turn user confirmation.
- Do not create project-specific tasks, memory facts, or archive entries during install.
- Do not run `scripts/install.sh` to apply Harness to a target project; that script installs the skill itself.
- Do not continue into implementation after creating an active task unless the user confirms.
