# Agent Harness

[中文说明](#中文说明)

Agent Harness is a reusable Codex and Claude Code skill that installs a lightweight project workflow scaffold:

- `AGENTS.md`
- `tasks/dashboard.md`
- `tasks/active/`
- `tasks/archive/`
- `memory/project.md`
- `memory/decisions.md`
- `memory/pitfalls.md`
- `.harness/`

This repository is the source of truth for the skill installed at:

```text
~/.codex/skills/agent-harness/
~/.claude/skills/agent-harness/
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

### 4. Install for Claude Code

Install directly into Claude Code's personal skills directory:

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install-claude-code.sh | bash
```

Or from a local clone:

```bash
./scripts/install-claude-code.sh
```

This copies `SKILL.md` and `templates/` into `~/.claude/skills/agent-harness/`.

Restart Codex or Claude Code after installing with any method.

Methods 1 and 3 copy `SKILL.md` and `templates/` into `~/.codex/skills/agent-harness/`.
If an installation already exists, they back it up first under `~/.codex/skills/`.
Method 4 copies them into `~/.claude/skills/agent-harness/` and backs up an existing Claude Code skill first.

## Usage Examples

After installing and restarting Codex or Claude Code, open a target project and ask:

```text
Use agent-harness to initialize this project.
```

In Claude Code, you can invoke the skill explicitly:

```text
/agent-harness initialize this project
```

To check and repair missing Harness files:

```text
Use agent-harness to check and repair the Harness files in this project.
```

To install only the Harness scaffold without touching business code:

```text
Use agent-harness to install the Harness scaffold only. Do not modify project source code.
```

Expected project files:

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

## Example Workflow

User:

```text
Use agent-harness to start a task: add GitHub Actions CI to this project.
```

Codex or Claude Code creates or updates Harness files before editing project source code, for example:

```text
tasks/dashboard.md
tasks/active/20260624-153245-github-actions-ci.md
```

The dashboard may show:

```text
当前 backlog 给你拍板

┌─────────────────┬────┬───────────────────────┬────────────┐
│ ID              │ 优先 │ 事项                  │ 状态       │
├─────────────────┼────┼───────────────────────┼────────────┤
│ 20260624-153245 │ P1 │ Add GitHub Actions CI  │ ⏳ 等拍板  │
└─────────────────┴────┴───────────────────────┴────────────┘
```

Codex or Claude Code then waits for user approval:

```text
I created the task draft and prepared an execution plan. Confirm when you want me to start changing project files.
```

User:

```text
Confirmed. Start implementation.
```

Codex or Claude Code then implements the task, updates the active task file, and archives it after completion.

## Task IDs

Harness task IDs use the task creation timestamp:

```text
YYYYMMDD-HHmmss
```

Example active task path:

```text
tasks/active/20260624-153245-github-actions-ci.md
```

The same ID is shown in `tasks/dashboard.md` and preserved when the task is archived.
Harness does not use incremental IDs such as `101` or maintain a `next_task_id` state file.

## What Gets Installed

- `AGENTS.md`: Project-level instructions for future Codex sessions.
- `tasks/dashboard.md`: A lightweight task dashboard for tracking current work.
- `tasks/active/`: Active task files for ongoing work.
- `tasks/archive/`: Archived task records after work is completed.
- `memory/project.md`: Stable project facts, conventions, and background.
- `memory/decisions.md`: Important technical or workflow decisions.
- `memory/pitfalls.md`: Known pitfalls, gotchas, and things to avoid.
- `.harness/`: Reusable workflow templates used by the Harness.

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
    install-claude-code.sh
```

## Development Notes

Keep this repository generic. Do not commit project-specific tasks, archive history, memory facts, or business context.

The template should remain reusable across projects:

- `tasks/dashboard.md` should stay empty.
- `memory/*.md` should remain structural stubs.
- `tasks/active/` and `tasks/archive/` should contain only `.gitkeep`.

## 中文说明

Agent Harness 是一个可复用的 Codex 和 Claude Code skill，用来给项目安装一套轻量级的协作与任务管理骨架：

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
~/.claude/skills/agent-harness/
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

#### 4. 安装到 Claude Code

直接安装到 Claude Code 的个人 skills 目录：

```bash
curl -fsSL https://raw.githubusercontent.com/kyosky110/natHarness/main/scripts/install-claude-code.sh | bash
```

如果已经 clone 到本地，也可以执行：

```bash
./scripts/install-claude-code.sh
```

这种方式会把 `SKILL.md` 和 `templates/` 复制到 `~/.claude/skills/agent-harness/`。

任一方式安装后，都需要重启 Codex 或 Claude Code 才会生效。

方式 1 和方式 3 会把 `SKILL.md` 和 `templates/` 复制到 `~/.codex/skills/agent-harness/`。
如果本机已经安装过，会先在 `~/.codex/skills/` 下备份旧版本。
方式 4 会复制到 `~/.claude/skills/agent-harness/`，并在覆盖前备份已有 Claude Code skill。

### 使用示例

安装并重启 Codex 或 Claude Code 后，在目标项目里说：

```text
使用 agent-harness 初始化当前项目。
```

在 Claude Code 里也可以显式调用：

```text
/agent-harness 初始化当前项目
```

检查并修复缺失的 Harness 文件：

```text
使用 agent-harness 检查并修复当前项目缺失的 Harness 文件。
```

只安装 Harness，不修改业务代码：

```text
使用 agent-harness 只安装 Harness 脚手架，不要修改项目源码。
```

预期生成或补齐的项目文件：

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

### 示例工作流

用户：

```text
使用 agent-harness 帮我开始一个任务：给这个项目添加 GitHub Actions CI。
```

Codex 或 Claude Code 会先创建或更新 Harness 文件，而不是直接修改项目源码，例如：

```text
tasks/dashboard.md
tasks/active/20260624-153245-github-actions-ci.md
```

`tasks/dashboard.md` 可能显示：

```text
当前 backlog 给你拍板

┌─────────────────┬────┬───────────────────────┬────────────┐
│ ID              │ 优先 │ 事项                  │ 状态       │
├─────────────────┼────┼───────────────────────┼────────────┤
│ 20260624-153245 │ P1 │ 添加 GitHub Actions CI │ ⏳ 等拍板  │
└─────────────────┴────┴───────────────────────┴────────────┘
```

然后 Codex 或 Claude Code 会等待用户拍板：

```text
我已经创建任务草稿，并整理了执行计划。确认后我再开始修改项目文件。
```

用户：

```text
确认，开始执行。
```

之后 Codex 或 Claude Code 才开始执行任务，更新 active task 文件，并在完成后归档任务。

### 任务 ID

Harness 任务 ID 使用任务创建时间：

```text
YYYYMMDD-HHmmss
```

示例 active task 路径：

```text
tasks/active/20260624-153245-github-actions-ci.md
```

同一个 ID 会显示在 `tasks/dashboard.md`，并在归档时保留。
Harness 不使用 `101` 这类递增编号，也不维护 `next_task_id` 状态文件。

### 安装内容说明

- `AGENTS.md`：当前项目的 Codex 工作说明，后续会话会优先参考这里。
- `tasks/dashboard.md`：轻量任务看板，用来记录当前任务状态。
- `tasks/active/`：进行中的任务文件。
- `tasks/archive/`：已完成任务的归档记录。
- `memory/project.md`：项目长期事实、约定和背景。
- `memory/decisions.md`：重要技术决策或流程决策。
- `memory/pitfalls.md`：踩坑记录、注意事项和需要避免的问题。
- `.harness/`：Harness 使用的工作流模板。

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
    install-claude-code.sh
```

### 开发注意事项

这个仓库应该保持通用，不要提交具体项目的任务、归档历史、记忆内容或业务上下文。

模板应保持可复用：

- `tasks/dashboard.md` 保持为空。
- `memory/*.md` 只保留结构占位内容。
- `tasks/active/` 和 `tasks/archive/` 只保留 `.gitkeep`。
