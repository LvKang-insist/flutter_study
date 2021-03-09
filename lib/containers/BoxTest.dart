import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Box"),
        actions: [
          UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            ),
          )
        ],
      ),
      body: getUnConstrainedBox(),
    );
  }

  Widget getConstrainedBox() {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50),
        child: getRedBackground());
  }

  Widget getSizedBox() {
    return SizedBox(width: 50, height: 50, child: getRedBackground());
  }

  Widget getConstrainedBoxS() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 90, minHeight: 50),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 50, minHeight: 90),
        child: getRedBackground(),
      ),
    );
  }

  Widget getUnConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 90, minHeight: 50),
      child: UnconstrainedBox(
        child: ConstrainedBox(
          //去除父级限制
          constraints: BoxConstraints(minWidth: 50, minHeight: 90),
          child: getRedBackground(),
        ),
      ),
    );
  }

  Widget getRedBackground() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
