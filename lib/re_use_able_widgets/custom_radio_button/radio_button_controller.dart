
import 'package:get/get.dart';

class RadioController extends GetxController {
  var selectedOption = 0.obs; // Reactive variable to store selected option
  var selectedTitle = ''.obs; // Reactive variable to store the selected title


  // Method to update the selected option and its title
  void updateSelectedOption(int value, String title) {
    selectedOption.value = value;
    selectedTitle.value = title; // Update the selected title

  }



}
