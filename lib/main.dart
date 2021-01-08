// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';

import 'RouteStudy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //app name
      title: 'FlutterStudy',
      // ignore: missing_return
      onGenerateRoute: (settings) {

      },
      navigatorObservers: [
        NavigatorObserver()
      ],
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
        "router_test": (context) => RouterTestRoute(),
        "home": (context) => MyHomePage(title: "Flutter Study")
      },
      //应用首页路由
      home: MyHomePage(title: 'Flutter Study'),
    );
  }
}

/// 首页，StatefulWidget:一个有状态的组件，StatelessWidget无状态的组件
/// StatefulWidget 至少由两个类组成，一个 StatefulWidget类，一个 State 类
/// StateFulWidget 类本身是不变的,但是 State 类中持有的状态在 widget 生命周期中可能发生变化
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //标题
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// StatelessWidget 无状态组件
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterStudy"),
      ),
      body: Column(
        children: [
          Text("This is new route",
              style: Theme.of(context).textTheme.headline3),
          TextButton(
              child: Text(args),
              onPressed: () {
                Navigator.pushNamed(context, "router_test");
              })
        ],
      ),
    );
  }
}

/// _MyHomePageState 类是 MyHomePage 对应的状态类
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ///点击按钮时，会调用此函数，setState 接受一个 Function
  ///setState 方法会先执行自增_counter，然后通知 Flutter 框架，有状态发生改变
  ///Flutter 框架收到通知后，会执行 build 根据新的状态重新构建界面，Flutter 做了优化，
  ///使重新执行变得很快，所以你可以重新构建任何一需要更新的东西，而无需分别修改 widget
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// 构建 UI 的逻辑在 build 方法中，当 MyHomePage 第一次创建时，_MyHomePageState类
  /// 会被创建，创建完成后就会调用 build 方法来构建 widget 树，最终将 widget 树渲染
  /// 到设备屏幕上
  @override
  Widget build(BuildContext context) {
    /// Scaffold 是 Material 库提供的脚手架
    /// 默认提供了 导航，标题，主屏幕的 widget 树的 body 属性
    return Scaffold(
      appBar: AppBar(
        //设置title
        title: Text(widget.title),
      ),
      body: Center(
        /// center 可以将子组件对齐到屏幕中心，此例中是 column
        /// column 作用是将所有子沿屏幕垂直方向依次排列
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter', //文本
              style: Theme.of(context).textTheme.headline4, //主题
            ),
            FlatButton(
              child: Text("点击跳转"),
              textColor: Colors.red,
              onPressed: () {
                //导航到新的路由
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }
                Navigator.pushNamed(context, "new_page",
                    arguments: "Hello World");
              },
            )
          ],
        ),
      ),

      /// 右下角带 + 的悬浮按钮，onPressed 接受一个函数，会在点击后进行调用
      /// tooltip：长按提示问题
      /// 图标
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: Icon(Icons.add, size: 20.toDouble()),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
