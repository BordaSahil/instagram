import 'dart:async';

import 'package:get/get.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';
import 'package:instagram/screen/login_screen/login_page.dart';
import 'package:instagram/services/pref_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    bool isLogin = PrefService.getBool("isLogin");
    bool isPhoneSignup = PrefService.getBool("isPhoneSignup");
    bool isEmailSignup = PrefService.getBool("isEmailSignup");
    Timer(const Duration(seconds: 10), () {
      if (isLogin || isPhoneSignup || isEmailSignup) {
        Get.off(() => const DashboardPage());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
    super.onInit();
  }
}
