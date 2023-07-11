import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier{
  bool _isLogin = false;
  String _loginUserPhoneNumber = '';
  DateTime _loginTime = DateTime.now();

  void changeLoginStatus(bool login, String x){
    _isLogin = login;
    _loginUserPhoneNumber = x;
    if(login){
      _loginTime = DateTime.now();
    }
    notifyListeners();
  }

  bool getLoginStatus(){
    DateTime current = DateTime.now();
    // 有效期一天
    if(current.isAfter(_loginTime.add(const Duration(days: 1)))){
      changeLoginStatus(false, "");
      return false;
    }
    return _isLogin;
  }

  String getLoginUserPhoneNumber(){
    return _loginUserPhoneNumber;
  }

}
