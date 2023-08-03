import 'package:flutter/material.dart';
import 'package:instagram/screen/signup_screen/otp_page/otp_widget.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: otpScreen(),
    );
  }
}
