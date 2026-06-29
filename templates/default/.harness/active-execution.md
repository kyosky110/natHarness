# Active Execution Rule

当用户说“继续某个任务 ID / 执行某个任务 ID / 处理当前 active / 开始实现 / continue / go / 按这个 plan 做”时：

1. 读取对应 `tasks/active/*.md`
2. 只加载与该任务相关的 project/memory 上下文
3. 先输出简短 plan
4. 再实现
5. review
6. build/test
7. 更新 active task 的 Next Step / Status
8. 如完成：
   * 更新 dashboard
   * 读取 `.harness/archive-template.md`
   * 使用原任务 ID 生成 archive
   * 如有必要更新 memory

归档前必须满足：

* 实现已经完成，或明确无法继续
* review 和 build/test 已执行，或已说明无法执行的原因
* archive 结果明确为 `SUCCESS`、`FAIL` 或 `PARTIAL`
* 结论中包含具体验证结果和剩余风险

完成后必须：

* 从 `tasks/dashboard.md` 移除该任务，或确保 dashboard 只展示未完成工作
* 从 `tasks/active/` 移除对应 task
* 不把 `已完成` 长期保留在 dashboard

执行时禁止：

* 读取无关 active task
* 读取全部 memory
* 跳过 review/build
* 未完成却标记完成
* 直接复制 active task 到 archive
