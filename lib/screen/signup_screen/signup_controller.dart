import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';

import 'password_page/password_page.dart';

class SignupController extends GetxController {
  bool check = false;

  TextEditingController signupUserName = TextEditingController();
  TextEditingController password = TextEditingController();
  String? userNameError;
  void signupUserNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      userNameError = "Please Enter Detail";
    } else if (!(value.isEmail)) {
      userNameError = "Enter valid username";
    } else {
      userNameError = null;
    }
    update(["userName"]);
  }

  String? passwordError;
  void signupPassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError = "Please Enter Password";
    } else if (!(value.length > 8)) {
      passwordError = "Enter password must be 8 character";
    } else {
      passwordError = null;
    }
    update(["password"]);
  }

  void checkBox() {
    check = !check;
    update(["checkBox"]);
  }

  void goToPassword() {
    update(["userName"]);
    Get.to(() => const PasswordScreen());
  }

  void goToHome() {
    update(["password"]);
    Get.off(() => const DashboardPage());
  }
}
