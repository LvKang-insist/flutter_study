import 'package:flutter/cupertino.dart';

/// @name：hero_animation_test_to
/// @package：anim
/// @author：345 QQ:1831712732
/// @time：2021/04/07 15:13
/// @des：

class HeroAnimationTestB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/avatar.jpg"),
      ),
    );
  }
}
