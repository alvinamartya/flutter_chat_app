import 'package:flutter/material.dart';

class CustomFlatIconCircle extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double width;
  final double height;
  final double sizeIcon;
  final Color color;
  final Border border;

  CustomFlatIconCircle(this.color, this.backgroundColor, this.icon, this.width,
      this.height, this.sizeIcon,
      {this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border == null
            ? Border(
                bottom: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
                top: BorderSide.none,
              )
            : border,
      ),
      child: Icon(
        icon,
        size: sizeIcon,
        color: color,
      ),
    );
  }
}
