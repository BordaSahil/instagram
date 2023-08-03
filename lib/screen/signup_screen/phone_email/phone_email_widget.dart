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
        const Center(
          child: Text(
            StringRes.addPhoneOrEmail,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        verticalSizeBox(Get.height * 0.025),
        const TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          tabs: [
            Tab(
              text: StringRes.phone,
            ),
            Tab(text: StringRes.email),
          ],
        ),
        const Expanded(
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
