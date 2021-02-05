import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/state/state.dart';
import 'package:flutter_study/wedget/Button.dart';
import 'package:flutter_study/wedget/Echo.dart';
import 'package:flutter_study/wedget/Image.dart';
import 'package:flutter_study/wedget/SwitchAndCheckboxTest.dart';
import 'package:flutter_study/wedget/Text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Widget相关",
        theme: ThemeData(primaryColor: Colors.blue),
        // home: Echo(text: "hello word"));
        // home: CounterWidget(counter: 0)
        home: SwitchAndCheckboxTest());
  }
}
