import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'password_page/password_page.dart';

class SignupController extends GetxController {
  bool check = false;

  TextEditingController signupUserName = TextEditingController();
  TextEditingController password = TextEditingController();

  void checkBox() {
    check = !check;
    update(["checkBox"]);
  }

  void goToPassword() {
    Get.to(() => const PasswordScreen());
  }
}
