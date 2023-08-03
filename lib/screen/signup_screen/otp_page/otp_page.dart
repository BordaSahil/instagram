import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_widget.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: otpScreen(),

      /*Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.060, vertical: Get.height * 0.10),
        child: Column(
          children: [
            const Text(
              StringRes.otp,
              style: TextStyle(fontSize: 25, color: Colors.black),
            const Center(
              child: Text(
                StringRes.otp,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            otpSubmit(),
          ],
        ),
      ),*/
    );
  }
}

Widget otpSubmit() {
  return GetBuilder<SignupController>(
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        color: Colors.blue.shade600,
        minHeight: Get.height * 0.060,
        onPressed: () {},
      );
    },
  );
}
