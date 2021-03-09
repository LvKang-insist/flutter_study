import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/layout/TestFlowDelegate.dart';

class WrapAndFlowTest extends StatelessWidget {
  final List<String> _list = const [
    "爱是你我",
    "一壶老酒",
    "最炫民族风",
    "怒放的生命",
    "再见青春",
    "北京，北京"
  ];

  List<Widget> getMusicList() {
    /* List<Widget> widgets = new List();
    _list.forEach((element) {
      widgets.add(RaisedButton(
        child: Text(element),
        onPressed: () => print(element),
      ));
    });*/

    return _list
        .map((e) => Container(
              width: 140,
              height: 40,
              child: RaisedButton(
                child: Text(e),
                onPressed: () => print(e),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WarpAndFlow"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
            children: getMusicList(),
          ),
        ));
  }
}
