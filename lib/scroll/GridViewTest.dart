import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: getMaxGridView(),
      ),
    );
  }

  Widget getMaxGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120, //最大长度不能超过120
          childAspectRatio: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10),
      children: [
        Container(
          color: Colors.red,
          child: Icon(Icons.accessible),
        ),
        Container(
          color: Colors.grey,
          child: Icon(Icons.map),
        ),
        Container(
          color: Colors.green,
          child: Icon(Icons.dashboard),
        ),
        Container(
          color: Colors.yellow,
          child: Icon(Icons.schedule),
        ),
        Container(
          color: Colors.blueAccent,
          child: Icon(Icons.translate),
        ),
        Container(
          color: Colors.brown,
          child: Icon(Icons.margin),
        ),
        Container(
          color: Colors.pinkAccent,
          child: Icon(Icons.fingerprint),
        )
      ],
    );
  }

  Widget getCountGridView() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      children: [
        Container(
          color: Colors.red,
          child: Icon(Icons.accessible),
        ),
        Container(
          color: Colors.grey,
          child: Icon(Icons.map),
        ),
        Container(
          color: Colors.green,
          child: Icon(Icons.dashboard),
        ),
        Container(
          color: Colors.yellow,
          child: Icon(Icons.schedule),
        ),
        Container(
          color: Colors.blueAccent,
          child: Icon(Icons.translate),
        ),
        Container(
          color: Colors.brown,
          child: Icon(Icons.margin),
        ),
        Container(
          color: Colors.pinkAccent,
          child: Icon(Icons.fingerprint),
        )
      ],
    );
  }

  Widget defaultGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //横轴三个子 Widget
        childAspectRatio: 1.0, // 子组件宽高比
        mainAxisSpacing: 5, //主轴方向间距
        crossAxisSpacing: 10, //横轴方向间距
      ),
      children: [
        Container(
          color: Colors.red,
          child: Icon(Icons.accessible),
        ),
        Container(
          color: Colors.grey,
          child: Icon(Icons.map),
        ),
        Container(
          color: Colors.green,
          child: Icon(Icons.dashboard),
        ),
        Container(
          color: Colors.yellow,
          child: Icon(Icons.schedule),
        ),
        Container(
          color: Colors.blueAccent,
          child: Icon(Icons.translate),
        ),
        Container(
          color: Colors.brown,
          child: Icon(Icons.margin),
        ),
        Container(
          color: Colors.pinkAccent,
          child: Icon(Icons.fingerprint),
        )
      ],
    );
  }
}
