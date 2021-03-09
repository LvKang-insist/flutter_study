import 'package:flutter/cupertino.dart';

class TestFlowDelegate extends FlowDelegate {

  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个自 widget 的位置
    for (int i = 0; i < context.childCount; i++) {
      //获取宽度
      var width = context
          .getChildSize(i)
          .width + x + margin.right;
      //是否需要换行
      print('$width ---- ${context.size.width}');
      if (width < context.size.width) {
        //绘制第一个
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = width + margin.left;
      } else {
        //绘制后面的
        x = margin.left;
        y += context
            .getChildSize(i)
            .height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context
            .getChildSize(i)
            .width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }
}