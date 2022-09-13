# 1.flutter tabbar 滑动文字抖动
这个问题从1.0就存在3年了 flutter都3.0版本了 还没有修复 👴 服了
找到tabs.dart源码对其中 _TabStyle 类修改 
```dart
class _TabStyle extends AnimatedWidget {
  const _TabStyle({
    required Animation<double> animation,
    required this.selected,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.child,
  }) : super(listenable: animation);

  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool selected;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TabBarTheme tabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable as Animation<double>;

    // To enable TextStyle.lerp(style1, style2, value), both styles must have
    // the same value of inherit. Force that to be inherit=true here.
    final TextStyle defaultStyle =
        (labelStyle ?? tabBarTheme.labelStyle ?? themeData.primaryTextTheme.bodyText1!).copyWith(inherit: true);
    final TextStyle defaultUnselectedStyle = (unselectedLabelStyle ??
            tabBarTheme.unselectedLabelStyle ??
            labelStyle ??
            themeData.primaryTextTheme.bodyText1!)
        .copyWith(inherit: true);
    final TextStyle textStyle = selected
        ? TextStyle.lerp(defaultStyle, defaultUnselectedStyle, animation.value)!
        : TextStyle.lerp(defaultUnselectedStyle, defaultStyle, animation.value)!;
    // 获得字体倍率
    double? labelStyleFontSize = labelStyle?.fontSize;
    double? unselectedLabelStyleFontSize = unselectedLabelStyle?.fontSize;
    final multiple = labelStyleFontSize! / unselectedLabelStyleFontSize!;
    final double? _scale =
        selected ? lerpDouble(multiple, 1, animation.value) : lerpDouble(1, multiple, animation.value);
    // 获得字体倍率 _scale
    final Color selectedColor = labelColor ?? tabBarTheme.labelColor ?? themeData.primaryTextTheme.bodyText1!.color!;
    final Color unselectedColor =
        unselectedLabelColor ?? tabBarTheme.unselectedLabelColor ?? selectedColor.withAlpha(0xB2); // 70% alpha
    final Color color = selected
        ? Color.lerp(selectedColor, unselectedColor, animation.value)!
        : Color.lerp(unselectedColor, selectedColor, animation.value)!;

    return DefaultTextStyle(
      style: textStyle.copyWith(
        color: color,
        // 这里把字体下大小钉死！！！！！ 很多网上的这行不加没有效果害死人！！！
        fontSize: unselectedLabelStyle?.fontSize,
      ),
      child: IconTheme.merge(
        data: IconThemeData(
          size: 24.0,
          color: color,
        ),
        // 这里用Transform包裹通过 scale 方法缩小 效果非常丝滑 nice
        child: Transform.scale(scale: _scale, child: child),
      ),
    );
  }
}
```
使用 TabBar
```dart
TabBar(
  isScrollable: true,
  // 设置 Color(0x00000000) 消除长按时的背景overlay阴影
  overlayColor: const MaterialStatePropertyAll(Color(0x00000000)),
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(3.0),
    color: const Color.fromARGB(255, 99, 255, 180),
  ),
  indicatorPadding: const EdgeInsets.only(left: 33, right: 30, top: 43),
  labelColor: Colors.black,
  labelStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0, // 这里设置小数 浮点数
  ),
  unselectedLabelColor: Colors.black,
  unselectedLabelStyle: const TextStyle(fontSize: 12.0), // 这里设置小数 浮点数
  tabs: const [
    Tab(text: '第一个界面'),
    Tab(text: '第二个'),
    Tab(text: '第二个界面'),
    Tab(text: '第二个界面'),
    Tab(text: '第二个界面'),
    Tab(text: '第二个界面'),
  ],
),
),

```

# 2.overlayColor 使用 这个可以关闭长按之类的 水波纹 阴影
```dart
TabBar(
    isScrollable: true,
    // 设置 Color(0x00000000) 消除长按时的背景overlay阴影
    overlayColor: const MaterialStatePropertyAll(Color(0x00000000)),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(3.0),
      color: const Color.fromARGB(255, 99, 255, 180),
    ),
    indicatorPadding: const EdgeInsets.only(left: 33, right: 30, top: 43),
    labelColor: Colors.black,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
    unselectedLabelColor: Colors.black,
    unselectedLabelStyle: const TextStyle(fontSize: 12.0),
    tabs: const [
      Tab(text: '第一个界面'),
      Tab(text: '第二个'),
      Tab(text: '第二个界面'),
      Tab(text: '第二个界面'),
      Tab(text: '第二个界面'),
      Tab(text: '第二个界面'),
    ],
  ),
)
```

# 3.关闭 长按水波纹 全局
```dart
MaterialApp(
  title: 'Fluro',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue,
    splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
    highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
  ),
  // 这是路由不用 只要复制上面 theme 中的 splashColor 和 highlightColor
  onGenerateRoute: Application.router.generator,
);
```

# 4.AppBar底部阴影
```dart
AppBar(
  elevation: 0.0, // 这里设置为0AppBar底部就没有阴影了
)
```

# 5.修改状态栏
```dart
import 'package:flutter/services.dart';
AppBar(
  // 设置系统状态栏
  systemOverlayStyle: const SystemUiOverlayStyle(
    //设置状态栏的背景颜色
    statusBarColor: Colors.transparent,
    //状态栏的文字的颜色
    statusBarIconBrightness: Brightness.dark,
  ),
)
```

# 6. 在新页面中修改 appBar 去掉返回按钮 automaticallyImplyLeading: false

```dart
AppBar(
  title: Text('入库表格'),
  // 可以删除 返回按钮
  automaticallyImplyLeading: false, 
  // 或者设置 leading 覆盖返回按钮
  leading: IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
  actions: <Widget>[
    new IconButton( // action button
      padding: EdgeInsets.only(right: 20),
      icon: new Icon(Icons.person),
      onPressed: (){
        Navigator
            .of(context)
            .push(new MaterialPageRoute(builder: (_) {
          return new UserInfo();
        }));
      },
    ),
  ],
),
```
