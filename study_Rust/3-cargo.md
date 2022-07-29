## Cargo

Cargo 是 rust 的构建系统和包管理工具
构建代码 下载依赖的库 构建这些库 类似于 pip npm+webpack？ maven？

安装
安装 rust 的时候就安装了 cargo

```
cargo -V
```

创建项目

```
cargo new

例子：
cargo new hello_cargo

```

cargo new 创建项目 (新目录)
cargo init 创建项目 （当前目录）
cargo build 编译项目
cargo check 检查项目中的错误
cargo run 编译运行项目
cargo test 测试项目
cargo doc 构建项目文档
cargo publish 将库发布到 crates.io
cargo clean 移除项目的 target 目录
cargo update 更新项目依赖
cargo new dome 创建 可执行二进制文件
cargo new dome --lib 创建库
cargo build --release 编译优化项目
