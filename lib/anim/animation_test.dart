import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/anim/GrowTransition.dart';
import 'package:flutter_study/anim/RouteTestPage.dart';
import 'package:flutter_study/anim/fade_route.dart';

import 'animagedImage.dart';

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

///需要继承 TickerProvider，如有有多个 AnimationController，则
///应该使用 TickerProviderStateMixin
class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // animation.addStatusListener((status) {
    //   //结束时反向执行
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     //在初始状态则正向执行
    //     controller.forward();
    //   }
    // });
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画")),
      body: GestureDetector(
        child: GrowTransition(Image.asset("images/avatar.jpg"), animation),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: RouteTestPage(),
            );
          }));
          // Navigator.push(context, FadeRoute(builder: (context) {
          //   return RouteTestPage();
          // }));
        },
      ),
    );
  }

  @override
  void dispose() {
    //销毁时释放动画资源
    controller.dispose();
    super.dispose();
  }
}
