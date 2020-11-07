import 'package:login_provider_pattern/domain/entities/login_entity.dart';
import 'package:login_provider_pattern/presentation/viewmodels/login_view_model.dart';

class LoginRepository {
  Future<LoginEntity> entity(LoginViewModel viewModel) async {

    LoginEntity entity = LoginEntity(false);

    print("email ::: ${viewModel.email}");
    print("pass ::: ${viewModel.pass}");

    // 通信したと仮定する
    if (viewModel.email == "aaa" && viewModel.pass == "bbb") return LoginEntity(true);

    return LoginEntity(false);
  }
}