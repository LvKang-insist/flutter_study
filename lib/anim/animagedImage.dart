import 'package:flutter/cupertino.dart';

class AnimatedImage extends AnimatedWidget {

  AnimatedImage({Key key, Animation<double> animation})
      :super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
          "images/avatar.jpg", width: animation.value, height: animation.value),
    );
  }
}