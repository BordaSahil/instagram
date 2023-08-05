import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_page.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_page.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_email_page.dart';
import 'package:instagram/services/firebase_service.dart';
import 'package:instagram/services/pref_service.dart';
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
  String varifiy = "";

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  ///---------------------------------user name------------------------///
  String? userNameError;
  void signupUserNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      userNameError = "Please Enter userName";
    } else if (!(value.isAlphabetOnly)) {
      userNameError = "Enter only Alphabet";
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
      mobileError = null;
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

  ///-------------------------------------Go TO Password Page--------------------------------------///
  Future<void> goToPassword() async {
    if (userNameError != null || signupUserName.text.isEmpty) {
      Get.snackbar("userName Error", "Please enter valid username");
    } else {
      Get.to(() => const PasswordScreen());
    }
    update(["userValidation"]);
  }

  ///----------------------------------------- Go To Phone Email Page----------------------------------///
  Future<void> goToPhoneEmail() async {
    if (passwordError != null || password.text.isEmpty) {
      Get.snackbar("Password", "Please enter valid password");
    } else {
      Get.to(() => const AddPhoneOrEmail());
    }
    update(["passwordValid"]);
  }

  ///-------------------------------------go to Otp Page(PHONE SUBMIT)--------------------------------------///
  Future<void> goToOtpPage() async {
    Map? getAllData = await FireBaseServices.getData("userData");
    List<Person>? userList;
    List<Map<String, dynamic>> userJsonList = [];
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
      bool matchSignupDetails = userList
          .any((element) => element.mobileNumber == signupPhone.text.trim());
      if (matchSignupDetails == true) {
        Get.snackbar('User Already Signup', 'Please Log In');
      } else {
        if (mobileError != null || signupPhone.text.isEmpty) {
          Get.snackbar("Mobile Error", "Please Enter valid Mobile Number");
          update(["phoneSubmit"]);
        } else {
          otp();
          Get.to(() => const OtpPage());
        }
      }
    } else {
      if (mobileError != null || signupPhone.text.isEmpty) {
        Get.snackbar("Mobile Error", "Please Enter valid Mobile Number");
        update(["phoneSubmit"]);
      } else {
        otp();
        Get.to(() => const OtpPage());
      }
    }
    update(["phoneSubmit"]);
  }

  ///--------------------------------otp function------------------------------///
  Future<void> otp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${signupPhone.text.trim()}",
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          otpSend = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e);
    }
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

  ///--------------------------------------OTP Verification-----------------------------///
  Future<void> validateOtpFunction() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otpSend, smsCode: varifiy);
      await FirebaseAuth.instance.signInWithCredential(credential);
      focusNode.unfocus();
      Map<String, dynamic> user = {
        "name": signupUserName.text.trim(),
        "phone": signupPhone.text.trim(),
        "password": password.text.trim(),
      };
      await FireBaseServices.setData('userData', user);
      await PrefService.setValue("isPhoneSignup", true);
      Get.offAll(() => const DashboardPage());
    } catch (e) {
      print(e);
      Get.snackbar('Otp Incorrect', "Please Enter Valid Otp");
    }
    update(['OtpVerification']);
  }

  ///--------------------------------------------------Email to Home--------------------------------///
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
        if (emailError != null || signupEmail.text.isEmpty) {
          Get.snackbar("Email Error", "Please Enter valid Email");
        } else {
          await FireBaseServices.setData('userData', user);
          await PrefService.setValue("isEmailSignup", true);
          Get.offAll(() => const DashboardPage());
        }
      }
    } else {
      if (emailError != null || signupEmail.text.isEmpty) {
        Get.snackbar("Email Error", "Please Enter valid Email");
      } else {
        await FireBaseServices.setData('userData', user);
        await PrefService.setValue("isEmailSignup", true);
        Get.offAll(() => const DashboardPage());
      }
    }
    update(["emailSubmit"]);
  }
}
