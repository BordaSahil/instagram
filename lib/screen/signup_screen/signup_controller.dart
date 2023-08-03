import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_page.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_email_page.dart';
import 'package:pinput/pinput.dart';

import 'password_page/password_page.dart';

class SignupController extends GetxController {
  bool check = false;

  TextEditingController signupUserName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signupPhone = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  String? userNameError;
  void signupUserNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      userNameError = "Please Enter Detail";
    } else if (!(value.isEmail)) {
      userNameError = "Enter valid username";
    } else {
      userNameError = null;
    }
    update(["userName"]);
  }

  String? passwordError;
  void signupPassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError = "Please Enter Password";
    } else if (!(value.length > 8)) {
      passwordError = "Enter password must be 8 character";
    } else {
      passwordError = null;
    }
    update(["password"]);
  }

  void checkBox() {
    check = !check;
    update(["checkBox"]);
  }

  Future<void> goToPassword() async {
    update(["userName"]);
    Get.to(() => const PasswordScreen());
  }

  Future<void> goToHome() async {
    // Map<String, dynamic> passwordSet = {
    //   "userName": signupUserName.text.trim(),
    //   "password": password.text.trim()
    // };
    // await FireBaseServices.setData("userData", passwordSet);
    update(["password"]);
    Get.to(() => const AddPhoneOrEmail());
  }

  void goToOtpPage() {
    otp();
    Get.to(() => const OtpPage());
  }

  Future<void> otp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: signupPhone.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  Color focusedBorderColor = const Color.fromRGBO(23, 171, 144, 1);
  Color fillColor = const Color.fromRGBO(243, 246, 249, 0);
  // Color borderColor = Color(Colors.black as int);

  PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(
        // color: Color(Colors.black as int),
      ),
    ),
  );

  void validateOtpFunction(){
    focusNode.unfocus();
    formKey.currentState!.validate();
    update(['OtpVerification']);
  }

}
