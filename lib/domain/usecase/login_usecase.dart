import 'package:flutter/cupertino.dart';
import 'package:login_provider_pattern/data/login_repositories.dart';
import 'package:login_provider_pattern/domain/entities/login_entity.dart';
import 'package:login_provider_pattern/presentation/viewmodels/login_view_model.dart';

class LoginUseCase {
  static LoginUseCase _instance;

  LoginUseCase._internal();

  factory LoginUseCase() {
    if (_instance == null) {
      _instance = LoginUseCase._internal();
    }
    return _instance;
  }

  void isLogin(LoginViewModel viewModel) async {

    print("email in usecase ::: ${viewModel.email}");
    print("pass in usecase ::: ${viewModel.pass}");

    LoginEntity entity = await LoginRepository().login(viewModel);
    print("${entity.email} / ${entity.pass} / ${entity.isLogin}");

    viewModel.isLogin = entity.isLogin;
    viewModel.email = entity.email;
    viewModel.pass = entity.pass;

    viewModel.loginSuccess();
  }

}