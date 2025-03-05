import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/sesrch_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索"),
      ),
      body: Column(
        children: <Widget>[
          SesrchBarWidget(
            isHideLeft: true,
            defaultText: "请输入",
            hint: "请输入",
            inputBoxClick: () {
              print("点击了搜索框");
            },
            onChange: (value) {
              print(value);
            },
            leftButtonClick: () {
              print("点击了返回按钮");
              Navigator.pop(context);
            },
            rightButtonClick: () {
              print("点击了搜索按钮");
            },
          ),
        ],
      ),
    );
  }
}
