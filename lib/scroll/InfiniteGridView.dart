import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三个
            childAspectRatio: 1, //宽高相等
            mainAxisSpacing: 15,
            crossAxisSpacing: 15),
        itemCount: _widgets.length,
        itemBuilder: (context, index) {
          if (index == _widgets.length - 1 && _widgets.length < 200) {
            _retrieveIcons();
          }
          return _widgets[index];
        },
      ),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 2)).then((value) => {
          if (mounted)
            {
              setState(() {
                _widgets.addAll([
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
                ]);
              })
            }
        });
  }
}
