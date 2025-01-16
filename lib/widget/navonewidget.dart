import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';
import 'package:learn_flutter/util/view_util.dart';

class Navonewidget extends StatelessWidget {
  final List<Nav> navStatic;

  const Navonewidget({super.key, required this.navStatic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 4, 7, 4),
      height: 65.px,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
          child: _items(context)),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];
    for (var model in navStatic) {
      items.add(_item(context, model));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, Nav model) {
    return GestureDetector(
      onTap: () {
        //点击事件
      },
      child: Column(
        children: <Widget>[
          Image.network(model.iconurl, width: 32.px, height: 32.px),
          hiSpace(height: 5),
          Text(model.nameDesc,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
