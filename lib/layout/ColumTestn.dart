import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ColumnTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("线性布局 Row，Column"),
//       ),
//       body: ConstrainedBox(
//         constraints: BoxConstraints(minWidth: double.infinity),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text("Hi"), Text("World")],
//         ),
//       ),
//     );
//   }
// }
class ColumnTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 Row，Column"),
        ),
        body: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
              children: <Widget>[
               Expanded(
                 child:  Container(
                   color: Colors.red,
                   child: Column(
                     mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                     children: <Widget>[
                       Text("hello world "),
                       Text("I am Jack "),
                     ],
                   ),
                 ),
               )
              ],
            ),
          ),
        ));
  }
}
