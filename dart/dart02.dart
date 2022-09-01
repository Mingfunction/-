//字符串

// 单行 “”
// 多行 “”“       ”“”
// 多行 '''       '''

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
  // 如果在字符串前外部加r 或者 用\转义 可以使模版失效
  String d = "21212${path}";
  String e = "21212$path";
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

test() {}
