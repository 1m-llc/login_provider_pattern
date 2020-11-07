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

  Future<bool> isLogin(LoginViewModel viewModel) async {
    LoginEntity entity = await LoginRepository().entity(viewModel);
    return entity.isLogin;
  }

}