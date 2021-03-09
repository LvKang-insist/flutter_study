import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackAndPositionedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StackAndPositioned"),
        ),

        ///通过 ConstrainedBox 来确保 Stack 占满屏幕
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [

              Positioned(
                left: 18,
                child: Text("I am 345"),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
              Positioned(
                top: 18,
                child: Text("your friend"),
              )
            ],
          ),
        ));
  }
}
