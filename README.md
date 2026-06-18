# Agent Harness

[中文说明](#中文说明)

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

### 1. Direct install without cloning

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install.sh | bash
```

To install a specific branch or tag:

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install.sh | NAT_HARNESS_REF=main bash
```

This installer backs up an existing `~/.codex/skills/agent-harness/` directory before replacing it.

### 2. Install with Codex skill-installer

Run the built-in skill installer script:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py --repo kyosky110/natHarness --path . --name agent-harness
```

This method installs through Codex's built-in `skill-installer`. It is best for first-time installation because it stops if `~/.codex/skills/agent-harness/` already exists.

### 3. Clone for development

```bash
git clone https://github.com/kyosky110/natHarness.git
cd natHarness
./scripts/install.sh
```

Restart Codex after installing with any method.

Methods 1 and 3 copy `SKILL.md` and `templates/` into `~/.codex/skills/agent-harness/`.
If an installation already exists, they back it up first under `~/.codex/skills/`.

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

## 中文说明

Agent Harness 是一个可复用的 Codex skill，用来给项目安装一套轻量级的协作与任务管理骨架：

- `AGENTS.md`
- `tasks/dashboard.md`
- `tasks/active/`
- `tasks/archive/`
- `memory/project.md`
- `memory/decisions.md`
- `memory/pitfalls.md`
- `.harness/`

这个仓库是 skill 的源码仓库。安装后，skill 会被放到：

```text
~/.codex/skills/agent-harness/
```

### 安装

#### 1. 不 clone，直接安装

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install.sh | bash
```

安装指定分支或 tag：

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install.sh | NAT_HARNESS_REF=main bash
```

这种方式会在覆盖 `~/.codex/skills/agent-harness/` 前自动备份旧版本。

#### 2. 通过 Codex skill-installer 安装

执行内置 skill-installer 脚本：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py --repo kyosky110/natHarness --path . --name agent-harness
```

这种方式使用 Codex 内置的 `skill-installer`。它更适合首次安装，因为如果 `~/.codex/skills/agent-harness/` 已经存在，它会停止而不是覆盖。

#### 3. clone 后用于开发

```bash
git clone https://github.com/kyosky110/natHarness.git
cd natHarness
./scripts/install.sh
```

任一方式安装后，都需要重启 Codex 才会生效。

方式 1 和方式 3 会把 `SKILL.md` 和 `templates/` 复制到 `~/.codex/skills/agent-harness/`。
如果本机已经安装过，会先在 `~/.codex/skills/` 下备份旧版本。

### 更新

如果是 clone 后本地安装，更新方式是：

```bash
git pull
./scripts/install.sh
```

如果是直接安装，重新执行安装命令即可：

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install.sh | bash
```

### 仓库结构

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

### 开发注意事项

这个仓库应该保持通用，不要提交具体项目的任务、归档历史、记忆内容或业务上下文。

模板应保持可复用：

- `tasks/dashboard.md` 保持为空。
- `memory/*.md` 只保留结构占位内容。
- `tasks/active/` 和 `tasks/archive/` 只保留 `.gitkeep`。
