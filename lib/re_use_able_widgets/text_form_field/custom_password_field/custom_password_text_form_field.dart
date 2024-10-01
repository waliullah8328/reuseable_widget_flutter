import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController textController;
  final RxBool isPasswordVisible; // Pass the RxBool directly
  final VoidCallback onPressed;
  final String? Function(String?) validator;
  final String hintText;

  const CustomPasswordField({
    Key? key,
    required this.textController,
    required this.isPasswordVisible,
    required this.onPressed,
    required this.validator,
    this.hintText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => TextFormField(
          controller: textController,
          obscureText: !isPasswordVisible.value, // Reactive password visibility
          obscuringCharacter: "*",

          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: onPressed, // Toggle visibility
            ),
          ),
          validator: validator,
        )),
      ],
    );
  }
}
