import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/screen/signup_screen/phone_email/email_page.dart';
import 'package:instagram/screen/signup_screen/phone_email/phone_page.dart';
import 'package:instagram/utils/string_res.dart';

Widget phoneOrEmailPageBody() {
  return tabBar();
}

Widget tabBar() {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.060, vertical: Get.height * 0.10),
    child: Column(
      children: [
        Center(
          child: Text(
            StringRes.chooseUserName,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        verticalSizeBox(Get.height * 0.020),
        const Text(
          StringRes.changeItLater,
          style: TextStyle(color: Colors.black45),
        ),
        verticalSizeBox(Get.height * 0.025),
        verticalSizeBox(Get.height * 0.025),
        TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.blue,
          labelPadding: EdgeInsets.all(0),
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          tabs: [
            Tab(
              text: "PHONE",
            ),
            Tab(text: "EMAIL"),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              PhonePage(),
              EmailPage(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget phoneTextField() {
  return const TextField();
}
