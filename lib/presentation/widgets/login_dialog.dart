import 'package:flutter/material.dart';

class LoginDialog {
  static show(BuildContext context, String titleText, String contentText) {

    showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(contentText),
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