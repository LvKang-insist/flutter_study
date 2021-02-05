import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE814";
    icons += " \uE200";
    icons += " \uE80D";

    return Scaffold(
      appBar: AppBar(
        title: Text("image"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.accessible, color: Colors.green),
              Icon(Icons.error, color: Colors.green),
              Icon(Icons.fingerprint, color: Colors.green)
            ],
          )
        ],
      ),
    );
  }
}
