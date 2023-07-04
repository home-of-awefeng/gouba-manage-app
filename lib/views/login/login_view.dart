import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/request/admin.dart';
import 'package:shop_app/state/global.dart';

class LoginView extends StatelessWidget{
  LoginView({super.key});

  final _photoController = TextEditingController();
  final _passController = TextEditingController();
  // 账号TextField
  Widget accountTextField() {

    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
        child: TextField(
          controller: _photoController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone_iphone),
              fillColor: Colors.white70,
              filled: true,
              labelText: '请输入手机号'
          ),
        )
    );
  }

  // 密码TextField
  Widget passwordTextField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        child: TextField(
          controller: _passController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.pages_sharp),
              fillColor: Colors.white70,
              filled: true,
              labelText: '请输入密码'
          ),
          obscureText: true,
        )
    );
  }

  // 登录按钮
  Widget loginButton(BuildContext context) {
    final globalStateNotifier = Provider.of<GlobalState>(context, listen: true);
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          width: MediaQuery.of(context).size.width - 30.0,
          height: 50.0,
          child: const Card(
              color: Colors.lightBlue,
              elevation: 6.0,
              child: Center(
                child: Text('登录', style: TextStyle(fontSize: 18.0, color: Colors.white)),
              )
          )
      ),
      onTap: () async {
        if(_photoController.value.text.isNotEmpty && _passController.value.text.isNotEmpty){
          bool isLogin = await checkLogin(_photoController.value.text, _passController.value.text);
          globalStateNotifier.changeLoginStatus(isLogin);
        }else{
          Fluttertoast.showToast(msg: "手机号和密码都必填");
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: accountTextField()),
            Flexible(child: passwordTextField()),
            Flexible(child: loginButton(context)),
          ],
        ),
      ),
    );
  }
}

