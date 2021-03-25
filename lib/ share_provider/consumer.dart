import 'package:flutter/cupertino.dart';
import 'package:flutter_study/%20share_provider/change_notifier_provider.dart';

class Consumer<T> extends StatelessWidget {

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  Consumer({Key key, @required this.builder, this.child});

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context)); //自动获取 model
  }

}
