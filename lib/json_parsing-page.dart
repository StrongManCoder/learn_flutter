import 'dart:convert';

import 'package:flutter/material.dart';

import 'data_model.dart';

class JsonParsingPage extends StatefulWidget {
  const JsonParsingPage({super.key});

  @override
  State<JsonParsingPage> createState() => _JsonParsingPageState();
}

class _JsonParsingPageState extends State<JsonParsingPage> {
  var resultSHow = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON解析和Dart Model应用'),
      ),
      body: Column(
        children: <Widget>[
          _json2MapBtn(),
          _json2ModelBtn(),
          Text('结果: $resultSHow'),
        ],
      ),
    );
  }

  _json2MapBtn() {
    return ElevatedButton(onPressed: _json2Map, child: const Text('JSON转Map'));
  }

  _json2ModelBtn() {
    return ElevatedButton(
        onPressed: _json2Model, child: const Text('JSON转Model'));
  }

  _json2Map() {
    var jsonString =
        '{ "code": 0, "data": { "code": 0, "method": "GET", "requestPrams": "123" }, "msg": "SUCCESS." }';

    Map<String, dynamic> map = jsonDecode(jsonString); //json转map
    setState(() {
      resultSHow = 'code:${map['code']} jsonPar:${map['data']['method']} ';
    });
  }

  _json2Model() {
    var jsonString =
        '{ "code": 0, "data": { "code": 0, "method": "GET", "requestPrams": "123" }, "msg": "SUCCESS." }';
    Map<String, dynamic> map = jsonDecode(jsonString); //json转map

    DataModel model = DataModel.fromJson(map); //map转模型

    setState(() {
      resultSHow = 'code:${model.code}  msg:${model.data.method}';
    });
  }
}
