//as  导入的时候区别系统的方案  可以起个 别名
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/dao/header_util.dart';
import 'package:learn_flutter/util/navigator_util.dart';

class HomeDao {
  static Future<HomeModel?> fetch() async {
    var url = Uri.parse('https://appapi.5i5j.com/appapi/apphome/1/v1/index');
    final response = await http.post(url, headers: hiHeaders());
    Utf8Decoder uftDecoder = const Utf8Decoder();
    String bodyString = uftDecoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var resultModel = jsonDecode(bodyString);
      if (resultModel['data'] != null) {
        // print('result == $resultModel');
        return HomeModel.fromJson(resultModel['data']);
      }
      return null;
    } else {
      if (response.statusCode == 401) {
        NavigatorUtil.goToLogin();
      } else {
        print(' throw Exception >>> == $bodyString');

        throw Exception(bodyString);
      }
    }
    return null;
  }
}
