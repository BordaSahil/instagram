import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/home_screen/home_controller.dart';
import 'package:instagram/screen/home_screen/home_page_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: homePageAppBar(),
      body: homePageBody(),
    );
  }
}
