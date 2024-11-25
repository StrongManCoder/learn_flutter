import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPCounterWidget extends StatefulWidget {
  const SPCounterWidget({super.key});

  @override
  State<SPCounterWidget> createState() => _SPCounterWidgetState();
}

class _SPCounterWidgetState extends State<SPCounterWidget> {
  String countString = '';
  String localString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基于shared_preferences的计数器"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: _incrementCountTer,
              child: const Text('increment  CountTer')),
          ElevatedButton(
              onPressed: _getCounter, child: const Text('Get Counter')),
          Text(countString, style: const TextStyle(fontSize: 20)),
          Text(localString, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  _incrementCountTer() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    setState(() {
      countString = "$countString 1";
    });

    int counter = (perfs.getInt('counter') ?? 0) + 1;
    await perfs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    setState(() {
      localString = perf.getInt('counter').toString();
    });
  }
}
