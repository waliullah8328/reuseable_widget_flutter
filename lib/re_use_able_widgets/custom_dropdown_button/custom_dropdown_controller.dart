import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Observable variable to track selected value
  var selectedValue = ''.obs;

  final List<String> countries = [
    'USA',
    'Canada',
    'Germany',
    'Australia',
    'India',
  ];

  // Method to update the selected value
  void updateSelectedValue(String? value) {
    if (value != null) {
      selectedValue.value = value;
      debugPrint(value.toString());
    }
  }
}
