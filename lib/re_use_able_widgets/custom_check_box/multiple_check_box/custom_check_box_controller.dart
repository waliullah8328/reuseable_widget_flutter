import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedValues = <String>[].obs; // Observable list to store selected values

  // List of all checkbox values
  final List<String> allCheckboxValues = ['Bangla', 'English', 'Math'];

  // Method to toggle selection of a checkbox
  void toggleCheckbox(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value); // Remove value if already selected
    } else {
      selectedValues.add(value); // Add value if not selected
    }
  }

  // Method to toggle the "Select All" checkbox
  void toggleSelectAll(bool? isChecked) {
    if (isChecked == true) {
      selectedValues.assignAll(allCheckboxValues); // Select all
    } else {
      selectedValues.clear(); // Deselect all
    }
  }

  // Method to check if all values are selected
  bool areAllSelected() {
    return selectedValues.length == allCheckboxValues.length;
  }

  // Method to get all selected values
  List<String> getSelectedValues() {
    return selectedValues.toList(); // Return a copy of the selected values

  }
}
