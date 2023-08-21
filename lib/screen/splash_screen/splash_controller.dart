import 'dart:async';

import 'package:get/get.dart';
import 'package:instagram/screen/login_screen/login_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const LoginScreen());
    });
    super.onInit();
  }
}
