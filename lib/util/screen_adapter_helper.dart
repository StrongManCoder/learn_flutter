//屏幕适配工具类
import 'package:flutter/cupertino.dart';

//扩展int
extension IntFix on int {
  double get px {
    return ScreenHelp.getPx(toDouble());
  }
}

extension DoubleFix on double {
  double get px {
    return ScreenHelp.getPx(this);
  }
}

class ScreenHelp {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenheight;
  static late double ratio; //比例

//根据设计稿实际大小初始化
//baswWidth 设计稿宽度

  static init(BuildContext context, {double baseWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
    ratio = screenWidth / baseWidth;
  }

//获取设计稿对应的大小
  static double getPx(double size) {
    return ScreenHelp.ratio * size;
  }
}
