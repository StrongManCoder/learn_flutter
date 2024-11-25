import 'package:flutter/material.dart';
import 'package:learn_flutter/dao/login_dao.dart';
import 'package:learn_flutter/generated/assets.dart';
import 'package:learn_flutter/util/navigator_util.dart';
import 'package:learn_flutter/util/string_util.dart';
import 'package:learn_flutter/util/view_util.dart';
import 'package:learn_flutter/widget/input_widget.dart';
import 'package:learn_flutter/widget/login_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止键盘弹起影响布局
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ..._background(),
          _content(),
        ],
      ),
    );
  }

  _background() {
    return [
      Positioned.fill(
          child: Image.asset(Assets.imagesLoginBg, fit: BoxFit.cover)),
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  _content() {
    return Positioned.fill(
        left: 25,
        right: 25,
        child: ListView(
          children: [
            hiSpace(height: 100),
            Text(
              "帐号密码登录",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            hiSpace(height: 40),
            InputWidget('请输入账号', onChanged: (text) {
              username = text;
              _checkInput();
            }),
            hiSpace(height: 10),
            InputWidget('请输入密码', onChanged: (text) {
              password = text;
              _checkInput();
            }),
            hiSpace(height: 40),
            LoginBtn(
              "登录",
              enable: loginEnable,
              onPressed: () => _login(context),
              // onPressed: _login,
            ),
            hiSpace(height: 15),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => _juspRegistration(),
                  child: Text(
                    "注册账号",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ));
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(username) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }

    setState(() {
      loginEnable = enable;

      print('loginEnable:  $loginEnable');
    });
  }

  void _loginClick() {}

  _login(context) async {
    try {
      var result = LoginDao.login(userName: username!, passWord: password!);

      print('登录成功');
      //接口出错   手动写死数据啊
      LoginDao.saveToken("888668668888668888");
      //跳转首页
      NavigatorUtil.goToHome(context);
    } catch (e) {
      print(e);
    }
  }

  _juspRegistration() async {
    //跳转H5页面注册功能
    Uri uri = Uri.parse(
        "https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST");
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw "无法打开URL";
    }
  }
}
