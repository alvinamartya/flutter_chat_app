import 'package:flutter/material.dart';

class CustomDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<Widget> actions;

  CustomDialog(this.context, this.title, this.content, this.actions);

  Future<bool> show() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            actions: actions,
            title: Text(title),
            content: Text(content),
          );
        });
  }
}
