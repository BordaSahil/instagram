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

  void onChangeButton(String? newValue) {
    dropdownValue = newValue!;
    update(["dropdown"]);
  }

  void goToHomeScreen() {
    Get.off(() => const DashboardPage());
  }

  void goToSignup() {
    Get.to(() => const SignupScreen());
  }
}
