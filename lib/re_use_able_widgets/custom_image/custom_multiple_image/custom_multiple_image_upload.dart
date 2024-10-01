import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_multiple_image_controller.dart';
 // Import the controller

class CustomMultiImagePicker extends StatelessWidget {
  final MultipleImagePickerController controller;

  CustomMultiImagePicker({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Button to pick multiple images
        ElevatedButton(
          onPressed: () => controller.pickMultipleImages(),
          child: Text("Pick Multiple Images"),
        ),
        // Display selected images in a grid
        Obx(() => controller.selectedImages.isEmpty
            ? Text("No images selected")
            : GridView.builder(
          shrinkWrap: true,
          itemCount: controller.selectedImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Image.file(
              controller.selectedImages[index],
              fit: BoxFit.cover,
            );
          },
        )),
        // Button to clear images
        ElevatedButton(
          onPressed: () => controller.clearImages(),
          child: Text("Clear Images"),
        ),
      ],
    );
  }
}
