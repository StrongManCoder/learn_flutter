import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';

class SubNavWidget extends StatelessWidget {
  final List<Nav>? subNavList;

  const SubNavWidget({super.key, this.subNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) {
      return null;
    }

    List<Widget> items = [];
    for (var model in subNavList!) {
      items.add(_item(context, model));
    }

    //计算第一行显示的数量
    int separate = (subNavList!.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, subNavList!.length),
          ),
        ),
      ],
    );
  }

  Widget _item(BuildContext context, Nav model) {
    return Expanded(
        child: GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(model.iconurl, width: 18.px, height: 18.px),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(model.nameDesc,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ));
  }
}
