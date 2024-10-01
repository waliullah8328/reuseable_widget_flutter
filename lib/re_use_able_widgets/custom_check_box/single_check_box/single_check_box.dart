import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/custom_check_box/single_check_box/single_check_box_controller.dart';
 // Import the controller

class SingleCustomCheckBox extends StatelessWidget {
  final SingleCheckBoxController controller;

  SingleCustomCheckBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => CheckboxListTile(
          title: Text(controller.outputTitle),
          value: controller.isChecked.value,
          onChanged: (value) {
            controller.toggleCheckBox();
          },

          // for check box left side
          controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left side

        )),
        // Display the output title reactively
        Obx(() => Text(
          controller.outputTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
