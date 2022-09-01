// dart 是需要一个主入口函数 main
// 在主入口main函数中 会接受在命令行中传递进来的参数
// 参数类型为 List<String> 因为可以传多个 dart dart01.dart 1221 12

// dart 函数的三种方式
// 1 常规方式
void main(List<String> list) {
  print("hello dart");
  var k = list;
  print(k);
  test();
  test2();
  test3();
  test4();
}

// 2 当返回类型为void时可以省略
test() {
  print("hello dart test");
  var a = "1";
  Object kkkkkkk = "a";
  kkkkkkk = 2121;
  a = "2121";
  print(a);
  print(kkkkkkk);
}

// 3 箭头函数
test2() => {print("hello dart test2")};
test3() {
  const a = 1;
  final b = 2;
  final time = new DateTime(2022);
  print(a);
  print(b);
  print(time);
}

// 字符串转换
test4() {
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
  print(c);
  print(d);
}
