// bool 操作符 list map

void main(List<String> args) {
  test1();
  test2();
  test3();
  test4();
}

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
