import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/common/common_textField.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';

Widget signupPageBody() {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.060, vertical: Get.height * 0.10),
    child: Column(
      children: [
        const Center(
          child: Text(
            StringRes.chooseUserName,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        verticalSizeBox(Get.height * 0.020),
        const Text(
          StringRes.changeItLater,
          style: TextStyle(color: Colors.black45),
        ),
        verticalSizeBox(Get.height * 0.025),
        userNameTextField(),
        verticalSizeBox(Get.height * 0.025),
        nextButton()
      ],
    ),
  );
}

Widget userNameTextField() {
  return GetBuilder<SignupController>(
    id: "userName",
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextFiled(
            controller: controller.signupUserName,
            text: StringRes.userName,
            onChanged: (value) => controller.signupUserNameValidation(value),
          ),
          horizontalSizeBox(Get.height * 0.015),
          controller.userNameError == null
              ? const SizedBox()
              : Text(
                  controller.userNameError!,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      );
    },
  );
}

Widget nextButton() {
  return GetBuilder<SignupController>(
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        color: Colors.blue.shade600,
        minHeight: Get.height * 0.060,
        onPressed: () => controller.goToPassword(),
      );
    },
  );
}
