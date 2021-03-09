import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250, //展开高度
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollView"),
              background: Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F2e.zol-img.com.cn%2Fproduct%2F52%2F870%2FceFrX1n7iWFk6.jpg&refer=http%3A%2F%2F2e.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617810598&t=4b684cd92d7163552d610afba335282c",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("grid item $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9)],
                child: Text("list item $index"),
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
