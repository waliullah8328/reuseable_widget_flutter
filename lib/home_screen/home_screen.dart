

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/button/custom_elevated_button/custom_elevated_button_controller.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/card_design_and_favorite_screen_management/screens/horizontal_demo_screen.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/custom_check_box/single_check_box/single_check_box_controller.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/table%20format/data_table_demo_screen.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/text_form_field/custom_text_form_field/custom_text_form_field.dart';
import '../re_use_able_widgets/button/custom_elevated_button/custom_elevated_button.dart';
import '../re_use_able_widgets/button/custom_text_button.dart';
import '../re_use_able_widgets/custom_check_box/multiple_check_box/custom_check_box.dart';
import '../re_use_able_widgets/custom_check_box/multiple_check_box/custom_check_box_controller.dart';
import '../re_use_able_widgets/custom_check_box/single_check_box/single_check_box.dart';
import '../re_use_able_widgets/custom_dropdown_button/custom_dropdown_button.dart';
import '../re_use_able_widgets/custom_dropdown_button/custom_dropdown_controller.dart';
import '../re_use_able_widgets/custom_image/Custom_single_image/custom_image_upload_controller.dart';
import '../re_use_able_widgets/custom_image/custom_multiple_image/custom_multiple_image_controller.dart';
import '../re_use_able_widgets/custom_image/custom_multiple_image/custom_multiple_image_upload.dart';
import '../re_use_able_widgets/custom_radio_button/custom_radio_button.dart';
import '../re_use_able_widgets/custom_radio_button/radio_button_controller.dart';
import '../re_use_able_widgets/custom_text/CustomTextWidget.dart';
import '../re_use_able_widgets/text_form_field/custom_password_field/custom_password_controller.dart';
import '../re_use_able_widgets/text_form_field/custom_password_field/custom_password_text_form_field.dart';
import '../re_use_able_widgets/text_form_field/custom_text_form_field/custom_text_form_field_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomElevatedButtonController());
    final textFormFieldController = Get.put(CustomTextFormFieldController());
    final passWordTextFieldController = Get.put(PasswordFieldController());
    final dropDownButtonController = Get.put(DropdownController());
    final radioController = Get.put(RadioController());
    final checkBoxController = Get.put(CheckboxController());
    final imageUploadController = Get.put(ImageUploadController());
    final multipleImageUploadController = Get.put(MultipleImagePickerController());
    final singleCheckBoxController = Get.put(SingleCheckBoxController());

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text("1. Custom Text Button ......."),
              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                title: "Login",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Custom Text Button")));
                },
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                title: "Favorite Screen",
                onTap: () {
                  Get.to(()=>HorizontalCardDemo());
                },
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                title: "Table Screen",
                onTap: () {
                  Get.to(()=>DataTableDemo());
                },
              ),
              const Text("2. Custom Elevated Button ......."),
              const SizedBox(
                height: 10,
              ),
              Obx(() => CustomElevatedButton(
                    onPressed: controller
                        .submit, // Call the submit method in the controller
                    buttonText:
                        controller.isSubmitted.value ? 'Submitted' : 'Submit',
                    defaultColor: Colors.blue, // Default color
                    pressedColor: Colors.red, // Pressed color
                    submittedColor: Colors.green, // Submitted color
                    isSubmitted: controller.isSubmitted.value,
                    // Custom border radius
                  )),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: textFormFieldController.textController,
                        hintText: "Enter phone number",
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == "" || value!.isEmpty) {
                            return "Phone number is required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomPasswordField(
                        textController:
                            passWordTextFieldController.passwordController,
                        isPasswordVisible: passWordTextFieldController
                            .isPasswordVisible, // Pass RxBool
                        onPressed: passWordTextFieldController
                            .togglePasswordVisibility,
                        validator: (value) {
                          if (value == "" || value!.isEmpty) {
                            return "Password is required";
                          }
                          return null; // Return null when the input is valid
                        },
                        hintText: 'Enter your password',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextButton(
                        title: "Submit",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Custom Text Button")));
                          }
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextWidget(title: "2000.0",isTextMiddleLine: true,fontWeight: FontWeight.bold,fontSize: 21,),
                      SizedBox(
                        height: 16,
                      ),

                      CustomDropdownButton<String>(
                        items: dropDownButtonController.countries, // The list of items
                        hintText: "Select a country", // Hint text
                        controller: dropDownButtonController, // GetX controller
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        dropdownColor: Colors.grey[200], // Background color of the dropdown
                        borderRadius: 12.0, // Dropdown border radius
                        padding: EdgeInsets.symmetric(horizontal: 20), // Padding for the items
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRadioButton(
                              option1Label: 'Teacher', // Label for option 1
                              option1Value: 1, // Value for option 1
                              option2Label: 'Student', // Label for option 2
                              option2Value: 2, // Value for option 2
                              controller: radioController, // GetX controller
                            ),
                            SizedBox(height: 20),
                            Obx(() => Text(
                              'Selected Option: ${radioController.selectedTitle.value}', // Display the selected title
                              style: TextStyle(fontSize: 16),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      CustomCheckboxGroup(controller: checkBoxController), // Checkbox group
                      SizedBox(height: 20),
                      Obx(() => Text(
                        'Selected Values: ${checkBoxController.getSelectedValues()}', // Display selected values
                        style: TextStyle(fontSize: 16),
                      )),
                      SizedBox(height: 20),
                      Obx(() => Text(
                        'Selected Values: ${checkBoxController.getSelectedValues().join(', ')}', // Display selected values
                        style: TextStyle(fontSize: 16),
                      )),

                      SizedBox(height: 30),
                      // Camera section

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => imageUploadController.selectedImagePath.value == ''
                              ? Text("No image selected")
                              : Image.file(
                            File(imageUploadController.selectedImagePath.value),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          )),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => imageUploadController.pickImageFromGallery(),
                                child: Text("Gallery"),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => imageUploadController.captureImageWithCamera(),
                                child: Text("Camera"),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomMultiImagePicker(controller: multipleImageUploadController), // Custom widget
                          ),

                          Obx(() => Text(multipleImageUploadController.selectedImages.length.toString())),
                          SizedBox(height: 20),


                          Text(" Single Text Box"),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: SingleCustomCheckBox(controller: singleCheckBoxController), // Custom widget
                            ),
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


