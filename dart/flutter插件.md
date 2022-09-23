# Flutter常用库介绍与使用-flutter\_boost、flutter\_bloc等

在flutter开发中，为提高开发效率，常常会引用很多依赖库。以下我列出一些常用的库的介绍与使用。

## flutter\_boost

项目地址：  
[https://github.com/alibaba/flutter\_boost](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Falibaba%2Fflutter_boost)  
新一代Flutter-Native混合解决方案。 FlutterBoost是一个Flutter插件，它可以轻松地为现有原生应用程序提供Flutter混合集成方案。FlutterBoost的理念是将Flutter像Webview那样来使用。在现有应用程序中同时管理Native页面和Flutter页面并非易事。 FlutterBoost帮你处理页面的映射和跳转，你只需关心页面的名字和参数即可（通常可以是URL）。

## flutter\_bloc

#### 库地址：

[https://pub.dev/packages/flutter\_bloc](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fflutter_bloc)

#### 使用介绍：

[https://www.jianshu.com/p/275890009337](https://www.jianshu.com/p/275890009337)

## event\_bus

#### 库地址：

[https://pub.dev/packages/event\_bus](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fevent_bus)

##### 1，创建一个Event Bus

```dart
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();
```

##### 2，定义 Events(任何Dart类都能作为event)

```kotlin
class UserLoggedInEvent {
  User user;

  UserLoggedInEvent(this.user);
}

class NewOrderEvent {
  Order order;

  NewOrderEvent(this.order);
}
```

##### 3，注册监听者

```csharp
eventBus.on<UserLoggedInEvent>().listen((event) {
  // All events are of type UserLoggedInEvent (or subtypes of it).
  print(event.user);
});
```

```csharp
eventBus.on().listen((event) {
  // Print the runtime type. Such a set up could be used for logging.
  print(event.runtimeType);
});
```

##### 4，发送事件

```bash
User myUser = User('Michael');
eventBus.fire(UserLoggedInEvent(myUser));
```

## cached\_network\_image

#### 库地址：

[https://pub.dev/packages/cached\_network\_image](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fcached_network_image)

#### 使用：

```jsx
CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
```

```jsx
CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
```

```undefined
Image(image: CachedNetworkImageProvider(url))
```

```jsx
CachedNetworkImage(
  imageUrl: "http://via.placeholder.com/200x150",
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
```

## url\_launcher

#### 地址：

[https://pub.dev/packages/url\_launcher](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Furl_launcher)

#### 使用：

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: Center(
            child: ElevatedButton(
              onPressed: _launchUrl,
              child: Text('Show Flutter homepage'),
            ),
          ),
        ),
      ),
    );

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
```

## flutter\_easyloading

#### 地址：

[https://github.com/nslogx/flutter\_easyloading/blob/master/README-zh\_CN.md](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fnslogx%2Fflutter_easyloading%2Fblob%2Fmaster%2FREADME-zh_CN.md)

#### 使用：

首先, 在MaterialApp/CupertinoApp中初始化FlutterEasyLoading:

#### 安装

将以下代码添加到您项目中的 `pubspec.yaml` 文件:

```yaml
dependencies:
  flutter_easyloading: ^3.0.3
```

#### 导入

```dart
import 'package:flutter_easyloading/flutter_easyloading.dart';
```

#### 如何使用

首先, 在`MaterialApp`/`CupertinoApp`中初始化`FlutterEasyLoading`:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EasyLoading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter EasyLoading'),
      builder: EasyLoading.init(),
    );
  }
}
```

然后使用:

```dart
EasyLoading.show(status: 'loading...');

EasyLoading.showProgress(0.3, status: 'downloading...');

EasyLoading.showSuccess('Great Success!');

EasyLoading.showError('Failed with Error');

EasyLoading.showInfo('Useful Information.');

EasyLoading.showToast('Toast');

EasyLoading.dismiss();
```

添加 Loading 状态回调

```dart
EasyLoading.addStatusCallback((status) {
  print('EasyLoading Status $status');
});
```

移除 Loading 状态回调

```dart
EasyLoading.removeCallback(statusCallback);

EasyLoading.removeAllCallbacks();
```

## shared\_preferences

#### 地址：

[https://pub.dev/packages/shared\_preferences](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fshared_preferences)

#### 用法：

```dart
// Obtain shared preferences.
final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

```dart
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
final List<String>? items = prefs.getStringList('items');
```

```csharp
// Remove data for the 'counter' key.
final success = await prefs.remove('counter');
```

## cupertino\_icons

#### 地址：

[https://pub.dev/packages/cupertino\_icons](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fcupertino_icons)

#### 介绍：

主要是一些常用的图标

## encrypt

#### 地址：

[https://pub.dev/packages/encrypt](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fencrypt)

#### 介绍：

一组基于 PointyCastle 的高级 API，用于双向加密。

#### 用法：

```dart
import 'package:encrypt/encrypt.dart';

void main() {
  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final key = Key.fromUtf8('my 32 length key................');
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
}
```

## crypto

#### 地址：

[https://pub.dev/packages/crypto](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.dev%2Fpackages%2Fcrypto)

#### 介绍：

Dart 的加密哈希函数  
在纯 Dart 中实现的一组加密哈希函数

支持以下哈希算法：

SHA-1  
SHA-224  
SHA-256  
SHA-384  
SHA-512  
SHA-512/224  
SHA-512/256  
MD5  
HMAC（即 HMAC-MD5、HMAC-SHA1、HMAC-SHA256）

#### 用法：

```dart
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

void main() {
  var bytes = utf8.encode("foobar"); // data being hashed

  var digest = sha1.convert(bytes);

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");
}
```

分块输入的摘要加密  
如果输入数据不能作为单个字节列表使用，请使用分块转换方法。

调用 startChunkedConversion 方法为输入数据创建接收器。 在 sink 上，为每个输入数据块调用 add 方法，并在添加完所有块后调用 close 方法。 然后可以从用于创建输入数据接收器的 Sink<Digest> 中检索摘要。

```dart
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

void main() {
  var firstChunk = utf8.encode("foo");
  var secondChunk = utf8.encode("bar");

  var output = AccumulatorSink<Digest>();
  var input = sha1.startChunkedConversion(output);
  input.add(firstChunk);
  input.add(secondChunk); // call `add` for every chunk of input data
  input.close();
  var digest = output.events.single;

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");
}
```

## provider

对 \[InheritedWidget\]\[\] 组件的上层封装，使其更易用，更易复用。

使用 `provider` 而非手动书写 \[InheritedWidget\]\[\]，有以下的优势:

- 简化的资源分配与处置
    
- 懒加载
    
- 创建新类时减少大量的模板代码
    
- 支持 DevTools
    
- 更通用的调用 \[InheritedWidget\]\[\] 的方式（参考 [Provider.of](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.flutter-io.cn%2Fdocumentation%2Fprovider%2Flatest%2Fprovider%2FProvider%2Fof.html)/[Consumer](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.flutter-io.cn%2Fdocumentation%2Fprovider%2Flatest%2Fprovider%2FConsumer-class.html)/[Selector](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.flutter-io.cn%2Fdocumentation%2Fprovider%2Flatest%2Fprovider%2FSelector-class.html)）
    
- 提升类的可扩展性，整体的监听架构时间复杂度以指数级增长（如 [ChangeNotifier](https://links.jianshu.com/go?to=https%3A%2F%2Fapi.flutter-io.cn%2Fflutter%2Ffoundation%2FChangeNotifier-class.html)， 其复杂度为 O(N)）
    

想了解更多 `provider` 相关内容，请参考[文档](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.flutter-io.cn%2Fdocumentation%2Fprovider%2Flatest%2Fprovider%2Fprovider-library.html)

更多内容:

- [Flutter 官方的状态管理文档](https://links.jianshu.com/go?to=https%3A%2F%2Fflutter.cn%2Fdocs%2Fdevelopment%2Fdata-and-backend%2Fstate-mgmt%2Fsimple)，  
    展示如何将 `provider` 与 \[ChangeNotifier\]\[\] 结合使用。
- [Flutter 架构示例](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fbrianegan%2Fflutter_architecture_samples%2Ftree%2Fmaster%2Fchange_notifier_provider)，  
    使用 `provider` 与 \[ChangeNotifier\]\[\] 实现的具体应用。
- [flutter\_bloc](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Ffelangel%2Fbloc) 和  
    [Mobx](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fmobxjs%2Fmobx.dart)，在 BLoC 与 Mobx 架构中使用 `provider`。

## 自 4.x.x 版本升级到 5.0.0-nullsafety

- `FutureProvider` 和 `StreamProvider` 现在要求声明 `initialData`。
    
    待迁移的旧代码：
    
    ```dart
    FutureProvider<int>(
      create: (context) => Future.value(42),
      child: MyApp(),
    )
    
    Widget build(BuildContext context) {
      final value = context.watch<int>();
      return Text('$value');
    }
    ```
    
    迁移后：
    
    ```dart
    FutureProvider<int?>(
      initialValue: null,
      create: (context) => Future.value(42),
      child: MyApp(),
    )
    
    Widget build(BuildContext context) {
      // be sure to specify the ? in watch<int?>
      final value = context.watch<int?>();
      return Text('$value');
    }
    ```
    
- `ValueListenableProvider` 已被移除
    
    你只需要将 `ValueListenableBuilder` 与 `Provider` 结合使用即可：
    
    ```dart
    ValueListenableBuilder<int>(
      valueListenable: myValueListenable,
      builder: (context, value, _) {
        return Provider<int>.value(
          value: value,
          child: MyApp(),
        );
      }
    )
    ```
    

### 使用

### 暴露一个值

#### 暴露一个新的对象实例

Provider 不仅可以暴露出一个值，同时也可以创建、监听和销毁它。

要暴露一个新创建的对象，你可以使用这个 provider 的默认构造。  
而如果你想在开始监听时再 **创建** 一个对象，  
**不推荐**使用 `.value` 构造函数，否则可能会有你预期外的副作用。

你可以阅读在 [StackOverflow 上的回答](https://links.jianshu.com/go?to=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F52249578%2Fhow-to-deal-with-unwanted-widget-build)  
以了解为什么不推荐使用 `.value` 构造函数创建值。

- **推荐** 在 `create` 内创建新对象\*\*。
    
    ```dart
    Provider(
      create: (_) => MyModel(),
      child: ...
    )
    ```
    
- **不推荐** 使用 `Provider.value` 创建新对象\*\*。
    
    ```dart
    ChangeNotifierProvider.value(
      value: MyModel(),
      child: ...
    )
    ```
    
- **不推荐** 以可能随时间改变的变量创建对象。
    
    在以下变量发生变化的场景里，你的对象将不会跟随值的变化而更新。
    
    ```dart
    int count;
    
    Provider(
      create: (_) => MyModel(count),
      child: ...
    )
    ```
    
    如果你想将可能被外界修改的变量传入给对象，请使用 `ProxyProvider`：
    
    ```dart
    int count;
    
    ProxyProvider0(
      update: (_， __) => MyModel(count),
      child: ...
    )
    ```
    

**请注意：**

在使用一个 provider 的 `create` 和 `update` 回调时，回调函数默认是延迟调用的。

也就是说，变量被读取时，`create` 和 `update` 函数才会被调用。

如果你想预先计算一些对象内的逻辑，可以使用 `lazy` 参数来禁用这一行为。

```dart
MyProvider(
  create: (_) => Something(),
  lazy: false,
)
```

#### 复用一个已存在的对象实例：

如果你要将一个已经存在的对象实例暴露出来，  
你应当使用 provider 的 `.value` 构造函数。

如果你没有这么做，那么在你调用对象的 `dispose` 方法时，  
这个对象可能仍然在被使用，导致无法释放。

- **推荐** 使用 `ChangeNotifierProvider.value` 来提供一个当前已存在的 \[ChangeNotifier\]\[\]
    
    ```dart
    MyChangeNotifier variable;
    
    ChangeNotifierProvider.value(
      value: variable,
      child: ...
    )
    ```
    
- **不推荐** 使用默认的构造函数来尝试复用一个已存在的 \[ChangeNotifier\]\[\]
    
    ```dart
    MyChangeNotifier variable;
    
    ChangeNotifierProvider(
      create: (_) => variable,
      child: ...
    )
    ```
    

### 读取值

最简单的读取值的方式就是使用 `BuildContext` 上的扩展属性（由 `provider` 注入）。

- `context.watch<T>()`，widget 能够监听到 `T` 类型的 provider 发生的改变。
- `context.read<T>()`，直接返回 `T`，不会监听改变。
- `context.select<T，R>(R cb(T value))`，允许 widget 只监听 `T` 上的一部分内容的改变。

你也可以使用 `Provider.of<T>(context)` 这一静态方法，它的表现类似 `watch`，  
而在你为传入 `listen: false` 参数时（例如 `Provider.of<T>(context，listen: false)`），  
它的表现与 `read` 类似。

值得注意的是，`context.read<T>()` 方法不会在值变化时让 widget 重新构建，  
并且不能在 `StatelessWidget.build` 和 `State.build` 内调用.  
换句话说，它可以在除了这两个方法以外的任意位置调用。

上面列举的这些方法会从传入的 `BuildContext` 关联的 widget 开始，向上查找 widget 树，  
并返回查找到的层级最近的 `T` 类型的 provider（未找到时将抛出错误）。

值得一提的是，该操作的复杂度是 O(1)，它实际上并不会遍历整个组件树。

结合上面第一个 [暴露一个值](https://www.jianshu.com/p/677a4aa0a941#%E6%9A%B4%E9%9C%B2%E4%B8%80%E4%B8%AA%E5%80%BC) 的例子，  
widget 会读取暴露出的 `String` 并渲染 `Hello World`。

```dart
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      // Don't forget to pass the type of the object you want to obtain to `watch`!
      context.watch<String>(),
    );
  }
}
```

如果不想使用这些方法，你也也可以使用 \[Consumer\]\[\] 和 \[Selector\]\[\]。

它们往往在一些需要 **性能优化** 的场景，  
以及当 widget 很难获取到 provider 所在层级以下的 `BuildContext` 时非常有用。

查阅 [FAQ](https://www.jianshu.com/p/677a4aa0a941#%E6%88%91%E7%9A%84-widget-%E9%87%8D%E6%96%B0-build-%E5%A4%AA%E9%A2%91%E7%B9%81%E4%BA%86%EF%BC%8C%E6%88%91%E5%BA%94%E8%AF%A5%E6%80%8E%E4%B9%88%E5%81%9A%EF%BC%9F)  
或关于 \[Consumer\]\[\] 和 \[Selector\]\[\] 的文档了解更多。

### 依赖可能不存在的 Provider

某些情况下，我们可能需要支持 provider 不存在的查询。  
例如一个可能在 provider 以外使用的封装复用的 widget。

此时你可以将 `context.watch` 和 `context.read` 对应的 `T` 声明为可空的类型。

假设原有的代码为：

```dart
context.watch<Model>()
```

会在找不到 provider 时抛出 `ProviderNotFoundException`，而按以下方法修改后：

```dart
context.watch<Model?>()
```

在查询时会尝试找到匹配 provider，未找到时返回 `null` 而不会抛出异常。

### MultiProvider

在大型应用中注入较多内容时，`Provider` 的时候很容易产生多层嵌套：

```dart
Provider<Something>(
  create: (_) => Something(),
  child: Provider<SomethingElse>(
    create: (_) => SomethingElse(),
    child: Provider<AnotherThing>(
      create: (_) => AnotherThing(),
      child: someWidget,
    ),
  ),
),
```

这时你可以使用 `MultiProvider`：

```dart
MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something()),
    Provider<SomethingElse>(create: (_) => SomethingElse()),
    Provider<AnotherThing>(create: (_) => AnotherThing()),
  ],
  child: someWidget,
)
```

以上两个例子的实际表现是一致的，`MultiProvider` 仅仅是改变了代码的书写方式。

### ProxyProvider

从 3.0.0 开始，我们提供了一种新的 provider：`ProxyProvider`。

`ProxyProvider` 能够将多个 provider 的值聚合为一个新对象，将结果传递给 `Provider`。

这个新对象会在其依赖的任意一个 provider 更新后同步更新。

下面的例子使用了 `ProxyProvider`，基于另一个 provider 的 counter 值进行转化。

```dart
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ProxyProvider<Counter, Translations>(
        update: (_, counter, __) => Translations(counter.value),
      ),
    ],
    child: Foo(),
  );
}

class Translations {
  const Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}
```

它还有其他不同的形式：

- `ProxyProvider`、`ProxyProvider2`、`ProxyProvider3` ...
    
    类名后的数字是 `ProxyProvider` 依赖的 provider 的数量。
    
- `ProxyProvider`、`ChangeNotifierProxyProvider`、`ListenableProxyProvider` ...
    
    它们工作的方式是相似的，但 `ChangeNotifierProxyProvider`  
    会将它的值传递给 `ChangeNotifierProvider` 而非 `Provider`。
    

### 常见问题

#### 我是否能查看(inspect)我的对象的内容?

Flutter 提供的 [DevTools](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fflutter%2Fdevtools) 能够展示特定时刻下的 widget 树。

既然 provider 也同样是 widget，那么它们同样能通过 DevTools 进行查看。

<img src="https://raw.githubusercontent.com/rrousselGit/provider/master/resources/devtools\_providers.jpg" width="200" />

点击一个 provider，即可查看它暴露出的值:

<img src="https://raw.githubusercontent.com/rrousselGit/provider/master/resources/expanded\_devtools.jpg" width="200" />

（以上的开发者工具截图来自于 `/example` 文件夹下的示例）

#### DevTools 只显示了「Instance of MyClass」，我应该怎么做？

默认情况下，DevTools 基于 `toString`，也就使得默认结果是「Instance of MyClass」。

如果要得到更多信息，你有两种方式:

- 使用 Flutter 提供的 [Diagnosticable](https://links.jianshu.com/go?to=https%3A%2F%2Fapi.flutter-io.cn%2Fflutter%2Ffoundation%2FDiagnosticable-class.html) API
    
    在大多数情况下，你只需要在对象上使用 \[DiagnosticableTreeMixin\]\[diagnosticabletreemixin\] 即可，  
    以下是一个自定义 [debugFillProperties](https://links.jianshu.com/go?to=https%3A%2F%2Fapi.flutter-io.cn%2Fflutter%2Ffoundation%2FDiagnosticableTreeMixin%2FdebugFillProperties.html)  
    实现的例子:
    
    ```dart
    class MyClass with DiagnosticableTreeMixin {
      MyClass({this.a, this.b});
    
      final int a;
      final String b;
    
      @override
      void debugFillProperties(DiagnosticPropertiesBuilder properties) {
        super.debugFillProperties(properties);
        // list all the properties of your class here.
        // See the documentation of debugFillProperties for more information.
        properties.add(IntProperty('a', a));
        properties.add(StringProperty('b', b));
      }
    }
    ```
    
- 重写 `toString` 方法
    
    如果你无法使用 \[DiagnosticableTreeMixin\]\[diagnosticabletreemixin\]（比如你的类在一个不依赖于 Flutter 的 package 中），  
    那么你可以通过重写 `toString` 方法来达成效果。
    
    这比使用 \[DiagnosticableTreeMixin\]\[diagnosticabletreemixin\] 要更简单，但能力也有着不足：  
    你无法查看你的对象内部细节。
    
    ```dart
    class MyClass with DiagnosticableTreeMixin {
      MyClass({this.a, this.b});
    
      final int a;
      final String b;
    
      @override
      String toString() {
        return '$runtimeType(a: $a, b: $b)';
      }
    }
    ```
    

#### 在 `initState` 方法里调用 provider 的获取方法时发生了异常，我应该怎么做?

异常的出现是因为你尝试在一个 **永远不会再次被调用的生命周期** 监听 provider。

这意味着你要么使用另外一个生命周期 (`build`)，要么显式声明你并不在意后续更新。

也就是说，原本你的代码是：

```dart
initState() {
  super.initState();
  print(context.watch<Foo>().value);
}
```

现在你应该这么写：

```dart
Value value;

Widget build(BuildContext context) {
  final value = context.watch<Foo>.value;
  if (value != this.value) {
    this.value = value;
    print(value);
  }
}
```

此时 print 只会在 `value` 变化时执行。

或者你也可以这么做：

```dart
initState() {
  super.initState();
  print(context.read<Foo>().value);
}
```

这样只会打印一次 `value`，并且 **忽略后续的更新**。

#### 如何在热更新 (hot-reload) 时处理我的对象？

你可以将你的 provider 对象实现 `ReassembleHandler` 类：

```dart
class Example extends ChangeNotifier implements ReassembleHandler {
  @override
  void reassemble() {
    print('Did hot-reload');
  }
}
```

它们通常会和 `provider` 一同使用:

```dart
ChangeNotifierProvider(create: (_) => Example()),
```

#### 使用 \[ChangeNotifier\] 时，在更新后出现了异常，发生了什么？

通常这是因为 **在 widget 树正在构建时**，\[ChangeNotifier\]\[\] 的某个后代更改了 ChangeNotifier。

最典型的情况是一个发起 Http 请求的 `Future` 被保存在 notifier 内部：

```dart
initState() {
  super.initState();
  context.read<MyNotifier>().fetchSomething();
}
```

这是不被允许的，因为更改会立即生效。

也就是说，一些 widget 可能在 **变更发生前**（获取到旧的值）构建，  
而另一些则可能在 **变更后**（获取到新的值）构建。  
这可能造成 UI 不一致，因此是被禁止的。

所以，你应该在整个 widget 树都能受影响的位置执行变更：

- 在你的 model 的构造方法内直接调用：
    
    ```dart
    class MyNotifier with ChangeNotifier {
      MyNotifier() {
        _fetchSomething();
      }
    
      Future<void> _fetchSomething() async {}
    }
    ```
    
    在不需要传入形参的情况下，这是相当有用的。
    
- 在构建帧的末尾异步执行 (`Future.microtask`)：
    
    ```dart
    initState() {
      super.initState();
      Future.microtask(() =>
        context.read<MyNotifier>(context).fetchSomething(someValue);
      );
    }
    ```
    
    这可能不是理想的使用方式，但你可以利用这样的方法向变更传递参数。
    

#### 处理复杂状态时必须使用 \[ChangeNotifier\]\[\] 吗？

当然不是。

你可以使用任意对象来表示你的状态。举例来说，  
一个可选的架构方案是使用 `Provider.value` 配合 `StatefulWidget`。

下面是使用这种架构的计数器示例：

```dart
class Example extends StatefulWidget {
  const Example({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  ExampleState createState() => ExampleState();
}

class ExampleState extends State<Example> {
  int _count;

  void increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _count,
      child: Provider.value(
        value: this,
        child: widget.child,
      ),
    );
  }
}
```

我们可以通过以下的方式来读取状态：

```dart
return Text(context.watch<int>().toString());
```

接着按以下的方式来修改状态：

```dart
return FloatingActionButton(
onPressed: () => context.read<ExampleState>().increment(),
child: Icon(Icons.plus_one),
);
```

又或者自定义 provider 进行处理。

#### 我可以创建自己的 Provider 吗？

可以，`provider`暴露出了所有构建功能完备的 provider 所需的组件，它包含:

- `SingleChildStatelessWidget`，任意的 widget 都能够与 `MultiProvider` 协作。  
    这个接口暴露为 `package:provider/single_child_widget` 的一部分。
- \[InheritedProvider\]\[\]，在使用 `context.watch` 时可获取的通用 `InheritedWidget`。

此处为一个使用 `ValueNotifier` 作为状态自定义 provider 的例子：  
[https://gist.github.com/rrousselGit/4910f3125e41600df3c2577e26967c91](https://links.jianshu.com/go?to=https%3A%2F%2Fgist.github.com%2FrrousselGit%2F4910f3125e41600df3c2577e26967c91)

#### 我的 widget 重新 build 太频繁了，我应该怎么做？

你可以使用 `context.select` 而非 `context.watch` 来指定只监听对象的部分属性:

举例来说，你可以这么写:

```dart
Widget build(BuildContext context) {
  final person = context.watch<Person>();
  return Text(person.name);
}
```

这可能导致 widget 在 `name` 以外的属性发生变化时也重新进行了构建。

你可以使用 `context.select` 来单独监听 `name` 属性：

```dart
Widget build(BuildContext context) {
  final name = context.select((Person p) => p.name);
  return Text(name);
}
```

如此一来，widget 就不会在 `name` 以外的属性变化时，进行不必要的重构建了。

同样，你也可以使用 \[Consumer\]\[\]/\[Selector\]\[\]，  
可选的 `child` 参数使得 widget 树中只有指定的一部分会重构建。

```dart
Foo(
  child: Consumer<A>(
    builder: (_, a, child) {
      return Bar(a: a, child: child);
    },
    child: Baz(),
  ),
)
```

在这个示例中，只有 `Bar` 会在 `A` 更新时重构建，  
`Foo` 与`Baz` 会避免进行不必要的重复构建。

#### 我可以使用相同类型来查找两个不同的 provider 吗？

不。当你有两个相同类型的不同 provider 时，一个 widget 只会获取 **最近的一个**。

你必须显式声明两个 provider 为不同类型，而不是：

```dart
Provider<String>(
  create: (_) => 'England',
  child: Provider<String>(
    create: (_) => 'London',
    child: ...,
  ),
),
```

推荐的写法:

```dart
Provider<Country>(
  create: (_) => Country('England'),
  child: Provider<City>(
    create: (_) => City('London'),
    child: ...,
  ),
),
```

#### 我可以消费一个接口并且提供一个实现吗？

可以，编译器需要你提供类型提示 (`type hint`)，来指定将要被消费的接口，  
同时你需要在 `create` 中提供具体实现:

```dart
abstract class ProviderInterface with ChangeNotifier {
  ...
}

class ProviderImplementation with ChangeNotifier implements ProviderInterface {
  ...
}

class Foo extends StatelessWidget {
  @override
  build(context) {
    final provider = Provider.of<ProviderInterface>(context);
    return ...
  }
}

ChangeNotifierProvider<ProviderInterface>(
  create: (_) => ProviderImplementation(),
  child: Foo(),
),
```

#### 现有的 providers

`provider` 中提供了几种不同类型的「provider」，供不同类型的对象使用。

完整的可用列表参见 [此处](https://links.jianshu.com/go?to=https%3A%2F%2Fpub.flutter-io.cn%2Fdocumentation%2Fprovider%2Flatest%2Fprovider%2Fprovider-library.html)。

## pull\_to\_refresh

#### 介绍

一个提供上拉加载和下拉刷新的组件,同时支持Android和Ios  

#### 特性

- 提供上拉加载和下拉刷新
- 几乎适合所有部件
- 提供全局设置默认指示器和属性
- 提供多种比较常用的指示器
- 支持Android和iOS默认滑动引擎,可限制越界距离,打造自定义弹性动画,速度,阻尼等。
- 支持水平和垂直刷新,同时支持翻转列表(四个方向)
- 提供多种刷新指示器风格:跟随,不跟随,位于背部,位于前部, 提供多种加载更多风格
- 提供二楼刷新,可实现类似淘宝二楼,微信二楼,携程二楼
- 允许关联指示器存放在Viewport外部,即朋友圈刷新效果

#### 用法

添加这一行到pubspec.yaml

```yaml
   dependencies:
    pull_to_refresh: ^2.0.0
```

导包

```dart
    import 'package:pull_to_refresh/pull_to_refresh.dart';
```

简单例子如下,**_这里一定要注意的是,ListView一定要作为SmartRefresher的child,不能与其分开,详细原因看 <a href="child">下面</a>_**

```dart
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    if(mounted)
    setState(() {

    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
               body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }

  // 1.5.0后,应该没有必要加这一行了
 // @override
 // void dispose() {
    // TODO: implement dispose
 //   _refreshController.dispose();
//    super.dispose();
//  }
```

全局配置RefreshConfiguration,配置子树下的所有SmartRefresher表现,一般存放于MaterialApp的根部,用法和ScrollConfiguration是类似的。  
另外,假如你某一个SmartRefresher表现和全局不一样的情况,你可以使用RefreshConfiguration.copyAncestor从祖先RefreshConfiguration复制属性过来并替换不为空的属性。

```dart
    // 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
     RefreshConfiguration(
         headerBuilder: () => WaterDropHeader(),        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
         footerBuilder:  () => ClassicFooter(),        // 配置默认底部指示器
         headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
         springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
         maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
         maxUnderScrollExtent:0, // 底部最大可以拖动的范围
         enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
         enableLoadingWhenFailed : true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
         hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
         enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: MaterialApp(
            ........
        )
    );
```

1.5.6新增国际化处理特性,你可以在MaterialApp或者CupertinoApp追加如下代码:

```dart
    MaterialApp(
            localizationsDelegates: [
              // 这行是关键
              RefreshLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('zh'),
            ],
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              //print("change language");
              return locale;
            },
    )
```

#### 对SmartRefresher里child详细说明

自1.4.3,child属性从ScrollView转变为Widget,但是这并不意味着对于所有Widget处理是一样的。SmartRefresher内部实现机制并非是类如NestedScrollView  
  
  
这里的处理机制分了两个大类,`第一类`是继承于ScrollView的那一类组件,目前来说,就只有这三种,`ListView`,`GridView`,`CustomScrollView`。`第二类`,是非继承于ScrollView的那类组件,一般是存放空视图,非滚动视图(非滚动转化为滚动),PageView,无需你自己通过`LayoutBuilder`估计高度。  
  
  
对于第一类的处理机制是从内部"非法"取出slivers。第二类,则是把child直接放进类如`SliverToBoxAdapter`。通过前后拼接header和footer组成slivers,然后SmartRefresher内部把slivers放进`CustomScrollView`,你可以把SmartRefresher理解成`CustomScrollView`,因为内部就是返回CustomScrollView。所以,这里child结点是不是ScrollView区别是很大的。  
  
  
  
现在,猜想你有一个需求:需要在ScrollView外部增加背景,滚动条什么的。下面演示错误和正确的做法

```dart
   // 错误的做法
   SmartRefresher(
      child: ScrollBar(
          child: ListView(
             ....
      )
    )
   )

   // 正确的做法
   ScrollBar(
      child: SmartRefresher(
          child: ListView(
             ....
      )
    )
   )
```

再演示多一种错误做法,把ScrollView存放到另外一个widget

```dart
   //error
   SmartRefresher(
      child:MainView()
   )

   class MainView extends StatelessWidget{
       Widget build(){
          return ListView(
             ....
          );
       }
   }
```

上面的错误做法就导致了scrollable再嵌套一个scrollable了,导致你无论怎么滑也看不到header和footer。  
同理的,你可能需要配合NotificationListener,ScrollConfiguration...这类组件,记住,千万别在ScrollView(你想增加刷新部分)外和SmartRefresher内存放。

## get

## dio

#### 介绍

一个强大的 Dart Http 客户端，支持拦截器、全局配置、FormData、请求取消、文件下载、超时等。

#### 用法

```dart
import 'package:dio/dio.dart';
void getHttp() async {
  try {
    var response = await Dio().get('http://www.baidu.com');
    print(response);
  } catch (e) {
    print(e);
  }
}
```

## fluttertoast

#### 用法

```css
Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
```

## carousel\_slider

#### 用法

```kotlin
CarouselSlider(
  options: CarouselOptions(height: 400.0),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
)
```

## connectivity

#### 用法

检查当前状态的示例用法：

```dart
import 'package:connectivity/connectivity.dart';

var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
}
```

还可以通过订阅连接插件公开的流来监听网络状态变化：

```dart
import 'package:connectivity/connectivity.dart';

@override
initState() {
  super.initState();

  subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
  })
}

// Be sure to cancel subscription after you are done
@override
dispose() {
  super.dispose();

  subscription.cancel();
}
```

## equatable

一个 Dart 包，有助于实现基于值的相等性，而无需显式覆盖 == 和 hashCode。