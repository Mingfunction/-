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
