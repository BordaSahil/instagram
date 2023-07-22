import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/login_screen/login_controller.dart';
import 'package:instagram/screen/login_screen/login_page_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: loginScreenBody(),
    );
  }
}
