

import 'package:get/get.dart';

class CustomElevatedButtonController extends GetxController{

  var isSubmitted = false.obs; // Reactive variable to track submission state

  void submit() {
    isSubmitted.value = true;
    //Get.snackbar("Success", "Elevated Button Successfully submitted");
    sigup();


  }

  void sigup(){
    Get.snackbar("Success", "Elevated Button Successfully submitted");
  }
}