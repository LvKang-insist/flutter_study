import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TipRoute extends StatelessWidget {
  TipRoute({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(text),
                RaisedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: Text("返回"),
                )
              ],
            ),
          )),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TipRoute(text: "我是参数");
            })).then((value) => print("路由返回值 $value"));
          },
          child: Text("打开提示页面"),
        ),
      ),
    );
  }
}
