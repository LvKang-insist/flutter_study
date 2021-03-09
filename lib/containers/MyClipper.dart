import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10, 15, 40, 30);
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => false;

}