import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_provider_pattern/domain/usecase/login_usecase.dart';
import 'package:login_provider_pattern/presentation/viewmodels/login_view_model.dart';
import 'package:login_provider_pattern/presentation/views/home_page.dart';
import 'package:login_provider_pattern/presentation/widgets/login_dialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(title: 'Login Page'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  var _emailController = TextEditingController();
  var _passController = TextEditingController();

  void _loginAction(LoginViewModel viewModel) async {
    LoginUseCase().isLogin(viewModel);
  }

  Text _messageText(bool isLogin) {
      Text messageText = Text("emailとパスワードを入力してください。");
      if (isLogin != null && isLogin) messageText = Text("ログイン状態");
      return messageText;
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: _messageText(viewModel.isLogin),
                    ),
                    Text("email"),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(controller: _emailController, enabled: true, maxLength: 5, maxLengthEnforced: true, maxLines: 1, decoration: InputDecoration(hintText: "aaa is correct"),),
                    ),
                    Text("password"),
                    Padding(padding: EdgeInsets.all(20),
                      child: TextField(controller: _passController, enabled: true, maxLength: 5, maxLengthEnforced: true, obscureText: true, maxLines: 1, decoration: InputDecoration(hintText: "bbb is correct"),),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                viewModel.email = _emailController.text;
                                viewModel.pass = _passController.text;
                                _loginAction(viewModel);
                              },
                              child: Icon(Icons.login),
                            ), // This trailing comma makes auto-formatting nicer for build methods.
                            Padding(padding: EdgeInsets.all(5),),
                            Text("login"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
