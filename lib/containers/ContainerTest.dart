import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 120),
        constraints: BoxConstraints.tightFor(width: 200, height: 150),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
            //北京径向渐变
            gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: 58),
            //卡片阴影
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(2, 2), blurRadius: 12),
            ]),
        child: Text("521", style: TextStyle(color: Colors.white, fontSize: 40)),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment(0,0),
      ),
    );
  }
}
