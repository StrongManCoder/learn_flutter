import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/data_model.dart';

class FutureStudy extends StatefulWidget {
  const FutureStudy({super.key});

  @override
  State<FutureStudy> createState() => _FutureStudyState();
}

class _FutureStudyState extends State<FutureStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future 的应用 '),
        ),
        body: FutureBuilder<DataModel>(
            future: fetchGET(),
            builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('ConnectionState.none');
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Text('ConnectionState.active');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('snapshot.error:${snapshot.error}',
                        style: TextStyle(color: Colors.red));
                  } else {
                    return Column(
                      children: <Widget>[
                        Text('code : ${snapshot.data?.code}'),
                        Text('requestPrams : ${snapshot.data?.msg}'),
                      ],
                    );
                  }
              }
            }));
  }

  Future<DataModel> fetchGET() async {
    var uri =
        Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=111');
    final respones = await http.get(uri);
    print('result:${respones.body}');
    var resmap = jsonDecode(respones.body);
    DataModel model = DataModel.fromJson(resmap);
    return model;
  }
}
