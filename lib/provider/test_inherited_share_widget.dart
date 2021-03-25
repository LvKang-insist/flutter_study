import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/provider/share_data_widget.dart';
import 'package:flutter_study/provider/test_share_widget.dart';

class TestInheritedWidget extends StatefulWidget {
  @override
  _TestInheritedWidgetState createState() => _TestInheritedWidgetState();
}

class _TestInheritedWidgetState extends State<TestInheritedWidget> {
  int count = 0;
  TestShareWidget _cacheShareWidget = TestShareWidget();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _cacheShareWidget,
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，count 自增，然后重新 build，ShareDataWidget 将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
