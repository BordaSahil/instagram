import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/profile_screen/profile_controller.dart';
import 'package:instagram/screen/profile_screen/profile_page_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      body: profileBody(),
    );
  }
}
