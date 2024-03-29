---
title: JSON For You 使用指南
---

**[JSON For You](https://json4u.com)** 是我找遍了市面上的同类工具，始终找不到符合全部需求的工具后，本着“自己动手，丰衣足食”的想法做的
JSON 工具箱。目标是对常用的 JSON 展示、处理功能提供最高的生产效率。由于是自用，所以：

1. 会持续更新、维护；
2. 不会轻易引入广告；

使用中有任何问题，或者希望支持新功能，都欢迎通过 [Feedback](https://github.com/loggerhead/json4u-issue/issues) 反馈。下面对
**[JSON For You](https://json4u.com)** 支持的功能做一个简单介绍。

## JSON 语义化比较

JSON 语义化比较（又被称作 JSON 结构化比较）是指忽略 JSON 中 key 的顺序，根据数据结构对两个 JSON
数据进行对比（类似于 `git diff`，只不过能理解数据的语义）。

![JSON diff example](/guide/diff.png)
![text diff example](/guide/text-diff.png)

拖拽文件或粘贴文本时，如果两侧编辑器都有内容，会自动进行比较。与一般的 JSON 对比网站不同，本站还提供了以下功能：

- **int64 比较**。在业务开发中 ID 通常会定义为 int64，而 js 的 number 只能精确表达 52bit
  整数，此类字段如果前后端不做特殊处理，会丢失精度。为了快速找出这类差异，所以支持了 [Bigint](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
  比较的功能；
- **逐词比较**。有时候两个 JSON 数据只有很少的差别，比如：两个很长的字符串，但只有一两个词不一样，此时肉眼很难发现具体哪个地方不一致。所以支持了逐词比较，让你能一眼看出具体
  diff；
- **数组差分比较**。如果两个 JSON 数组有差异，一般情况下我们其实不需要查看每一个元素的
  diff，因为很可能会有比较多的噪音，并不方便我们肉眼查看。所以做了差分比较，提供与 `git diff` 一样简洁、人类可读的差异；
- **文本比较**。因为文本比较也是很常见的需求，所以支持了将无效 JSON 降级为文本比较（text diff），体验与 `git diff` 接近。效果如图：
- **差异跳转**。可以通过右键菜单或者快捷键快速跳转到下一个差异或上一个差异；

## 支持的 JSON 工具

左侧编辑器放置了 JSON 常用功能的按钮，其它功能可以通过点击右键菜单来使用。

- **JSON 校验**（JSON Validator）。有修改时会自动做校验。错误行会有标注，并提供充足的上下文帮助定位错误；
- **JSON 格式化**（JSON Formatter/Beautifier）。拖拽文件或粘贴后会自动格式化，即使是无效的 JSON
  数据也能格式化；
- **JSON 最小化**（JSON Minify）。去除所有的空白字符，将 JSON 数据压缩成一行；
- **JSON 转义**（JSON Escape）。对 JSON 数据进行转义，增加 `\` 字符使其成为一个合法的字符串；
- **JSON 反转义**（JSON Unescape）。对 JSON 数据进行反转义，删除 `\` 字符使其成为合法的 JSON；
- **JSON 排序**（JSON Sort）。递归的对 key 做排序，但不会对数组做排序，排序前后的 JSON 在语义上是相等的。常用于排序后比较，让
  diff 集中在一起，方便人眼查看；
- **显示 JSON 路径**（JSON Pointer/Path）。鼠标点击任意处，会展示对应 token
  的 [JSON Pointer](https://datatracker.ietf.org/doc/html/rfc6901)。和 minimap 搭配使用，能帮助快速理解 JSON 的结构；
- **URL 转 JSON**。递归的解析 URL 转成一个 JSON。如果需要对比两个 URL 的 diff，先转成 JSON 再使用 diff 就非常方便；

  ![URL to JSON example](/guide/url2json-before.png)
  ![URL to JSON example](/guide/url2json-after.png)

- **[jq 命令行工具](https://jqlang.github.io/jq/tutorial/)**。jq 是一个非常强大的 JSON 处理工具，JSON For You 通过 Wasm
  支持了 [jq 的全部功能](https://jqlang.github.io/jq/manual/v1.7/)，以满足更复杂的 JSON 过滤、处理等需求；

  ![jq example 1](/guide/jq1.png)
  ![jq example 2](/guide/jq2.png)

## 编辑器功能

除了支持 JSON 以外，常见的编辑器功能也是支持的：

- **折叠/展开**。鼠标移动到行号，会自动显示折叠图标，点击图标，可以折叠或展开；
- **拖拽文件**。拖动文件到编辑器中会自动读取文件内容，所有的数据传输都发生在本地，没有网络请求；
- **查找并替换**。支持查找并替换，支持正则表达式；
- **展示行号、列号**；
- **展示选中字符数**；

## 更新日志

- 2023-12-10:
    - 支持 [jq 1.7](https://jqlang.github.io/jq/tutorial/) 全部功能；
    - 优化 inline diff 性能；
    - 优化 monaco CDN 缓存；
    - fix 通过菜单项升序排序时未自动格式化的 bug；
- 2023-12-02:
    - 支持 [jq](https://jqlang.github.io/jq/tutorial/) 核心功能；
    - 优化格式化算法；
    - fix guide 页无序列表样式问题；
- 2023-11-26:
    - 支持嵌套解析；
    - setting 自动读写 local storage；
    - 将「去转义」按钮隐藏到「...」菜单中；
    - 下线 try best to parse JSON 的功能；
- 2023-11-19:
    - 支持自动排序、自动格式化开关；
    - UI 调整；
- 2023-10-25:
    - fix 隐藏块差异造成可读性差的问题；
- 2023-10-14:
    - 比较无差异时，闪烁状态栏进行提示；
    - 状态栏改为展示左右两侧的 diff 行数；
    - fix 状态栏文字太长时的展示问题；
- 2023-10-06:
    - 格式化等按钮改为作用于最后 focus 的编辑器；
    - 支持关闭自动格式化；
    - fix minimap 颜色错误；
- 2023-09-30:
    - 调整 UI 配色，对齐 github；
    - 支持展示选中的字符数；
    - 改进 diff 算法，减少行内差异很多时对可读性的干扰；
- 2023-09-24:
    - 文本 diff 支持填充块，增强阅读体验；
    - 支持 JSON 排序后文本比较；
    - 改进 diff 算法；
    - 高亮差异时同时高亮行号；
    - 下线 key 比较，避免同值 key 字段很多时（比如值为 0）难以查看 diff 结果；
    - 「加载中...」换成动画；
    - fix python 转 dict 部分 case 失败；
    - 增加右侧编辑器默认大小；
    - 支持跳转差异时从光标位置起跳；
- 2023-09-09:
    - 支持显示当前光标所在位置；
    - 改为块差异，让用户能更快跳转到不同差异；
    - fix 清空状态栏 validate 不生效的问题；
- 2023-09-01:
    - 支持更多折叠层级；
    - 改进自动格式化算法；
    - 跳转支持跳转到行内差异；
- 2023-08-26:
    - 支持 Python dict 转 JSON（文本替换）；
    - fix 解析错误上下文带 tag 时状态栏显示错误；
    - fix 文本比较时右侧解析错误信息被左侧解析错误覆盖；
- 2023-08-22:
    - 改进大文本的格式化性能；
    - fix 状态栏并发更新导致的状态错误；
- 2023-08-19:
    - 增加功能引导文案；
    - 重构状态栏，优化文案展示逻辑；
    - 改进同步滚动体验；
    - 支持通过按住 Alt 键暂停同步滚动；
    - 支持快捷键进行折叠/展开；
    - fix 多个行内差异颜色叠加后颜色加深的问题；
- 2023-08-01:
    - 2.0.0 上线；
- 2022-01-12:
    - 1.0.0 上线；
