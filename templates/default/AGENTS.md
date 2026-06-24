# AGENTS.md

## Session Startup

每次新会话开始：

1. 进入 Dashboard Mode
2. 不要立刻读代码
3. 不要默认开始实现
4. 等待用户拍板

启动时优先检查：

```text
tasks/dashboard.md
```

如果不存在，则创建最小 Harness：

```text
tasks/
  dashboard.md
  active/
  archive/

memory/
  project.md
  decisions.md
  pitfalls.md

.harness/
  active-create.md
  active-task-template.md
  active-execution.md
  archive-template.md
```

初始化时不要编造项目背景。

---

## Dashboard Mode

Dashboard 是项目控制台。

它只负责：

* 当前任务 summary
* priority
* 当前状态
* 当前建议
* 当前阻塞

不要在 dashboard 写详细任务内容。

详细内容必须放在：

```text
tasks/active/*.md
```

不要自动进入 coding。

---

## Dashboard Format

Dashboard 必须使用紧凑 table 风格：

```text
当前 backlog 给你拍板

┌─────────────────┬────┬──────────────┬────────────┐
│ ID              │ 优先 │ 事项         │ 状态       │
├─────────────────┼────┼──────────────┼────────────┤
│ 20260624-153245 │ P0 │ 示例任务      │ ⏳ 等拍板  │
└─────────────────┴────┴──────────────┴────────────┘

当前建议：
xxx

当前阻塞：
暂无
```

规则：

* Dashboard 只展示 summary
* 事项名称尽量简短
* 状态尽量简短
* 不输出长篇分析
* 即使中文宽度导致轻微错位，也保持 table 结构
* 不要退化成长段列表

---

## Task ID Rules

任务 ID 必须使用创建时间，格式：

```text
YYYYMMDD-HHmmss
```

示例：

```text
20260624-153245
```

规则：

* 创建 active task 时，用当前创建时间生成 ID
* active 文件名必须使用 `tasks/active/{ID}-{slug}.md`
* archive 文件名必须保留同一个 ID
* dashboard 的 ID 列展示同一个 ID
* 不要使用 `101`、`102` 这类递增编号
* 不要维护 `next_task_id` 或额外编号状态文件
* 如果同一秒内发生冲突，在 ID 后追加 `-2`、`-3`

---

## Recommended Status Vocabulary

Dashboard 状态优先使用短状态词。

推荐：

```text
⏳ 等拍板
🚧 开发中
🔬 调研中
📦 未 commit
✅ 已完成
🚫 BLOCKED
```

规则：

* 状态尽量简短
* 优先 2~6 个字
* 保持高可读性
* 避免长句状态
* 同一项目尽量保持状态词一致

---

## Active Rules

添加任务时：

读取：

```text
.harness/active-create.md
```

执行任务时：

读取：

```text
.harness/active-execution.md
```

active task 必须：

* 一个任务一个文件
* 使用 template 创建
* 默认创建后不直接执行

只有用户明确说：

* “执行”
* “continue”
* “go”
* “开始实现”

才允许进入 execution。

---

## Active Loading Rules

默认不要读取全部：

```text
tasks/active/
```

只有用户明确选择任务时，才读取对应 active task。

避免无关 active task 进入上下文。

---

## Project Context Rules

项目相关信息放在：

```text
memory/project.md
```

它只用于：

* 项目目标
* 核心模块
* 当前重点
* 高层架构方向

不要把 project.md 写成百科全书。

---

## Context Loading Rules

默认不要读取全部 memory。

只允许按需读取：

* 当前 active task
* 当前任务相关 project context
* 最近相关 decisions
* 最近相关 pitfalls

避免：

* 无关历史
* 大量旧上下文
* 全量 memory
* 重复读取同一内容

优先保持上下文简洁。

避免上下文腐化。

---

## Workflow

默认流程：

```text
dashboard
→ user decision
→ create active
→ review plan
→ user confirm
→ implement
→ review
→ build/test
→ update dashboard
→ archive if done
→ update memory if useful
```

开始实现前必须先给出简短 plan。

---

## Memory Rules

只有以下内容允许进入 memory：

1. 长期有效架构决策
2. 高价值踩坑
3. 可复用模式

不要写：

* 流水账
* 临时过程
* 普通完成记录
* 大量聊天总结

memory 必须保持高信噪比。

---

## Coding Rules

* 保持最小改动
* 不做无关重构
* build/test 失败禁止声称完成
* 不确定时先问
* 优先可维护性

---

## Completion Rules

任务完成后必须：

1. 从 dashboard 移除该任务
2. 读取 `.harness/archive-template.md`
3. 生成 archive
4. 从 `tasks/active/` 移除对应 task
5. 如有必要更新 memory
6. 输出：

```md
## 完成了什么
## 如何验证
## 风险
## Harness 更新
```

active 目录只保留：

* ⏳ 等拍板
* 🚧 开发中
* 🔬 调研中
* 🚫 BLOCKED

已归档任务不应继续保留在 active。

已归档任务不应继续保留在 dashboard。

dashboard 只展示：

* ⏳ 等拍板
* 🚧 开发中
* 🔬 调研中
* 🚫 BLOCKED

不要将：

```text
✅ 已完成
```

长期保留在 dashboard。

---

## User Decision Rule

当存在多个可做任务时：

不要自作主张。

必须展示 dashboard，并等待用户拍板。
