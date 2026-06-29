# AGENTS.md

IRON LAW: 在用户明确选择任务或确认执行前，始终停留在 Dashboard Mode；不要因为任务存在就读取大范围上下文或修改代码。

## 会话启动

每次新会话开始：

1. 进入 Dashboard Mode。
2. 优先检查 `tasks/dashboard.md`。
3. 不要立刻读代码。
4. 不要默认开始实现。
5. 等待用户拍板。

如果 `tasks/dashboard.md` 不存在，则创建最小 Harness：

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

初始化时不要编造项目背景、任务历史、架构事实或业务规则。

---

## Dashboard Mode

Dashboard 是项目控制台，只展示：

* 当前任务 summary
* priority
* 当前状态
* 当前建议
* 当前阻塞

Dashboard 不写详细任务内容。详细内容必须放在 `tasks/active/*.md`。

当存在多个可做任务时，不要自作主张；展示 dashboard，并等待用户拍板。

---

## Dashboard Format

Dashboard 使用紧凑 table 风格：

```text
当前 backlog 给你拍板

┌─────────────────┬────┬──────────────┬────────────┐
│ ID              │ 优先 │ 事项         │ 状态       │
├─────────────────┼────┼──────────────┼────────────┤
│ 20260624-153245 │ P0 │ 示例任务      │ 等拍板     │
└─────────────────┴────┴──────────────┴────────────┘

当前建议：
xxx

当前阻塞：
暂无
```

规则：

* 事项名称尽量简短。
* 状态使用短词。
* 不输出长篇分析。
* 即使中文宽度导致轻微错位，也保持 table 结构。
* 不要退化成长段列表。

---

## 状态词

Dashboard 状态优先使用纯文本短状态：

```text
等拍板
开发中
调研中
未提交
已完成
BLOCKED
```

`已完成` 只作为短暂过渡状态，不长期保留在 dashboard。

---

## 路由规则

添加任务时，读取并执行：

```text
.harness/active-create.md
```

执行任务时，读取并执行：

```text
.harness/active-execution.md
```

触发语规则：

* “添加任务 / 新增任务 / 记个任务 / 做 P0 / 优化 P0”进入 active-create。
* “执行 / 开始实现 / continue / go / 按这个 plan 做”进入 active-execution。
* “开始某任务”有歧义：如果 active task 不存在，先进入 active-create；如果 active task 已存在，先展示任务 summary 和简短 plan，等待用户确认后再进入 active-execution。

active task 必须一个任务一个文件，并使用 `.harness/active-task-template.md` 创建。创建后默认不直接执行。

---

## Task ID

任务 ID 必须使用创建时间：

```text
YYYYMMDD-HHmmss
```

规则：

* active 文件名必须使用 `tasks/active/{ID}-{slug}.md`。
* archive 文件名必须保留同一个 ID。
* dashboard 的 ID 列展示同一个 ID。
* 不要使用 `101`、`102` 这类递增编号。
* 不要维护 `next_task_id` 或额外编号状态文件。
* 如果同一秒内发生冲突，在 ID 后追加 `-2`、`-3`。

---

## 上下文加载

默认不要读取全部：

```text
tasks/active/
memory/
```

只允许按需读取：

* 用户明确选择的 active task
* 当前任务相关 project context
* 最近相关 decisions
* 最近相关 pitfalls

避免无关历史、大量旧上下文、全量 memory、重复读取同一内容。

---

## Memory

`memory/project.md` 只记录：

* 项目目标
* 核心模块
* 当前重点
* 高层架构方向

只有以下内容允许进入 memory：

1. 长期有效架构决策。
2. 高价值踩坑。
3. 可复用模式。

不要写流水账、临时过程、普通完成记录或大量聊天总结。memory 必须保持高信噪比。

---

## Coding

进入实现前必须先给出简短 plan。

实现时：

* 保持最小改动。
* 不做无关重构。
* 不确定时先问。
* 优先可维护性。
* build/test 失败禁止声称完成。

---

## 完成与归档

归档细节由 `.harness/active-execution.md` 控制。

不要归档或移除 active task，除非已经满足：

* 实现已经完成，或明确无法继续。
* review 和 build/test 已执行，或已说明无法执行的原因。
* archive 结果明确为 `SUCCESS`、`FAIL` 或 `PARTIAL`。
* 结论中包含具体验证结果和剩余风险。

已归档任务不应继续保留在 `tasks/active/` 或 `tasks/dashboard.md`。

---

## 交付前检查

最终回复前检查：

* 如果存在 active task，已更新对应 Status / Next Step。
* Dashboard 只展示未完成工作。
* 只为完成或明确终止的任务创建 archive。
* Memory 只记录长期有效决策、踩坑或可复用模式。
* 最终回复包含验证结果和剩余风险。
