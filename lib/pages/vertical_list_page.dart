import 'package:flutter/material.dart';

const cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '海南',
  '拉萨',
  '西藏',
];

class VerticalListPage extends StatelessWidget {
  const VerticalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'list';
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView(
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((cityName) => _item(cityName)).toList();
  }

  Widget _item(String cityName) {
    return Container(
      height: 80,
      //内边距 上面设置10  左右设置20
      // padding: const EdgeInsets.only(top: 10, left: 20, right: 20),

      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.amber),
      child: Text(
        cityName,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
