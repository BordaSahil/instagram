import 'package:flutter/material.dart';
import 'package:instagram/screen/signup_screen/password_page/password_widget.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: passwordPageBody(),
    );
  }
}
