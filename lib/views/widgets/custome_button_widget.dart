import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isOutline;
  final Function onPressed;
  final String text;

  CustomButton(
      {@required this.isOutline,
      @required this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return (isOutline)
        ? FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide(color: Colors.blue)),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
            ),
          )
        : RaisedButton(
            color: Colors.blue,
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
          );
  }
}
