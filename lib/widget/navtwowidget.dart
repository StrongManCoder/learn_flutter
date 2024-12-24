import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';
import 'package:learn_flutter/util/view_util.dart';

class NavTwoWidget extends StatelessWidget {
  final List<Nav> navActive;

  const NavTwoWidget({super.key, required this.navActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 4, 7, 4),
      height: 160.px,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(padding: const EdgeInsets.all(7), child: _items(context)),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];
    for (var model in navActive) {
      items.add(_item(context, model));
    }
    return Wrap(
      spacing: 8.0, // 设置按钮之间的水平间距
      runSpacing: 8.0, // 设置按钮之间的垂直间距
      children: items,
    );
  }

  Widget _item(BuildContext context, Nav model) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width - 80) / 5, // 每行5个按钮，调整宽度
        child: GestureDetector(
          onTap: () {
            //点击事件
          },
          child: Column(
            children: <Widget>[
              Image.network(model.iconurl, width: 30.px, height: 30.px),
              hiSpace(height: 4),
              Text(model.nameDesc,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
