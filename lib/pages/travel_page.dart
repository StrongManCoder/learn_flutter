import 'package:flutter/material.dart';

class TravePage extends StatefulWidget {
  const TravePage({super.key});

  @override
  State<TravePage> createState() => _TravePageState();
}

class _TravePageState extends State<TravePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("旅行"),
      ),
      body: Column(
        children: <Widget>[
          const Text("旅行页面"),
        ],
      ),
    );
  }
}
