import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// StatefulWidget:一个有状态的组件，StatelessWidget无状态的组件
/// StatefulWidget 至少由两个类组成，一个 StatefulWidget类，一个 State 类
/// StateFulWidget 类本身是不变的,但是 State 类中持有的状态在 widget 生命周期中可能发生变化
class AssetsLoad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetsLoadState();
  }
}

class _AssetsLoadState extends State<AssetsLoad> {
  var imageID = "";
  var text = "";

  void uploadImage() {
    setState(() {
      imageID = "images/icon.png";
    });
  }

  Future<String> loadText() async {
    return await rootBundle.loadString("assets/file.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资源加载"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Image.asset("$imageID", fit: BoxFit.cover),
              width: 100,
              height: 100,
            ),
          ),
          RaisedButton(
            onPressed: () {
              uploadImage();
            },
            child: Text("加载图片"),
          ),
          Container(
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            width: 100,
            height: 100,
          ),
          RaisedButton(
            onPressed: () {
              loadText().then((value) {
                setState(() {
                  text = value;
                });
              });
            },
            child: Text("加载文本"),
          )
        ],
      ),
    );
  }
}
