import 'package:shop_app/mvvm/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  var _isLogin = false;

  void changeLoginStatus(bool status){
    _isLogin = status;
  }

  bool getLoginStatus(){
    return _isLogin;
  }
}
