import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Text("hello "),
          //最大行数为一 ,TextOverflow.ellipsis ：省略号代替
          Text(
            "hello! I'm 345 " * 5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          //文本缩放因子
          Text("hello 345", textScaleFactor: 2),
          //
          Text("hello 345",)
        ],
      ),
    ));
  }
}
