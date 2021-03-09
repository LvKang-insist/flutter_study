import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/scroll/InfiniteListView.dart';

import 'ScrollControllerTest.dart';

class ListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.red,
    );
    // return getListViewSeparated(divider1,divider2);
    // return InfiniteListView();
    return ScrollControllerTest();
  }


  Widget getListViewSeparated(Widget divider1, Widget divider2) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index"),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  Widget getListViewBuilder(BuildContext context) {
    return Column(
      children: [
        Text("商品列表"),
        Expanded(
          child: ListView.builder(
            itemCount: 100, //列表项为100
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index",
                    style: TextStyle(fontSize: 25, color: Colors.red)),
              );
            },
          ),
        )
      ],
    );
  }
}
