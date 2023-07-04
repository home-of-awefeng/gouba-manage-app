import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/request/request.dart';

const String checkLoginUrl = "/api/login";

Future<bool> checkLogin(String phoneNumber, String password) async {
  bool isLogin = false;
  try{
    var res = await dio.get(checkLoginUrl, data: {"phoneNumber": phoneNumber,"password": password});
    if(res.data !=null){
      var result = res.data;
      if(result["code"] == 200 && result["data"] == true) {
        isLogin = true;
        Fluttertoast.showToast(msg: "登录成功", toastLength: Toast.LENGTH_SHORT);
      }else{
        throw Error();
      }
    }
  }catch(e){
    isLogin = false;
    Fluttertoast.showToast(msg: "登录失败，联系开发者");
  }

  return isLogin;
}

