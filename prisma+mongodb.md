零时错误
在

```ts
prisma.users.create({
  data,
  select: {
    id: true,
    username: true,
    email: true,
  },
});

// 报错   Prisma needs to perform transactions, which requires your MongoDB server to be run as a replica set.
// 报错，本身语法和prisma没有问题
```

解决办法 https://www.mongodb.com/docs/manual/tutorial/convert-standalone-to-replica-set/

1. 关闭 mongod
2. 之后执行 mongod --port=27017 --dbpath=. --replSet=rs0
3. 在另一个命令行启动 mongo
4. 在 mongo 中执行 rs.initiate( { \_id : "rs0", members: [ { _id: 0, host: "localhost:27017" } ] })

调用 findUnique 等 find 语句报错 ERROR [ExceptionsHandler] Maximum call stack size exceeded

因为在 prisma 中定义了

```prisma

// UsersRouterAuth 循环应用了

type UsersRouterAuth {
  // accessStr String
  auth     Boolean
  children UsersRouterAuth[] // 和这一行
  path     String
  type     String
}


model users {
  id         String            @id @default(auto()) @map("_id") @db.ObjectId
  gx_id      String            @unique
  email      String            @unique
  username   String
  DocType    DocType[]
  // article    Object[]
  password   String
  routerAuth UsersRouterAuth[] //这一行
  createdAt  DateTime          @default(now())
  updatedAt  DateTime          @default(now())
}

```
