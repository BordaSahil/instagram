import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:pinput/pinput.dart';

Widget otpScreen() {
  return GetBuilder<SignupController>(
    id: 'OtpPinPut',
    builder: (controller) => Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.060),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            StringRes.otp,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: Get.height * 0.050),
          Pinput(
            controller: controller.pinController,
            length: 6,
            showCursor: false,
            onChanged: (value) {
              controller.varifiy = value;
            },
          ),
          SizedBox(height: Get.height * 0.050),
          otpSubmit(),
        ],
      ),
    ),
  );
}

Widget otpSubmit() {
  return GetBuilder<SignupController>(
    id: "OtpVerification",
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        color: Colors.blue.shade600,
        minHeight: Get.height * 0.060,
        onPressed: () => controller.validateOtpFunction(),
      );
    },
  );
}
