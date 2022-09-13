// 继承与混入 接口 泛型 异常

import 'dart:svg';

void main(List<String> args) {
  Cat animal = new Cat();
  print(animal.eyes); // 2
  animal.makeNoise(); // Meow
  animal.walk();
  test(new F());

  // 异常 使用 on 需要关心出了什么错误 对不同情况不同处理
  try {
    print(11 ~/ 0);
  } on UnsupportedError {
    print("出现UnsupportedError情况走这里");
  } on Exception {
    print("出现UnsupportedError情况走这里");
  } finally {
    print("不管出现什么情况都会走这里");
  }
  // 使用catch 不关心出了什么错误 打印一下就可以
  try {
    print(11 ~/ 0);
  } catch (e, s) {
    print(e); //e 是错误类
    print(s); //s 是错误栈信息 包括很多 代码行数 等等
  } finally {
    print("最后走这里");
  }
  // 也可以 on 加 catch
  try {
    print(11 ~/ 0);
  } on UnsupportedError catch (e, s) {
    print("出现UnsupportedError情况走这里");
    print('${e}_${s}');
  }
}

class Animal {
  int eyes;
  Animal(this.eyes);
  makeNoise() {
    print('???');
  }
}

class Animal1 {
  // 作为mixin的类是不能有任何构造方法的
  //  Animal1(this.eyes);
  walk() {
    print('Meow');
  }

  eat() {
    print('eat');
  }
}

// extends继承 with 关键词混入 多继承
class Cat extends Animal with Animal1 {
  Cat() : super(2);
  // 重写父类的方法
  @override
  makeNoise() {
    print('Meow');
  }
}

// 抽象类 abstract 类似于 interface 作为接口使用定义类的接口
// 抽象类不能实力化 不能new 可以被继承 继承之后字类要把方法全部实现出来
/*
  没有abstract的普通类型也可以作为一个隐式接口
  子类可以通过@override去重写父类的方法
*/

abstract class Base {
  func1();
  func2();
}

class F extends Base {
  @override
  func1() {
    print("实现func1");
  }

  @override
  func2() {
    print("实现func2");
  }
}

test(F f) {
  f.func1();
}

// 泛型
// 比如 列表 每一项都是String
var list = <String>[];
// map key是string value number
var map = new Map<String, Number>();
var map2 = <String, Number>{};
T transform<T>(T param) {
  // E.g. doing some transformation on `param`...
  return param;
}
