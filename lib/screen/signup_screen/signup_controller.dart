import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_page.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_email_page.dart';
import 'package:instagram/services/firebase_service.dart';
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
  var otpSend = '';

  ///---------------------------------user name------------------------///
  String? userNameError;

  void signupUserNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      userNameError = "Please Enter Detail";
    } else if (!(value.isAlphabetOnly)) {
      userNameError = "Enter valid username";
    } else {
      userNameError = null;
    }
    update(["userName"]);
  }

  ///----------------------------password--------------------------------------///
  String? passwordError;

  void signupPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      passwordError = "Please Enter Password";
    } else if (!(value.length > 7)) {
      passwordError = "Enter password must be 8 character";
    } else {
      passwordError = null;
    }
    update(["password"]);
  }

  ///--------------------------------------mobile---------------------------------///
  String? mobileError;

  void signupMobile(String? value) {
    if (value == null || value.isEmpty) {
      mobileError = "Please Enter Mobile number";
    } else if (!(value.length == 10 && value.isNumericOnly)) {
      mobileError = "Please Enter valid number";
    } else {
      passwordError = null;
    }
    update(["mobileValidation"]);
  }

  ///-----------------------------------email---------------------------------------------------------///
  String? emailError;

  void signupEmailValidation(String? value) {
    if (value == null || value.isEmpty) {
      emailError = 'Please Enter Email';
    } else if (!(value.isEmail)) {
      emailError = "Please Enter valid email";
    } else {
      emailError = null;
    }
    update(["emailValidation"]);
  }

  void checkBox() {
    check = !check;
    update(["checkBox"]);
  }

  Future<void> goToPassword() async {
    if (userNameError != null || signupUserName.text.isEmpty) {
      Get.snackbar("userName", "Please enter username");
    } else {
      Get.to(() => const PasswordScreen());
    }
    update(["userValidation"]);
    if (userNameError != "") {}
    Get.to(() => const PasswordScreen());
  }

  Future<void> goToPhoneEmail() async {
    if (passwordError != null || password.text.isEmpty) {
      Get.snackbar("Password", "Please enter password");
    } else {
      Get.to(() => const AddPhoneOrEmail());
    }
    update(["passwordValid"]);
  }

  Future<void> goToOtpPage() async {
    if (mobileError != null || signupPhone.text.isEmpty) {
      Map? getAllData = await FireBaseServices.getData("userData");
      List<Person>? userList;
      List<Map<String, dynamic>> userJsonList = [];
      if (otpSend == pinController.text) {
        if (getAllData != null) {
          getAllData.forEach((key, value) {
            Map<String, dynamic> userData = {};
            userData["id"] = key;
            value.forEach((key1, value1) {
              userData[key1] = value1;
            });
            userJsonList.add(userData);
          });
          userList = userFromJson(jsonEncode(userJsonList));
          bool matchSignupDetails = userList.any(
              (element) => element.mobileNumber == signupPhone.text.trim());
          if (matchSignupDetails == true) {
            Get.snackbar('User Already Signup', 'Please Log In');
          } else {
            otp();
            Get.to(() => const OtpPage());
          }
        }
      } else {
        Get.snackbar("otp Error", "Please Enter Valid OTP");
      }
      update(["phoneSubmit", "OtpPinPut"]);
    }
  }

  ///--------------------------------otp------------------------------///
  Future<void> otp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${signupPhone.text.trim()}",
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

  PinTheme defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(),
    ),
  );

  Future<void> validateOtpFunction() async {
    focusNode.unfocus();
    Map<String, dynamic> user = {
      "name": signupUserName.text.trim(),
      "phone": signupPhone.text.trim(),
      "password": password.text.trim(),
    };
    if (formKey.currentState!.validate()) {
      await FireBaseServices.setData('userData', user);
      update(['OtpVerification']);
      Get.offAll(() => const DashboardPage());
    } else {
      Get.snackbar('Otp Incorrect', "Please Enter Valid Otp");
    }
    update(['OtpVerification']);
  }

  Future<void> emailToGoHome() async {
    Map? getAllData = await FireBaseServices.getData("userData");
    List<Person>? userList;
    List<Map<String, dynamic>> userJsonList = [];
    Map<String, dynamic> user = {
      "name": signupUserName.text.trim(),
      "password": password.text.trim(),
      "email": signupEmail.text.trim()
    };
    if (getAllData != null) {
      getAllData.forEach((key, value) {
        Map<String, dynamic> userData = {};
        userData["id"] = key;
        value.forEach((key1, value1) {
          userData[key1] = value1;
        });
        userJsonList.add(userData);
      });
      userList = userFromJson(jsonEncode(userJsonList));
      bool matchSignupDetails =
          userList.any((element) => element.email == signupEmail.text.trim());
      if (matchSignupDetails == true) {
        Get.snackbar('User Already Signup', 'Please Log In');
      } else {
        await FireBaseServices.setData('userData', user);
        Get.offAll(() => const DashboardPage());
      }
    } else {
      await FireBaseServices.setData('userData', user);
      Get.offAll(() => const DashboardPage());
    }
    update(["emailSubmit"]);
  }
}
