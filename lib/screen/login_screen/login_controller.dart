import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';
import 'package:instagram/screen/signup_screen/signup_page.dart';

class LoginController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  String dropdownValue = "English(United States)";
  String selectedValue = '';

  List<String> items = [
    "English(United States)",
    "Afrikaans",
    "Hindi",
    "Gujarati",
    "Dansk",
    "Turkish",
    "Polski",
  ];

  String? phoneUserError;
  void loginPhoneUser(String? value) {
    if (value == null || value.isEmpty) {
      phoneUserError = "Please enter detail";
    } else if (!(value.isEmail)) {
      phoneUserError = "Enter valid email";
    } else {
      phoneUserError = null;
    }
    update(["phoneUser"]);
  }

  String? passwordError;
  void loginPassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError = "Please Enter Password";
    } else if (!(value.length > 8)) {
      passwordError = "Enter password must be 8 character";
    } else {
      passwordError = null;
    }
    update(["passwordValid"]);
  }

  void onChangeButton(String? newValue) {
    dropdownValue = newValue!;
    update(["dropdown"]);
  }

  void goToHomeScreen() {
    update(["phoneUser", "passwordValid"]);
    Get.off(() => const DashboardPage());
  }

  void goToSignup() {
    Get.to(() => const SignupScreen());
  }
}
