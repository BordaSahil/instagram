import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_button.dart';
import 'package:instagram/screen/signup_screen/signup_controller.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:pinput/pinput.dart';

Widget otpScreen() {
  return GetBuilder<SignupController>(
    id: 'OtpVerification',
    builder: (controller) => Form(
      key: controller.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.060),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              StringRes.otp,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: Get.height * 0.050),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                controller: controller.pinController,
                focusNode: controller.focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: controller.defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '222222' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: Get.width / 6,
                      height: 1,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
                focusedPinTheme: controller.defaultPinTheme.copyWith(
                  decoration: controller.defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: controller.focusedBorderColor),
                  ),
                ),
                submittedPinTheme: controller.defaultPinTheme.copyWith(
                  decoration: controller.defaultPinTheme.decoration!.copyWith(
                    color: controller.fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: controller.focusedBorderColor),
                  ),
                ),
                errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.050),
            otpSubmit(),
          ],
        ),
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
