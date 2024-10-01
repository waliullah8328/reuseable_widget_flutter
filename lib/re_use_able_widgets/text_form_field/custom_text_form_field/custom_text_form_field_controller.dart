import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormFieldController extends GetxController {
  var textController = TextEditingController();
  var isValid = true.obs;

  // Example of a simple validation (you can customize this based on your needs)
  void validate(String value) {
    if (value.isEmpty) {
      isValid.value = false;
    } else {
      isValid.value = true;
    }
  }

  @override
  void onClose() {
    textController.dispose(); // Dispose the controller when not needed
    super.onClose();
  }
}
