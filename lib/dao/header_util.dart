import 'package:learn_flutter/dao/login_dao.dart';

hiHeaders() {
  Map<String, String> header = {
    "auth-token": "hdadoshiaddhahkjhafhfklahlkajdahbsamnbm",
    "course-flag": 'ft',
    "boardingPass": LoginDao.getToken() ?? "",
  };

  return header;
}
