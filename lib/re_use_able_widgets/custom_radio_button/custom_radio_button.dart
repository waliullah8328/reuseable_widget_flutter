import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/custom_radio_button/radio_button_controller.dart';// Import the controller

class CustomRadioButton extends StatelessWidget {
  final String option1Label; // Label for option 1
  final String option2Label; // Label for option 2
  final int option1Value; // Value for option 1
  final int option2Value; // Value for option 2
  final RadioController controller; // The GetX controller

  CustomRadioButton({
    Key? key,
    required this.option1Label,
    required this.option1Value,
    required this.option2Label,
    required this.option2Value,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<int>(
          value: option1Value,
          groupValue: controller.selectedOption.value,
          onChanged: (value) => controller.updateSelectedOption(value!, option1Label),
        ),
        Text(option1Label,style: const TextStyle(fontSize: 17),),
        SizedBox(width: 20), // Spacing between radio buttons
        Radio<int>(
          value: option2Value,
          groupValue: controller.selectedOption.value,
          onChanged: (value) => controller.updateSelectedOption(value!, option2Label),
        ),
        Text(option2Label,style: const TextStyle(fontSize: 17),),
      ],
    ));
  }
}
