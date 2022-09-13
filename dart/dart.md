# 学习dart 
学习dart的vscode插件

1. Flutter 学dart的目的大概率是使用flutter不会有人不用吧 
2. Dart 安装Flutter之后会自动安
3. flutter-stylizer

> dart 是需要一个主入口函数 main 在主入口main函数中 会接受在命令行中传递进来的参数 参数类型为 List<String> 因为可以传多个以空格隔开 例：dart dart01.dart 1221 1

```dart
// dart 函数的三种方式
// 1 常规方式
void main(List<String> list) {
  print("hello dart");
  var k = list;
  print(k);
  test();
  test2();
}
// 2 当返回类型为void时可以省略
test() {
  print("hello dart test");
}

// 3 箭头函数
test2() => print("hello dart test2");
```
注释  //单行注释   和 /* 多行注释  */
```dart 
// dart var 和 js 的var的区别
var a = "2112";
// 当定义了一个a之后a的类型会自动推到为string 再设置其他类型会报错
dynamic b = "21";
b = 21;
// dynamic 更类似与js的var 可以重复定义成其他类型 
Object c = "121";
c = 121;
// 而Object为什么可以定义各种类型呢？ 因为object是dart所有类型的基类

/**
  区别 dynamic 在编译阶段不会检查类型
  Object 在编译阶段是会检查类型的
 */

```

```dart
// 常量 final const
// final更像js中的const
// final 在运行时才检查类型 确定类型之后值不可变 final time = new DateTime.now(); 可以
// const 编译时就确定 final time = new DateTime.now(); 错误 因为 new DateTime.now();在运行时才能确定
// 那么在一些 flutter项目 final来定义一个ui类 而不是用const
final width = 100;
const pi = 3.1415;
```

String 转 Int 
```dart
  // 字符串转整数
  var a = int.parse("121");
  // 字符串转小数
  var b = double.parse("121.21121"); // 这里用int.parse会报错
  // 数字转字符串
  var c = 2112.toString();
  // 数字转字符串 并保留几位小数
  var d = 2112.21211.toStringAsFixed(2);
  print(a);
  print(b);
```

字符串 操作符
```dart
void main(List<String> args) {
  String a = "12121";
  String b = """12121
  212121
  1
  """;
  // 类似python的转义
  String path = r'/dart/dart.md';
  // 字符串拼接
  String c = "2112" + "21";
  // 字符串模版 $ 和 ${} 如果是表达式不能省略{} 推荐使用{}不然老有莫名其妙的问题
  String d = "21212${path}";
  String e = "21212$path";
  // 如果在字符串前外部加r 或者 用\转义 可以使模版失效
  String f = r"21212$path";
  String g = "21212\$path";
  print(a);
  print(b);
  print(path);
  print(c);
  print(d);
  print(e);
  print(f);
  print(g);
}
```

```dart
test1() {
  // 不做任何设置只定义 值为 null
  bool? a;
  bool b = true;
  /*
   当 print 没有定义的值时现在会有一个报错
   必须加上 ？ 来表示可能有或者没有值 这样之后使用才不会有问题
  */
  print("${a}___$b");
}

test2() {
  // 操作符
  // 操作符 ？ 在定义值时 加上？ 就是表示可能没有值
  bool? a = true;
  print(a);
  // 操作符 ! 如果你认为某个对象在使用的时候确定不是null，那么可以在表达式后面添加！
  var word;
  print(word!.length);
  // late关键字 有时候，我们知道某个对象一定不是空，但是目前来说，并不能立刻对其进行赋值，这时候就需要使用到late关键字。
  // late final Coach coach;

  // 三元表达式

    var a = 1 > 0 ? "sas" : "sas";

      // 非空 ??
      bool? b;
      var c = b ?? "sa";

      void main(List<String> args) {
      print(a);

      List? list;
      list?.length;
    }

}

test3() {
  // 列表
  var list = [2, 21, 12, 21];
  print(list.length);
  print(list[0]);

  // 添加
  list.add(212);
  // 加 const 定义为不可修改列表
  List list2 = const [2121, "21"];
  print(list2);
}

test4() {
  // map 和js差不多
  var a = {"asa": "212"};
  print(a);

  Map b = new Map();
  b[2121] = "2112";
  b["saas"] = "2112";
  print(b);
  print(b.length);
}


```
函数
```dart
// 函数

void main(List<String> args) {
  test1();
  test3(bbbbb: false, c: true);
  test3();
  test4(21);
}

// 定义函数 可以省略显示类型
String test1() {
  return "";
}

String? test2() {
  var a = 1;
  if (a > 0) {
    return "21";
  }
  return null;
}

// 这种参数时可以被省略的
String? test3({bool? bbbbb, bool c = false}) {
  var a = 1;
  print("test3_1 ${bbbbb}_${c}");
  if (a > 0) {
    return "21";
  }
  return null;
}

// []内的 y z 是可选参数
test4(int x, [int? y, int? z]) {}

// 匿名函数
var func = () {};

var func2 = () => {print(121)};


```

循环和js差不多

创造类
```dart
// 类

void main(List<String> args) {
  var cat = new Cat("sa", 1, "sa");
  cat.name = "21";
  print(cat.name);
  cat.setName = "1212";
  print(cat.name);
  cat.getName;
  print(cat.toString());
  var cat2 = new Cat.formData({"name": "1", "age": 21});

  var constCat1 = const ConstCat("1");
  var constCat2 = const ConstCat("1");
  print(identical(constCat1, constCat2)); // true
}

class Cat {
  late String name;
  int age = 0;
  // 两种参数写法
  Cat(this.name, int age, String a) {
    this.age = age;
  }
  // 命名构造方法 创建构造对象
  Cat.formData(Map data) {
    this.name = data["name"];
    this.age = data["age"];
  }

  // 监控这个类的属性被访问的过程时，可以使用setter和getter
  set setName(String name) {
    print("修改name");
    this.name = name;
  }

  get getName {
    print("get name");
    return name;
  }

  @override //重写了toString方法
  String toString() {
    //重写了toString方法
    return "name is $name, age is $age";
  }
}

// 常量类
/*
在某些情况下，传入相同值时，我们希望返回同一个对象，这个时候，可以使用常量构造方法.
默认情况下，创建对象时，即使传入相同的参数，创建出来的也不是同一个对象。
如果将构造方法前加const进行修饰，那么可以保证同一个参数，创建出来的对象是相同的，这样的构造方法就称之为常量构造方法。

注意一：拥有常量构造方法的类中，所有的成员变量必须是final修饰的.
注意二: 为了可以通过常量构造方法，创建出相同的对象，不再使用 new关键字，而是使用const关键字
如果是将结果赋值给const修饰的标识符时，const可以省略.

 */
class ConstCat {
  final String name;
  final int a = 0;
  // 使用const创建构造方法
  const ConstCat(this.name);
  static final ConstCat k = const ConstCat("121");
}
```

```dart
// 工厂函数 单例模式

// 工厂函数 类似于单利模式
/*
工厂构造函数无法访问 this。
工厂构造函的调用方式与其他构造函数一样：
*/
main(List<String> args) {
  var log1 = Logger('why');
  var log2 = Logger('why');
  var log3 = Logger('why1');
  print(identical(log1, log2)); // true
  print(identical(log1, log3)); // true
}

class Logger {
  final String name;
  // 创建一个私有 缓存
  static final Map<String, Logger> _cache = <String, Logger>{};
  // Private constructor for internal use only
  // 私有的构造方法
  Logger._internal(this.name);
  /* 查找 key 的值，如果不存在则添加一个新条目。
    返回与 key 关联的值(如果有)。否则调用ifAbsent 以获取新值，将key 与该值相关联，然后返回新值。*/
  factory Logger(String name) {
    // 调用 putIfAbsent 参数二中 不得在映射中添加或删除键。
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
}

```

flutter
```dart

import 'package:flutter/material.dart';
// 导入materialUI控件
// google官方的控件
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // material这个框架 调用 MaterialApp 创建一个material风格的ui
    // 可以定义标题 主题等等
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 首页
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

```

material 组件 andriod 
cupertino 组件 ios

Text 文本
Image 图片
Icon 图标
Container 类似div 方便添加边角 内外边距 对齐背景

Row Column Flex flex布局的组件

Stack z轴的组件

scaffold 页面骨架 实现了 上下导航 抽屉等