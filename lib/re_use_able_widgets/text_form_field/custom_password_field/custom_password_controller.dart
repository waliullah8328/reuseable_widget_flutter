import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  var isPasswordVisible = false.obs;

  // Reactive variable to track visibility
  final passwordController = TextEditingController();

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
