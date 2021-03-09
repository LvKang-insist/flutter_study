import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      // body: Container(
      //   // height: 120,
      //   // width: 120,
      //   color: Colors.blue[50],
      //   // child: Align(
      //   //   alignment: Alignment.topRight,
      //   //   child: FlutterLogo(
      //   //     size: 60,
      //   //   ),
      //   // ),
      //   child: Align(
      //     // 2x60/2+60/2 ，0x60/2 + 60/2
      //     //=90           =30
      //     alignment: Alignment(2, 0),
      //     widthFactor: 2,
      //     heightFactor: 2,
      //     child: FlutterLogo(
      //       size: 60,
      //     ),
      //   ),
      // ),
      body: Container(
        height: 120,
        width: 120,
        color: Colors.blue[50],
        child: Align(
          alignment: FractionalOffset(0.2, 0.6),
          // 0.2 *60 ， 0.6 * 60
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
