import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/request/request.dart';

const String checkLoginUrl = "/api/login";

Future<Map<String, Object>> checkLogin(
    String phoneNumber, String password) async {
  var r = {"isLogin": false, "loginPhoneNumber": ""};
  try {
    EasyLoading.show(status: "登录中...");
    var res = await dio.get(checkLoginUrl,
        data: {"phoneNumber": phoneNumber, "password": password});

    var result = res.data;
    if (result["code"] == 200 && result["data"] == true) {
      r["isLogin"] = true;
      r["loginPhoneNumber"] = phoneNumber;
      EasyLoading.dismiss();
      EasyLoading.showToast("登录成功");
    } else {
      throw Exception(result["message"]);
    }
  } on Exception catch (e) {
    EasyLoading.dismiss();
    String errorMsg = e.toString().isNotEmpty ? e.toString() : "登录失败，联系开发者";
    EasyLoading.showToast(errorMsg, duration: const Duration(seconds: 3));
  }
  return r;
}
