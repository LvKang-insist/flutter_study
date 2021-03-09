import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: getTest(),
      ),
    );
  }

  Widget getTest() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getRotate(),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18),
        )
      ],
    );
  }
  Widget getRotate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: RotatedBox(
        quarterTurns: 1, //旋转90度(1/4)
        child: Text("hello world"),
      ),
    );
  }

  Widget getScale() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.scale(
        scale: 1.5,
        child: Text("hello world"),
      ),
    );
  }



  //平移
  Widget getTranslate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.translate(
        offset: Offset(10, 10),
        child: Text("hello world"),
      ),
    );
  }

  //倾斜
  Widget getSkew() {
    return Transform(
      alignment: Alignment(-1, -1), //
      transform: Matrix4.skewY(0.3), //沿 Y 轴倾斜0.3弧度
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.deepOrange,
        child: const Text('Apartment for rent!'),
      ),
    );
  }
}
