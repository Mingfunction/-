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
