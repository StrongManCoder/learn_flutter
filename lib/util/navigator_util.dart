import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/pages/login_page.dart';
import 'package:learn_flutter/widget/hi_webview.dart';

class NavigatorUtil {
  //用于在获取不到_context的地方,如dao中跳转页面使用,需要在homepage赋值
  static BuildContext? _context;

  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init: $context');
  }

  //跳转到指定页面
  static push(BuildContext context, Widget page) {
    //系统路由
    // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    //GetX路由不用传递上下文
    Get.to(page);
  }

  static pop(BuildContext context) {
    // if (Navigator.canPop(context)) {
    //   Navigator.pop(context);
    // }
    //返回上一页面
    Get.back();
  }

  //跳转到首页  不希望返回上一页
  static goToHome(BuildContext context) {
    // 不希望返回上一页  pushReplacement
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const HomePage()));

    // Get实现 跳转到首页不希望返回
    Get.offAll(const HomePage());
  }

  //跳转到登录页  不希望返回上一页
  static goToLogin() {
    // 不希望返回上一页  pushReplacement
    // Navigator.pushReplacement(
    //     _context!, MaterialPageRoute(builder: (context) => const LoginPage()));

    Get.offAll(const LoginPage());
  }

  //跳转h5
  static jumpH5(
      {BuildContext? context,
      required String url,
      String? title,
      bool? hideAppBar,
      String? statusBarColor}) {
    // BuildContext safeContext;
    // if (context != null) {
    //   safeContext = context;
    // } else if (_context?.mounted ?? false) {
    //   safeContext = _context!;
    // } else {
    //   return;
    // }
    //
    // Navigator.push(
    //     safeContext!,
    //     MaterialPageRoute(
    //         builder: (context) => HiWebview(
    //             Url: url,
    //             title: title,
    //             hidenAppBar: hideAppBar,
    //             StatusBarColor: statusBarColor)));

    // 使用GetX跳转H5
    Get.to(HiWebview(
        Url: url,
        title: title,
        hidenAppBar: hideAppBar,
        StatusBarColor: statusBarColor));
  }
}
