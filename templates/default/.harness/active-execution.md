# Active Execution Rule

当用户说“继续 101 / 执行 101 / 处理当前 active”时：

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
   * 生成 archive
   * 如有必要更新 memory

执行时禁止：

* 读取无关 active task
* 读取全部 memory
* 跳过 review/build
* 未完成却标记完成
* 直接复制 active task 到 archive
