import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(_active ? "Active" : "Inactive",
              style: TextStyle(fontSize: 32, color: Colors.white)),
        ),
        decoration:
            BoxDecoration(color: _active ? Colors.lightBlue : Colors.green),
      ),
    );
  }
}
