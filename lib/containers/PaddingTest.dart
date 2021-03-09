import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("padding"),
      ),
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 15, 20),
          child: Text("I am 345"),
        ),
      ),
    );
  }
}
