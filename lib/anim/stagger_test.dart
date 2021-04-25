/// @name：stagger_test
/// @package：anim
/// @author：345 QQ:1831712732
/// @time：2021/04/21 15:31
/// @des：

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/anim/stagger_animation.dart';

class StaggerTest extends StatefulWidget {
  @override
  _StaggerTestState createState() => _StaggerTestState();
}

class _StaggerTestState extends State<StaggerTest>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  _playAnimation() async {
    try {
      //正向执行动画
      await _controller.forward().orCancel;
      //反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //动画被取消了，可能是因为我们被处理了
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: StaggerAnimation(controller: _controller),
        ),
      ),
    );
  }
}
