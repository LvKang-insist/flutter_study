/// @name：animated_swticher_test
/// @package：anim
/// @author：345 QQ:1831712732
/// @time：2021/04/21 22:26
/// @des：
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherTest extends StatefulWidget {
  AnimatedSwitcherTest({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherTestState createState() =>
      _AnimatedSwitcherTestState();
}

class _AnimatedSwitcherTestState
    extends State<AnimatedSwitcherTest> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return ScaleTransition(scale: animation, child: child,);
            },
            //显式的指定 key，不同的 key 会被认为是不同的 Text，这样才能执行动画
            child: Text("$_count",
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4),
          ),
          RaisedButton(
              child: const Text('+1'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              })
        ],
      ),
    );
  }
}
