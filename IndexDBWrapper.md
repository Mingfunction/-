做为 Web 浏览器层的本地存储，IndexDB 做为一个很好的选择，几乎可以存储任意类型的数据，且是异步的。但是正常使用方式下需要在监听各种事件来处理结果，不是很方便，下面就对这一层进行了包装，使用方便。

IndexDBWrapper 库
IndexDBWrapper 库是参考 workbox 相关 DB 操作开发的，下面具体说明下使用。
包地址：www.npmjs.com/package/ind…
安装：
npm i indexdbwrapper
使用：
import IndexDBWrapper from "indexdbwrapper";
构造器
const db = new IndexDBWrapper(name, version, { onupgradeneeded })

name: 数据库名
version：数据库版本
onupgradeneeded：数据库更新方法

静态方法
删除数据库：
IndexDBWrapper.deleteDatabase(name)

name：数据库名

属性
db：实际的 IndexDB IDBDatabase 对象。
db.db;
实例方法
open：打开数据库。
db.open();
close：关闭数据库。
db.close();
add：指定 store 添加数据。
db.add(storeName, value, key?);
clear: 指定 store 清空数据。
db.clear(storeName);
count：指定 store 获取数量。
db.count(storeName, query:IDBKeyRange?);
get：指定 store 和主键获取数据。
db.get(key);
put：指定 store 添加或更新数据。
db.put(storeName, value, key?);
delete：指定 store 和 key 删除符合条件的数据。
db.delete(storeName, key);
getKey：获取符合条件的 key。
db.getKey(storeName, query);
getAll：获取符合条件的所有数据。
db.getAll(storeName, query, count);
getAllKeys：获取符合条件的所有 key。
db.getAllKeys(storeName, query, count);
getAllMatching：获取符合条件的所有数据。（常用）
db.getAllMatching(storeName, { index, query = null, direction = "next", count, includeKeys });
transaction：包装后的事务。
db.transaction(storeNames, type, callback);
