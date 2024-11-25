import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy extends StatefulWidget {
  const HttpStudy({super.key});

  @override
  State<HttpStudy> createState() => _HttpStudyState();
}

class _HttpStudyState extends State<HttpStudy> {
  var resultShow = "";
  var resultShow2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基于HTTP的Flutter网络开发实战应用'),
      ),
      body: ListView(
        children: <Widget>[
          _doGetBtn(),
          _doPostBtn(),
          _doPostJSonBtn(),
          Text("返回的结果: $resultShow"),
          Text("解析的结果: $resultShow2")
        ],
      ),
    );
  }

  _doGetBtn() {
    return ElevatedButton(onPressed: _doGet, child: const Text("点击GET发送请求"));
  }

  _doPostBtn() {
    return ElevatedButton(onPressed: _doPost, child: const Text("点击POST"));
  }

  _doPostJSonBtn() {
    return ElevatedButton(
        onPressed: _doPostJSON, child: const Text("点击POST JSON格式的请求"));
  }

  void _doGet() async {
    var uri = Uri.parse(
        'https://v.juhe.cn/toutiao/index?key=b767884b02d3a917c89e7f18c88f75dd&type=%E6%96%B0%E9%97%BB');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
      });
    } else {
      setState(() {
        resultShow = "请求失败";
      });
    }
  }

  _doPost() async {
    var uri =
        Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=111');
    var params = {"requestPrams": "doPost"}; //POST
    var response = await http.post(uri, body: params);
    if (response.statusCode == 200) {
      resultShow = response.body;
      print(resultShow);
    } else {
      setState(() {
        resultShow = "请求失败";
      });
    }
  }

  _doPostJSON() async {
    var uri = Uri.parse('https://api.devio.org/uapi/test/testJson');
    var params = {"requestPrams": "doPost"}; //POST
    var response = await http.post(uri,
        body: jsonEncode(params),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      resultShow = response.body;
      print("POSTJSON==resultShow  :  ${response.body}");

      var map = jsonDecode(response.body);
      setState(() {
        resultShow2 = map["msg"];
      });
    } else {
      setState(() {
        resultShow = "请求失败";
      });
    }
  }
}
