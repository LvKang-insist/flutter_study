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
      child: TapBoxC(
        active: _active,
        onChange: _handleTapBoxChanged,
      ),
    );
  }
}

//------------------------ TapBoxC -----------------------
class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  TapBoxC({Key key, this.active, this.onChange});

  @override
  State<StatefulWidget> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails detailis) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails detailis) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      //按下事件
      onTapUp: _handleTapUp,
      //抬起事件
      onTapCancel: _handleTapCancel,
      //取消事件
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(widget.active ? "Active" : "Inactive",
              style: TextStyle(fontSize: 32, color: Colors.white)),
        ),
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightBlue : Colors.green,
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10)
                : null),
      ),
    );
  }
}
