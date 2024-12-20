import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/dao/home_dao.dart';
import 'package:learn_flutter/dao/login_dao.dart';
import 'package:learn_flutter/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static HomeModel? homeModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static const appbarScrolloffset = 160;
  // final bannerList = [
  //   'https://p1.ssl.qhimg.com/t01683f3a068943c2e3.png',
  //   'https://p1.ssl.qhimg.com/t01e9ee778759020ddb.png',
  //   'https://p1.ssl.qhimg.com/t01f7dfb7391d1f1de2.jpg',
  //   'https://p1.ssl.qhimg.com/t01aa65ca167724f2c9.jpg',
  //   'https://p4.ssl.qhimg.com/t01345cf34a1807d669.png'
  // ];

  double appBarAlpha = 0;
  List<ActivityElement> bannerList = [];
  List<Nav> navStatic = [];
  List<Nav> navActive = [];

  get _logoutBtn => TextButton(
      onPressed: () {
        LoginDao.logOut();
      },
      child: Text(
        "登出",
        style: TextStyle(color: Colors.black54, fontSize: 18),
      ));

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          _logoutBtn,
          //可以滚动的长文本控件,长按复制文本内容
          // SelectableText(Result.toString()),

          const SizedBox(
            height: 800,
            child: ListTile(
              title: Text('哈哈哈'),
              subtitle: Text('副标题啊'),
            ),
          )
        ],
      );

  get _appBar => Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 100,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
            child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('首页'),
        )),
      ));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
            removeTop: true, //移除顶部空白
            context: context,
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //通过depth来过滤指定的widget发出的滚动事件,depth ==0 标示最外层的列表listview 发出的滚动事件 且是列表滚动的时间
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return false;
                },
                child: _listView)),
        _appBar
      ],
    )

        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text('首页'),
        //   actions: [_logoutBtn],
        // ),
        // body: Column(
        //   children: <Widget>[BannerWidget(bannerList: bannerList)],
        // ),
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _onScroll(double pixels) {
    print('offset : $pixels');
    double alpha = pixels / appbarScrolloffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    // print('alpha :$alpha');
    setState(() {
      appBarAlpha = alpha;
    });

    // print('appBarAlpha :$appBarAlpha');
  }

  Future<void> _handleRefresh() async {
    try {
      HomeModel? result = await HomeDao.fetch();

      setState(() {
        HomePage.homeModel = result;
        bannerList = result!.activity ?? [];
        navStatic = result!.navStatic ?? [];
        navActive = result!.navActive ?? [];
      });
    } catch (error) {
      debugPrint('错误信息是: $error');
    }
  }
}
