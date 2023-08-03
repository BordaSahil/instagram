import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_page.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_email_page.dart';

import 'password_page/password_page.dart';

class SignupController extends GetxController {
  bool check = false;

  TextEditingController signupUserName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signupPhone = TextEditingController();
  TextEditingController signupEmail = TextEditingController();

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

  Future<void> goToPassword() async {
    update(["userName"]);
    Get.to(() => const PasswordScreen());
  }

  Future<void> goToHome() async {
    // Map<String, dynamic> passwordSet = {
    //   "userName": signupUserName.text.trim(),
    //   "password": password.text.trim()
    // };
    // await FireBaseServices.setData("userData", passwordSet);
    update(["password"]);
    Get.to(() => const AddPhoneOrEmail());
  }

  void goToOtpPage() {
    Get.to(() => const OtpPage());
  }
}
