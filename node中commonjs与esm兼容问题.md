# node 中 commonjs 与 esm 兼容问题

起因是我想在 node 后端中打印一些醒目的消息

```js
export default {
  bright: "\x1B[1m", // 亮色
  grey: "\x1B[2m", // 灰色
  italic: "\x1B[3m", // 斜体
  underline: "\x1B[4m", // 下划线
  reverse: "\x1B[7m", // 反向
  hidden: "\x1B[8m", // 隐藏
  black: "\x1B[30m", // 黑色
  red: "\x1B[31m", // 红色
  green: "\x1B[32m", // 绿色
  yellow: "\x1B[33m", // 黄色
  blue: "\x1B[34m", // 蓝色
  magenta: "\x1B[35m", // 品红
  cyan: "\x1B[36m", // 青色
  white: "\x1B[37m", // 白色
  blackBG: "\x1B[40m", // 背景色为黑色
  redBG: "\x1B[41m", // 背景色为红色
  greenBG: "\x1B[42m", // 背景色为绿色
  yellowBG: "\x1B[43m", // 背景色为黄色
  blueBG: "\x1B[44m", // 背景色为蓝色
  magentaBG: "\x1B[45m", // 背景色为品红
  cyanBG: "\x1B[46m", // 背景色为青色
  whiteBG: "\x1B[47m", // 背景色为白色
};
```

为了方便我于是我下载了 chalk 这个库

> 引起报错 to a dynamic import() which is available in all CommonJS modules.

检查发现是 ts 打包之后生成了 CommonJS 的 js 代码，但是 chalk 这个库是用 esm 写的

解决办法

1. 项目整体转 esm 不现实
2. 使用老版本的 还是 CommonJS 的 chalk
3. 使用其他库
4. 用 rullup 将 chalk 转成 CommonJS
