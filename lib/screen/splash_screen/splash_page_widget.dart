import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:lottie/lottie.dart';

Widget splashScreenBOdy() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: Get.height * 0.30,
      ),
      SizedBox(
        height: Get.height * 0.20,
        width: Get.width,
        child: Lottie.asset('asset/lottie/instagram.json'),
      ),
      AnimatedTextKit(
        totalRepeatCount: 5,
        animatedTexts: [
          ColorizeAnimatedText(
            'Instagram',
             textStyle: const TextStyle(
               fontSize: 50.0,
               fontFamily: 'Billabong',
             ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.red,
            ],
          ),
        ],
        isRepeatingAnimation: true,
      ),
      SizedBox(
        height: Get.height * 0.25,
      ),
   /*   const Text(
        StringRes.from,
        style: TextStyle(color: Colors.black45,fontFamily: 'Billabong',fontSize: 30),
      ),*/
      SizedBox(
        height: Get.height * 0.10,
        width: Get.width,
        child: Lottie.asset('asset/lottie/meta.json'),
      ),
    ],
  );
}
