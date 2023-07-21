import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget splashScreenBOdy() {
  return Padding(
    padding: EdgeInsets.only(top: Get.height * 0.35),
    child: Column(
      children: [
        Center(
          child: SizedBox(
              height: Get.height * 0.10,
              child: Image.asset("asset/image/logo.png")),
        ),
      ],
    ),
  );
}
