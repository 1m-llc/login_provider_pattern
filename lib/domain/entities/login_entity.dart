class LoginEntity {
  bool isLogin;
  String email;
  String pass;

  LoginEntity(bool isLogin, String email, String pass) {
    this.isLogin = isLogin;
    this.email = email;
    this.pass = pass;
  }
}