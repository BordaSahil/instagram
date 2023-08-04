import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/common/common_textField.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSizeBox(50),
        enterEmail(),
        verticalSizeBox(30),
        emailSubmit(),
      ],
    );
  }
}

Widget enterEmail() {
  return GetBuilder<SignupController>(
    id: "emailValidation",
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextFiled(
            text: StringRes.email,
            controller: controller.signupEmail,
            onChanged: (value) => controller.signupEmailValidation(value),
          ),
          verticalSizeBox(Get.height * 0.0050),
          controller.emailError == null
              ? const SizedBox()
              : Text(
                  controller.emailError!,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      );
    },
  );
}

Widget emailSubmit() {
  return GetBuilder<SignupController>(
    id: "emailSubmit",
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        color: Colors.blue.shade600,
        minHeight: Get.height * 0.060,
        onPressed: () => controller.emailToGoHome(),
      );
    },
  );
}
