import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_check_box_controller.dart'; // Import the controller

class CustomCheckboxGroup extends StatelessWidget {
  final CheckboxController controller; // The GetX controller

  CustomCheckboxGroup({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        // Select All Checkbox
        CheckboxListTile(
          title: Text('Select All'),
          value: controller.areAllSelected(),
          onChanged: (value) => controller.toggleSelectAll(value),
        ),
        // Checkbox 1
        CheckboxListTile(
          title: Text('Bangla'),
          value: controller.selectedValues.contains('Bangla'),
          onChanged: (value) => controller.toggleCheckbox('Bangla'),
        ),
        // Checkbox 2
        CheckboxListTile(
          title: Text('English'),
          value: controller.selectedValues.contains('English'),
          onChanged: (value) => controller.toggleCheckbox('English'),
        ),
        // Checkbox 3
        CheckboxListTile(
          title: Text('Math'),
          value: controller.selectedValues.contains('Math'),
          onChanged: (value) => controller.toggleCheckbox('Math'),
        ),
      ],
    ));
  }
}
