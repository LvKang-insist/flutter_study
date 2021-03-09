import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("avatar.jpg", width: 70);

    return Scaffold(
      appBar: AppBar(
        title: Text("剪裁"),
      ),
      body: Center(
        child: Column(
          children: [
            //原图
            avatar,
            //剪裁为圆形
            ClipOval(
              child: avatar,
            ),
            //剪裁为圆角矩形
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Align：调整子组件的位置，
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//自身的 = 子组件 x widthFactor
                  child: avatar,
                ),
                Text(
                  "Hello World",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 将溢出的部分剪裁
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text(
                  "Hello World",
                  style: TextStyle(color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
