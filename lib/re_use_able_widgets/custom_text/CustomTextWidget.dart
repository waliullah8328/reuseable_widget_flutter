import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight,
    this.isTextMiddleLine = false,
  });
  final String title;
  final double fontSize;
  final Color? color ;
  final FontWeight? fontWeight;
  final bool isTextMiddleLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          decoration: isTextMiddleLine?TextDecoration.lineThrough:null,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
    );
  }
}