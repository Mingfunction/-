// 导入 指定dart前缀导入标准库
import 'dart:math';
import 'dart:io';
// 指定  import 'package:flutter/material.dart';
// 相对路径和绝对路径
import 'dart01.dart';

var intValue = Random().nextInt(10);

void main(List<String> args) {
  test();
  awaitFun();
  print(121);
  stringFuture.then((String str) {
    print(str); // 'String Value'
  });
  asyncFunction();
}

awaitFun() {
  var d = const Duration(seconds: 5);
  sleep(d);
  print("sleep");
  return "21";
}

Future<String> fetchString() async {
  // Typically some other async operations would be done here.
  return 'String Value';
}

Future<String> stringFuture = fetchString();

asyncFunction() async {
  var str = await fetchString();
  print(str); // 'String Value'
}
