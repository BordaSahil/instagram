import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget splashScreenBOdy() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: Get.height * 0.25,
      ),
      SizedBox(
        height: Get.height * 0.20,
        width: Get.width,
        child: Lottie.asset('asset/lottie/instagram.json'),
      ),
      Image.asset("asset/image/instagram_color.png", scale: 3),
      SizedBox(height: Get.height * 0.20),
      SizedBox(
        height: Get.height * 0.10,
        width: Get.width,
        child: Lottie.asset('asset/lottie/meta.json'),
      ),
    ],
  );
}
