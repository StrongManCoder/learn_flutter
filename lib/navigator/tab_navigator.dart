//首页底部导航器
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/pages/my_page.dart';
import 'package:learn_flutter/pages/search_page.dart';
import 'package:learn_flutter/pages/travel_page.dart';
import 'package:learn_flutter/util/navigator_util.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //initialPage 默认选择page
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    //更新导航器的context ,供退出登陆的时候使用
    NavigatorUtil.updateContext(context);
    return Scaffold(
        body: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            SearchPage(),
            TravePage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //默认颜色
          fixedColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItems("首页", Icons.home, 0),
            _bottomItems("搜索", Icons.search, 1),
            _bottomItems("旅拍", Icons.camera_alt, 2),
            _bottomItems("我的", Icons.account_circle, 3),
          ],
        ));
  }

  _bottomItems(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
      label: title,
    );
  }
}
