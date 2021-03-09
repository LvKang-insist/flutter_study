import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedTest"),
      ),
      body: Container(
        child: DecoratedBox(
          //background：背景，foreground：前景
          position: DecorationPosition.background,
          decoration: BoxDecoration(
              //背景渐变
              gradient:
                  LinearGradient(colors: [Colors.red, Colors.orange[700]]),
              //圆角
              borderRadius: BorderRadius.circular(10),
              //阴影
              boxShadow: [
                BoxShadow(color: Colors.black26, offset: Offset(2, 2))
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
