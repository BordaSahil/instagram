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
    builder: (controller) {
      return commonTextFiled(
          text: StringRes.email, controller: controller.signupEmail);
    },
  );
}

Widget emailSubmit() {
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
