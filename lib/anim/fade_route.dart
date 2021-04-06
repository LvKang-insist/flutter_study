import 'package:flutter/cupertino.dart';

class FadeRoute extends PageRoute {
  final WidgetBuilder builder;

  ///动画时间
  @override
  final Duration transitionDuration;

  ///透明
  @override
  final bool opaque;

  ///您是否可以通过点击模式障碍来消除此路线。
  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  ///路由处于非活动状态时是否应保留在内存中
  @override
  final bool maintainState;

  FadeRoute(
      {@required this.builder,
      this.transitionDuration = const Duration(milliseconds: 300),
      this.opaque = true,
      this.barrierDismissible = false,
      this.barrierColor,
      this.barrierLabel,
      this.maintainState = true});

  ///构建此路由的主要内容
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  ///路由动画
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //打开新路由
    if (isActive) {
      return FadeTransition(opacity: animation, child: builder(context));
    }
    //是返回，不应用过度动画
    return Padding(padding: EdgeInsets.zero);
  }
}
