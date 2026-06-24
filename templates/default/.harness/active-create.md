# Active Create Rule

当用户说：

* “添加任务”
* “新增任务”
* “记个任务”
* “做 P0”
* “优化 P0”
* “开始某任务”

时：

执行 active create。

---

## Steps

1. 从用户输入或 `tasks/dashboard.md` 找到对应任务
2. 读取 `.harness/active-task-template.md`
3. 生成任务 ID，格式为当前创建时间 `YYYYMMDD-HHmmss`
4. 按 template 创建 `tasks/active/{ID}-{slug}.md`
5. 更新 `tasks/dashboard.md`
6. 将 dashboard 状态设为 `⏳ 等拍板`
7. 展示 active task summary / plan
8. 停止，等待用户确认

---

## Stop Rule

active create 阶段禁止：

* 修改代码
* 自动实现
* 自动进入 review/build
* 自动标记完成

只有用户明确说：

* “执行”
* “开始实现”
* “continue”
* “go”
* “按这个 plan 做”

才允许进入：

```text
.harness/active-execution.md
```

---

## Task Creation Rules

创建 active task 时：

* 任务 ID 必须使用当前创建时间，格式 `YYYYMMDD-HHmmss`
* active 文件名必须使用 `tasks/active/{ID}-{slug}.md`
* dashboard 的 ID 列必须展示同一个 ID
* 不要使用 `101`、`102` 这类递增编号
* 不要创建或维护 `next_task_id`
* 如果同一秒内发生文件名冲突，在 ID 后追加 `-2`、`-3`
* 保留用户原始描述
* 生成简短 summary
* 可以推断 priority / type
* 信息不足时保持 unknown 或提问
* 不要编造技术方案
* 不要编造业务规则
* 不要自动生成 Acceptance

---

## Dashboard Rules

Dashboard 只展示：

* priority
* summary
* status

详细内容写入：

```text
tasks/active/*.md
```
