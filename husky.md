# husky

```
npm install -D husky
```

```json
{
  "scripts": {
    "prepare": "husky install"
  }
}
```

prepare 脚本会在 npm install（不带参数）之后自动执行。也就是说当我们执行 npm install 安装完项目依赖后会执行 husky install 命令，该命令会创建.husky/目录并指定该目录为 git hooks 所在的目录。

```
npx husky add .husky/pre-commit "npm run test"
```

运行完该命令后我们会看到.husky/目录下新增了一个名为 pre-commit 的 shell 脚本。也就是说在在执行 git commit 命令时会先执行 pre-commit 这个脚本。pre-commit 脚本内容如下：

```shell
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

npm run  test
```
