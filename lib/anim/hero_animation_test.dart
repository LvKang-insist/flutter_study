/// @name：hero_animation_test
/// @package：anim
/// @author：345 QQ:1831712732
/// @time：2021/04/07 15:05
/// @des：飞行动画

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/anim/hero_animation_test_to.dart';

class HeroAnimationTestA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          //唯一标记，前后两个路由页 Hero 的 tag 必须相同
          tag: "avatar",
          child: ClipOval(
            child: Image.asset("images/avatar.jpg", width: 50),
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(title: Text("原图")),
                  body: HeroAnimationTestB(),
                ));
          }));
        },
      ),
    );
  }
}
