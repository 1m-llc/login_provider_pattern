import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLogin;
  String email;
  String pass;

  LoginViewModel({bool isLogin, String email, String pass}) {
    this.isLogin = isLogin;
    this.email = email;
    this.pass = pass;
  }

  void loginSuccess() {
    print("loginSuccessが呼ばれました");
    notifyListeners();
  }
}