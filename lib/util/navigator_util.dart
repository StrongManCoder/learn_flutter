import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/pages/login_page.dart';

class NavigatorUtil {
  //用于在获取不到_context的地方,如dao中跳转页面使用,需要在homepage赋值
  static BuildContext? _context;

  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init: $context');
  }

  //跳转到制订页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  //跳转到首页  不希望返回上一页
  static goToHome(BuildContext context) {
    // 不希望返回上一页  pushReplacement
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  //跳转到登录页  不希望返回上一页
  static goToLogin() {
    // 不希望返回上一页  pushReplacement
    Navigator.pushReplacement(
        _context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
