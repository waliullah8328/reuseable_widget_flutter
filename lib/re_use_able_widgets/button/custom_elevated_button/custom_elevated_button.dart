import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color defaultColor;
  final Color pressedColor;
  final Color submittedColor;
  final bool isSubmitted;
  final double width;
  final double height;
  final double borderRadius;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.defaultColor = Colors.blue,
    this.pressedColor = Colors.red,
    this.submittedColor = Colors.green,
    this.isSubmitted = false,
    this.width = 200,
    this.height = 50,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return pressedColor; // Color when pressed
            } else if (isSubmitted) {
              return submittedColor; // Color after submission
            }
            return defaultColor; // Default color
          },
        ),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)), // Size
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Border radius
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
      ),
      child: Text(buttonText),
    );
  }
}