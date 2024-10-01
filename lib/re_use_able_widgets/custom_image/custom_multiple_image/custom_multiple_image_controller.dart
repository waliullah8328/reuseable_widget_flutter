import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePickerController extends GetxController {
  var selectedImages = <File>[].obs; // Observable list to store selected images
  final ImagePicker imagePicker = ImagePicker();

  // Method to pick multiple images from the gallery
  Future<void> pickMultipleImages() async {
    try {
      final List<XFile>? pickedFiles = await imagePicker.pickMultiImage();
      if (pickedFiles != null) {
        selectedImages.addAll(pickedFiles.map((file) => File(file.path)).toList());
      } else {
        Get.snackbar("Error", "No images selected");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick images");
    }
  }

  // Method to clear selected images
  void clearImages() {
    selectedImages.clear();
  }
}
