/// @name：stagger_animation
/// @package：anim
/// @author：345 QQ:1831712732
/// @time：2021/04/21 14:36
/// @des：
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final Animation controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    //高度，Interval用来指定整个动画过程中的起点和终点，前60%的动画时间
    height = Tween<double>(begin: .0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    //颜色
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    //内边距
    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: padding.value,
        child: Container(
          color: color.value,
          width: 50.0,
          height: height.value,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}
