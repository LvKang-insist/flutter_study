import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EventTest extends StatefulWidget {
  @override
  _EventTestState createState() => _EventTestState();
}

class _EventTestState extends State<EventTest>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flictTest(),
    );
  }

  var _left2 = 100.0;

  Widget flictTest() {
    return Stack(
      children: [
        Positioned(
          left: _left2,
          top: 100,
          child: Listener(
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left2 += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print('onHorizontalDragEnd');
              },
            ),
            onPointerDown: (details){
              print('onPointerDown');
            },
            onPointerUp: (details){
              print('onPointerUp');
            },
          ),
        )
      ],
    );
  }

  var _top1 = 100.0;
  var _left1 = 100.0;

  Widget bothDirection() {
    return Stack(
      children: [
        Positioned(
          top: _top1,
          left: _left1,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top1 += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left1 += details.delta.dx;
              });
            },
          ),
        )
      ],
    );
  }

  bool _toggle = false; //变色开关
  TapGestureRecognizer _recognizer = TapGestureRecognizer();

  Widget bothDirectionTest() {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
            text: "点击变色",
            style: TextStyle(
                fontSize: 30, color: _toggle ? Colors.red : Colors.yellow),
            recognizer: _recognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        TextSpan(text: "你好世界")
      ])),
    );
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _recognizer.dispose();
    super.dispose();
  }

  double _width = 100.0;

  Widget scale() {
    return Center(
      child: GestureDetector(
        child: Image.asset("./images/avatar.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在 0.8 到 10 倍之间
            _width = 100 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }

  double _top = 100.0; //距离顶部的偏移
  double _left = 100.0; //距离左边的偏移
  Widget move() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          // left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下回调
            onPanDown: (DragDownDetails e) {
              print('用户手指按下 ${e.globalPosition}');
            },
            // //手指滑动回调
            // onPanUpdate: (DragUpdateDetails e) {
            //   //滑动时，更新偏移
            //   print('滑动');
            //   setState(() {
            //     _left += e.delta.dx;
            //     _top += e.delta.dy;
            //   });
            // },
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //滑动结束，打印 x，y轴速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }

  //事件名称
  String _operation = "";

  Widget click() {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 200,
          color: Colors.blue,
          alignment: Alignment.center,
          height: 100,
          child: Text(_operation,
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        onTap: () => upDateText("tap"), //单击
        onDoubleTap: () => upDateText("doubleTap"), //双击
        onLongPress: () => upDateText("longPress"), //长按
      ),
    );
  }

  void upDateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
