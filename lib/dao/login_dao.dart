//登录接口
import 'dart:convert';

import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/navigator_util.dart';

import 'header_util.dart';

class LoginDao {
  static const boardingPass = "boarding_pass";
  static login({required String userName, required String passWord}) async {
    Map<String, String> paramesMap = {};
    paramesMap['userName'] = userName;
    paramesMap['passWord'] = passWord;

    var uri = Uri.https('api.devio.org', '/uapi/user/login', paramesMap);
    final response = await http.post(uri, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var result = jsonDecode(bodyString);
      if (result['code'] == 0 && result["data"] != null) {
        // 保存登录token   令牌

        // saveToken(result['data']);
        print("_saveToken888668668888668888");
      } else {
        //抛出异常
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  static void saveToken(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }

  static getToken() {
    return HiCache.getInstance().get(boardingPass);
  }

  static void logOut() {
    //移除令牌
    HiCache.getInstance().remove(boardingPass);

    NavigatorUtil.goToLogin();
  }
}
