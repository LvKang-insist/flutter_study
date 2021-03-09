import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          //如果到了末尾
          if (_words[index] == loadingTag) {
            //不足 100，继续获取数据
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: .0,
            color: Colors.red,
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    return await Future.delayed(Duration(seconds: 3)).then((value) => {
          setState(() {
            _words.removeRange(0, _words.length - 1);
            _words.insertAll(
                _words.length - 1,
                //生成20个单词
                generateWordPairs()
                    .take(20)
                    .map((e) => e.asPascalCase)
                    .toList());
          })
        });
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) => {
          if (mounted)
            {
              setState(() {
                //重新构建列表
                _words.insertAll(
                    _words.length - 1,
                    //生成20个单词
                    generateWordPairs()
                        .take(20)
                        .map((e) => e.asPascalCase)
                        .toList());
              })
            }
        });
  }
}
