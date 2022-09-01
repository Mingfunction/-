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
