import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/common/common_textField.dart';
import 'package:instagram/screen/login_screen/login_controller.dart';
import 'package:instagram/utils/asset_res.dart';
import 'package:instagram/utils/string_res.dart';

Widget loginScreenBody() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: Get.width * 0.060, right: Get.width * 0.060, top: Get.height * 0.05),
        child: Column(
          children: [
            dropdownButton(),
            verticalSizeBox(Get.height * 0.15),
            SizedBox(height: Get.height * 0.060, child: Image.asset(AssetRes.instagramText)),
            verticalSizeBox(Get.height * 0.040),
            userNameTextField(),
            verticalSizeBox(Get.height * 0.020),
            passwordTextField(),
            verticalSizeBox(Get.height * 0.025),
            submitButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  StringRes.forgot,
                  style: TextStyle(fontSize: 12),
                ),
                getHelp()
              ],
            ),
            dividerRow(),
            verticalSizeBox(Get.height * 0.018),
            fbButton(),
          ],
        ),
      ),
      verticalSizeBox(Get.height * 0.15),
      const Expanded(child: Divider(thickness: 0.7, color: Colors.grey)),
      signupRow(),
      verticalSizeBox(10)
    ],
  );
}

Widget userNameTextField() {
  return GetBuilder<LoginController>(
    id: "user",
    builder: (controller) {
      return Column(
        children: [
          commonTextFiled(
            text: StringRes.phoneEmailUserName,
            controller: controller.userName,
          ),
        ],
      );
    },
  );
}

Widget passwordTextField() {
  return GetBuilder<LoginController>(
    builder: (controller) {
      return Column(
        children: [commonTextFiled(text: StringRes.password, controller: controller.password)],
      );
    },
  );
}

Widget dropdownButton() {
  return GetBuilder<LoginController>(
    id: "dropdown",
    builder: (controller) {
      return DropdownButton<String>(
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
        elevation: 0,
        focusColor: Colors.transparent,
        value: controller.dropdownValue,
        items: controller.items.map(
          (String items) {
            return DropdownMenuItem<String>(
              value: items,
              child: Text(
                items,
                style: const TextStyle(fontSize: 14),
              ),
            );
          },
        ).toList(),
        onChanged: controller.onChangeButton,
      );
    },
  );
}

Widget submitButton() {
  return GetBuilder<LoginController>(
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.login,
        textSize: 16,
        textColor: Colors.white,
        color: Colors.blue.shade600,
        minWidth: Get.width * 0.85,
        minHeight: Get.height * 0.060,
        onPressed: () => controller.goToHomeScreen(),
      );
    },
  );
}

Widget getHelp() {
  return TextButton(
      onPressed: () {},
      child: Text(StringRes.getLogging,
          style: TextStyle(fontSize: 13, color: Colors.indigo.shade900, fontWeight: FontWeight.bold)));
}

Widget dividerRow() {
  return Row(
    children: [
      const Expanded(
          child: Divider(
        thickness: 0.7,
        color: Colors.grey,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          StringRes.or,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
        ),
      ),
      const Expanded(
          child: Divider(
        thickness: 0.7,
        color: Colors.grey,
      )),
    ],
  );
}

Widget fbButton() {
  return GetBuilder<LoginController>(
    builder: (controller) {
      return ButtonWidget(
          minHeight: Get.height * 0.060,
          minWidth: Get.width * 0.85,
          icon: Icons.facebook,
          text: StringRes.continues,
          textSize: 17,
          textColor: Colors.white,
          color: Colors.blue.shade600,
          onPressed: () {});
    },
  );
}

Widget signupRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        StringRes.newUser,
        style: TextStyle(fontSize: 12),
      ),
      GetBuilder<LoginController>(
        builder: (controller) {
          return TextButton(
              onPressed: () => controller.goToSignup(),
              child: Text(
                StringRes.signup,
                style: TextStyle(fontSize: 13, color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
              ));
        },
      )
    ],
  );
}
