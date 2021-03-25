import 'package:flutter/cupertino.dart';

///一个通用的 InheritedProvider，保存任何需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  ///共享的状态使用泛型
  final T data;

  InheritedProvider({@required this.data, Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    ///返回true，表示每次都会调用子孙节点的 didChangeDependencies
    return true;
  }
}
