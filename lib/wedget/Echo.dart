import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({Key key, @required this.text, this.backgroundColor: Colors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("hello word"),
        // color: backgroundColor,
      )
    );
  }
}
