# Agent Harness

Agent Harness is a reusable Codex skill that installs a lightweight project workflow scaffold:

- `AGENTS.md`
- `tasks/dashboard.md`
- `tasks/active/`
- `tasks/archive/`
- `memory/project.md`
- `memory/decisions.md`
- `memory/pitfalls.md`
- `.harness/`

This repository is the source of truth for the global skill installed at:

```text
~/.codex/skills/agent-harness/
```

## Install

Clone the repository and run the installer:

```bash
git clone https://github.com/<you>/agent-harness.git
cd agent-harness
./scripts/install.sh
```

The installer copies `SKILL.md` and `templates/` into `~/.codex/skills/agent-harness/`.
If an installation already exists, it is backed up first under `~/.codex/skills/`.

## Update

After pulling changes, run the installer again:

```bash
git pull
./scripts/install.sh
```

## Repository Layout

```text
agent-harness/
  README.md
  SKILL.md
  templates/
    default/
      AGENTS.md
      tasks/
      memory/
      .harness/
  scripts/
    install.sh
```

## Development Notes

Keep this repository generic. Do not commit project-specific tasks, archive history, memory facts, or business context.

The template should remain reusable across projects:

- `tasks/dashboard.md` should stay empty.
- `memory/*.md` should remain structural stubs.
- `tasks/active/` and `tasks/archive/` should contain only `.gitkeep`.
