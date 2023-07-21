import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/screen/signup_screen/user_name_page/user_name_page.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      body: signupPageBody(),
    );
  }
}
