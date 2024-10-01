import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.height = 45,
    this.width = 200,
    this.radius = 10,
    this.fontSize = 21,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,

  });
  final void Function() onTap;
  final double height, width, radius, fontSize;
  final Color? backgroundColor, textColor;
  final String title;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child:  Center(
            child: isLoading == false?Text(
              title!,
              style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ):const CircularProgressIndicator(color: Colors.white,),),
      ),
    );
  }
}