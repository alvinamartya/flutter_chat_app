import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  CustomTextField(
      {@required this.controller,
      @required this.labelText,
      @required this.hintText,
      @required this.obscureText,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(height: 1.5, fontFamily: "Roboto"),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          labelStyle: TextStyle(height: 1, fontFamily: "Roboto"),
          labelText: labelText,
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, height: 1, fontFamily: "Roboto")),
    );
  }
}
