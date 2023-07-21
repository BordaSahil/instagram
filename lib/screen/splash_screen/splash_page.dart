import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/splash_screen/splash_controller.dart';
import 'package:instagram/screen/splash_screen/splash_page_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: splashScreenBOdy(),
    );
  }
}
