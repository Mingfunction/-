### 什么是 prisma

Prisma 是什么?
Prisma 是一个 开源 的下一代 ORM。它包含了以下部分：

Prisma Client: 自动生成、类型安全的查询构建器，用于 Node.js 和 TypeScript
Prisma Migrate: 数据迁移系统
Prisma Studio: 查询和编辑数据库中数据的图形化界面

Prisma 客户端可以被用在 任何 Node.js（支持的版本）或 TypeScript 后端应用中（包括 Serverless 应用和微服务）。可以是一个 REST API，一个 GraphQL API，一个 gRPC API，或任何其他需要数据库的东西。

支持 PostgreSQL、MySQL、MongoDB、SQL Server 和 SQLite。

> 中文文档 [https://prisma.yoga/](https://prisma.yoga/)

快速开始

1. npm i -g prisma
2. prisma init
   这时在目录下会创建一个 prisma 文件夹 里面有 schema.prisma 文件

```prisma
generator client {
  provider = "prisma-client-js" // 导出的客户端
}

datasource db {
  provider = "mongodb"  // 使用哪种数据库
  url      = "mongodb://localhost/test" // 数据库地址
}

```

如果是已有项目执行 prisma 会将数据库中已有的数据模型添加到 schema.prisma 文件不过可能不准确 需要自己再修改 具体看文档 [https://prisma.yoga/concepts/components/prisma-schema/data-model](https://prisma.yoga/concepts/components/prisma-schema/data-model)

3. prisma db pull

4. npm install prisma --save-dev
   npm install @prisma/client
   npx prisma
   prisma generate
   这一步是生成 prisma prisma-client-js 执行之后可以在项目中导入

```ts
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
// 在应用程序中使用 `prisma` 读取和写入数据库中的数据
export default prisma;
```

```ts
const users = await prisma.user.findMany();
// 查询出所有用户 就成功了
```

5. 改进应用程序
   每当你对数据库进行了映射在 Prisma schema 的更改时，都需要手动重新生成 Prisma Client，以更新 node_modules/.prisma/client 目录中生成的代码：
   执行 prisma generate

   自动更新 sudo prisma generate --watch

- sudo Prisma studio
  这一步是打开网页查看数据库数据 默认端口是 5555
