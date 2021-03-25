import 'package:flutter/cupertino.dart';
import 'package:flutter_study/provider/share_data_widget.dart';

class TestShareWidget extends StatefulWidget {
  @override
  _TestShareWidgetState createState() => _TestShareWidgetState();
}

class _TestShareWidgetState extends State<TestShareWidget> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(ShareDataWidget.of(context).data.toString());
    // return Text("test");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('发生改变');
  }
}
