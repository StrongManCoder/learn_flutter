import 'package:flutter/material.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';
import 'package:learn_flutter/util/view_util.dart';

class ScreenFixPage extends StatefulWidget {
  const ScreenFixPage({super.key});

  @override
  State<ScreenFixPage> createState() => _ScreenFixPageState();
}

class _ScreenFixPageState extends State<ScreenFixPage> {
  @override
  Widget build(BuildContext context) {
    ScreenHelp.init(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text("默认大小"),
            ),
          ),
          hiSpace(height: 50),
          Center(
            child: Container(
              width: 200.px,
              height: 200.px,
              decoration: const BoxDecoration(color: Colors.amber),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    hiSpace(height: 10),
                    const Text("适配后的大小啊"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
