在配置完.eslintrc.js 之后 可能没有 npm 下载 eslint 如果在全局就 -g 在项目内就 -D
如果还报错那么在 vscode 控制台中查看输出 （ 控制台有 4 个标签页 问题 输出 调试 终端 的输出 ）里面有报错原因
之后根据报错原因具体修改 比如我这次就是因为忘记下载 @typescript-eslint/parser 导致 eslint 报错
