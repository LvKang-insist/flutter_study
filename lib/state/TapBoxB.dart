import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//------------------------ ParentWidget -----------------------
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxB(
        active: _active,
        onChange: _handleTapBoxChanged,
      ),
    );
  }
}
//------------------------ TapBoxB -----------------------
class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  TapBoxB({Key key, this.active, this.onChange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(active ? "Active" : "Inactive",
              style: TextStyle(fontSize: 32, color: Colors.white)),
        ),
        decoration:
            BoxDecoration(color: active ? Colors.lightBlue : Colors.green),
      ),
      onTap: () => onChange(!active),
    );
  }
}
