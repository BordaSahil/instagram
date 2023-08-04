import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';
import 'package:instagram/screen/signup_screen/signup_page.dart';
import 'package:instagram/services/firebase_service.dart';

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

  Future<void> goToHomeScreen() async {
    Map? getUserData = await FireBaseServices.getData("userData");
    List<Person>? userList;
    List<Map<String, dynamic>> userJsonList = [];
    if (getUserData != null) {
      getUserData.forEach((key, value) {
        Map<String, dynamic> userData = {};
        userData["id"] = key;
        value.forEach((key1, value1) {
          userData[key1] = value1;
        });
        userJsonList.add(userData);
      });
      userList = userFromJson(jsonEncode(userJsonList));
      bool matchEmailPassword = userList.any((element) =>
          element.email == userName.text ||
          element.userName == userName.text ||
          element.mobileNumber == userName.text &&
              element.password == password.text);
      if (matchEmailPassword) {
        Get.offAll(() => const DashboardPage());
      } else {
        Get.snackbar("Login Error", "Please Enter Valid Details");
      }
    }
    update(["phoneUser", "passwordValid"]);
  }

  void goToSignup() {
    Get.to(() => const SignupScreen());
  }
}
