import 'package:flutter/material.dart';

class LoginDialog {
  static show(BuildContext context, bool isLogin) {
    var titleText = (isLogin) ? Text('OK') : Text('NG');
    var contentText = (isLogin) ? Text('ログイン成功') : Text('ログイン失敗');

    // OKダイアログ 表示
    showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: titleText,
          content: contentText,
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(0),
            ),
          ],
        );
      },
    );
  }
}