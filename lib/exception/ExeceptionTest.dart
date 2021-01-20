import 'dart:async';

import 'package:flutter/material.dart';

final error = (FlutterErrorDetails detail) => FlutterError.reportError(detail);

void collectLog(String line) {
  //收集日志
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
  var details = FlutterErrorDetails(
    exception: obj,
    stack: stack,
    library: "lib.exception",
  );
  error(details);
}

void main() {
  runZoned(() => runApp(MyApp()), zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    collectLog(line); //收集日志
  }), onError: (Object obj, StackTrace stack) {
    makeDetails(obj, stack); //构建错误信息，并上报平台
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //app name
      title: 'FlutterStudy',
      // ignore: missing_return
      onGenerateRoute: (settings) {},
      navigatorObservers: [NavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //应用首页路由
      home: ExceptionTest(),
    );
  }
}

class ExceptionTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExceptionState();
  }
}

class _ExceptionState extends State<ExceptionTest> {
  @override
  Widget build(BuildContext context) {
    // runZoned(() {
    //   print('hello world');
    //   throw NullThrownError();
    // }, zoneSpecification: new ZoneSpecification(
    //   print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    //     parent.print(zone, "Intercepted $line");
    //   },
    // ), onError: (Object obj, StackTrace stack) {
    //   var details = FlutterErrorDetails(
    //     exception: obj,
    //     stack: stack,
    //     library: "lib.exception",
    //   );
    //   error(details);
    // });
    // return Scaffold(
    //   appBar: AppBar(title: Text("title"),),
    // );
    try {
      throw NullThrownError();
    } catch (e, s) {
      var details = FlutterErrorDetails(
        exception: e,
        stack: s,
        library: "lib.exception",
      );
      error(details);
    }
    // TODO: implement build
    throw UnimplementedError();
  }
}
