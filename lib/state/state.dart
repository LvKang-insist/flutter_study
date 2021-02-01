import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int counter;

  const CounterWidget({Key key, this.counter: 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterWidget();
  }
}

class _CounterWidget extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化
    _counter = widget.counter;
    print("initState：初始化");
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget：widget 重新构建');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate：State 被移除');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble：热重载');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies：State 对象依赖发生变化');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose：State 永久移除');
  }

  @override
  Widget build(BuildContext context) {
    print('build：构建 widget');
    return Scaffold(
        body: Center(
            child: FlatButton(
      child: Text("$_counter"),
      onPressed: () => setState(() => ++_counter),
    )));
  }
}
