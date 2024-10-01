import 'package:get/get.dart';

class SingleCheckBoxController extends GetxController {
  var isChecked = false.obs; // Observable to track checkbox state

  // Method to toggle checkbox value
  void toggleCheckBox() {
    isChecked.value = !isChecked.value;
  }

  // Method to get the output title based on checkbox state
  String get outputTitle => isChecked.value ? "All Read" : "Checkbox is Unchecked";
}
