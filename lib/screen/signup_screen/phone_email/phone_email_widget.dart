import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/utils/string_res.dart';

Widget phoneOrEmailPageBody() {
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
        Text(
          StringRes.changeItLater,
          style: TextStyle(color: Colors.black45),
        ),
        verticalSizeBox(Get.height * 0.025),
        verticalSizeBox(Get.height * 0.025),
      ],
    ),
  );
}

Widget phoneTextField() {
  return TextField();
}
