import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/containers/BoxTest.dart';
import 'package:flutter_study/containers/DecoratedTest.dart';
import 'package:flutter_study/containers/ScaffoldRoute.dart';
import 'package:flutter_study/layout/AlignTest.dart';
import 'package:flutter_study/layout/FlexTest.dart';
import 'package:flutter_study/layout/RowTest.dart';
import 'package:flutter_study/layout/StackAndPositionedTest.dart';
import 'package:flutter_study/layout/WrapAndFlowTest.dart';
import 'package:flutter_study/state/state.dart';
import 'containers/ContainerTest.dart';
import 'file:///D:/flutter/project/FlutterStudy/flutter_study/lib/containers/TransformTest.dart';
import 'package:flutter_study/wedget/Button.dart';
import 'package:flutter_study/wedget/Echo.dart';
import 'package:flutter_study/wedget/Image.dart';
import 'package:flutter_study/wedget/InputText.dart';
import 'package:flutter_study/wedget/SwitchAndCheckboxTest.dart';
import 'package:flutter_study/wedget/Text.dart';

import 'containers/PaddingTest.dart';
import 'layout/ColumTestn.dart';

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
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: ScaffoldRoute());
  }
}
