import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/common/common_textField.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSizeBox(50),
        enterPhone(),
        verticalSizeBox(10),
        const Text(
          StringRes.sms,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45),
        ),
        verticalSizeBox(20),
        phoneSubmit()
      ],
    );
  }
}

Widget enterPhone() {
  return GetBuilder<SignupController>(
    id: "mobileValidation",
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextFiled(
            text: StringRes.phone,
            controller: controller.signupPhone,
            onChanged: (value) => controller.signupMobile(value),
          ),
          verticalSizeBox(Get.height * 0.0050),
          controller.mobileError == null
              ? const SizedBox()
              : Text(
                  controller.mobileError!,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      );
    },
  );
}

Widget phoneSubmit() {
  return GetBuilder<SignupController>(
    builder: (controller) {
      return ButtonWidget(
        text: StringRes.next,
        textColor: Colors.white,
        textSize: 17,
        color: Colors.blue.shade600,
        minHeight: Get.height * 0.060,
        onPressed: () => controller.goToOtpPage(),
      );
    },
  );
}
