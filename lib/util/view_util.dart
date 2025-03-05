//间距
import 'package:flutter/material.dart';

SizedBox hiSpace({double height = 1, double width = 1}) {
  return SizedBox(height: height, width: width);
}

Widget shadowWarp({required Widget child, EdgeInsetsGeometry? paddind}) {
  return Container(
    padding: paddind,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          //appbar渐变背景
          colors: [Color(0x6600000), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    ),
    child: child,
  );
}
