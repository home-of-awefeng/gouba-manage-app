import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier{
  bool _isLogin = false;

  void changeLoginStatus(bool login){
    _isLogin = login;
    notifyListeners();
  }

  bool getLoginStatus(){ return _isLogin;}
}
