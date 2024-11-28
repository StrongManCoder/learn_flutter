import 'package:flutter/material.dart';
import 'package:learn_flutter/dao/login_dao.dart';
import 'package:learn_flutter/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final bannerList = [
    'https://p1.ssl.qhimg.com/t01683f3a068943c2e3.png',
    'https://p1.ssl.qhimg.com/t01e9ee778759020ddb.png',
    'https://p1.ssl.qhimg.com/t01f7dfb7391d1f1de2.jpg',
    'https://p1.ssl.qhimg.com/t01aa65ca167724f2c9.jpg',
    'https://p4.ssl.qhimg.com/t01345cf34a1807d669.png'
  ];

  get _logoutBtn => TextButton(
      onPressed: () {
        LoginDao.logOut();
      },
      child: Text(
        "登出",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('首页'),
        actions: [_logoutBtn],
      ),
      body: Column(
        children: <Widget>[BannerWidget(bannerList: bannerList)],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
