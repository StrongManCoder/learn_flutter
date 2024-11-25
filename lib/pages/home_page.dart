import 'package:flutter/material.dart';
import 'package:learn_flutter/dao/login_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
