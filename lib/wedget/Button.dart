import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () => print('RaisedButton'),
          ),
          FlatButton(
            child: Text("flatButton"),
            onPressed: () => print('flatButton'),
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () => print('OutlineButton'),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up_alt),
            onPressed: () => print('点赞'),
          ),
          //带图标的按钮，通过 icon 构造函数创建带图标的按钮
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () => print('发送'),
          ),
          FlatButton.icon(
            icon: Icon(Icons.live_help),
            label: Text("疑问"),
            onPressed: () => print('疑问'),
          ),
          FlatButton(
            color: Color(0x000000),
            child: Text("提交"),
            splashColor: Colors.grey,
            highlightColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () => print('提交'),
          )
        ],
      ),
    ));
  }
}
