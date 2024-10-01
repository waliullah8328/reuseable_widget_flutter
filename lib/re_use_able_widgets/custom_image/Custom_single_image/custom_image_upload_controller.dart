
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImageUploadController extends GetxController {
  var selectedImagePath = ''.obs; // Observable variable to hold the image path
  final ImagePicker imagePicker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }

  // Method to capture an image from the camera
  Future<void> captureImageWithCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image captured");
    }
  }
}
