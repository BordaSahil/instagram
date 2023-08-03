import 'package:flutter/material.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_email_widget.dart';

class AddPhoneOrEmail extends StatelessWidget {
  const AddPhoneOrEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: phoneOrEmailPageBody(),
    );
  }
}
