import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollControllerTestState();
}

class _ScrollControllerTestState extends State<ScrollControllerTest> {
  ScrollController _controller = new ScrollController();

  //是否显示返回到顶部的按钮
  bool showToTopBtn = false;

  //进度百分比
  String _progress = "0%";

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄漏，需要调用 _controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            var progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print('BottomEdge：${notification.metrics.extentAfter == 0}');
            return true;
          },
          child:Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                },
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    //动画时间，以及曲线
                    duration: Duration(milliseconds: 600),
                    curve: Curves.ease);
              },
            ),
    );
  }
}
