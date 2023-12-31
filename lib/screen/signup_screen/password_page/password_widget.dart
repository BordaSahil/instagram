import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/common/common_textField.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';

Widget passwordPageBody() {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.060, vertical: Get.height * 0.10),
    child: Column(
      children: [
        const Center(
          child: Text(
            StringRes.createPassword,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        verticalSizeBox(Get.height * 0.0150),
        SizedBox(
            width: Get.width * 0.7,
            child: const Text(
              StringRes.securiry,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            )),
        verticalSizeBox(Get.height * 0.020),
        passwordTextField(),
        checkBox(),
        verticalSizeBox(Get.height * 0.020),
        nextPassword()
      ],
    ),
  );
}

Widget passwordTextField() {
  return GetBuilder<SignupController>(
    builder: (controller) {
      return commonTextFiled(
          text: StringRes.password, controller: controller.password);
    },
  );
}

Widget nextPassword() {
  return GetBuilder<SignupController>(
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        minHeight: Get.height * 0.060,
        color: Colors.blue.shade600,
        onPressed: () {},
      );
    },
  );
}

Widget checkBox() {
  return Row(
    children: [
      GetBuilder<SignupController>(
        id: "checkBox",
        builder: (controller) {
          return Checkbox(
            fillColor: MaterialStatePropertyAll(Colors.green),
            value: controller.check,
            onChanged: (value) => controller.checkBox(),
          );
        },
      ),
      const Text("Remind me later"),
    ],
  );
}
