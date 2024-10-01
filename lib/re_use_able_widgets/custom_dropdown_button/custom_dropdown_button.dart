import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_dropdown_controller.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> items; // List of items to display in the dropdown
  final String hintText; // Hint text for the dropdown
  final DropdownController controller; // The GetX controller
  final TextStyle? style; // Style for the dropdown text
  final Color? dropdownColor; // Dropdown background color
  final double? borderRadius; // Dropdown border radius
  final EdgeInsets? padding; // Padding inside the dropdown

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.hintText,
    required this.controller,
    this.style,
    this.dropdownColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      height: 65,
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isDense: true,

          value: controller.selectedValue.value.isEmpty
              ? null
              : controller.selectedValue.value as T,
          onChanged: (value) => controller.updateSelectedValue(value as String),
          hint: Text(
            hintText,
            style: style ?? TextStyle(fontSize: 16),

          ),
          items: items.map((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Padding(
                padding: padding!,
                child: Text(
                  value.toString(),
                  style: style ?? const TextStyle(fontSize: 16),
                ),
              ),
            );
          }).toList(),
          dropdownColor: dropdownColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius!),
          style: style,
          icon: Icon(Icons.arrow_drop_down),
        ),
      ),
    ));
  }
}
