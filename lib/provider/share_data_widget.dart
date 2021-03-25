import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  //需要共享的数据
  final int data;

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //定义一个便捷的方法，方便子树中的 widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
    // return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }

  ///该回调决定当 data 发生变化的时候，是否通知子树中依赖 data 的 widget
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    //返回true：则子树中依赖当前 widget 的 widget 的 didChangeDependencies 会被调用
    return oldWidget.data != data;
  }
}


