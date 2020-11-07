import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_provider_pattern/domain/usecase/login_usecase.dart';
import 'package:login_provider_pattern/presentation/viewmodels/login_view_model.dart';
import 'package:login_provider_pattern/presentation/views/home_page.dart';
import 'package:login_provider_pattern/presentation/widgets/login_dialog.dart';

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
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

  void _loginAction() async {
    bool isLogin = await LoginUseCase().isLogin(LoginViewModel(_emailController.text, _passController.text));

    print("isLogin ::: $isLogin");

    if (isLogin) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      LoginDialog.show(context, isLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("email"),
            Padding(padding: EdgeInsets.all(20),
              child: TextField(controller: _emailController, enabled: true, maxLength: 5, maxLengthEnforced: true, maxLines: 1, decoration: InputDecoration(hintText: "aaa is correct"),),),
            Text("password"),
            Padding(padding: EdgeInsets.all(20),
              child: TextField(controller: _passController, enabled: true, maxLength: 5, maxLengthEnforced: true, obscureText: true, maxLines: 1, decoration: InputDecoration(hintText: "bbb is correct"),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: _loginAction,
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
      ),
    );
  }
}
