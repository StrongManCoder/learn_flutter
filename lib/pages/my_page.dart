import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/hi_webview.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: const Text("我的"),
        // ),
        body: const HiWebview(
      Url: 'https://m.ctrip.com/webapp/myctrip',
      hidenAppBar: true,
      backForBid: true,
      StatusBarColor: '4c5bca',
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
