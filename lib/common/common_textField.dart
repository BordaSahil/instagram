import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/utils/color_res.dart';

Widget commonTextFiled({
  required String text,
  required TextEditingController controller,
  Widget? suffixIcon,
  bool obscureText = false,
  void Function(String)? onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        cursorColor: ColorsRes.black,
        cursorWidth: 1,
        controller: controller,
        style: TextStyle(fontSize: Get.height * 0.018),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: text,
          hintStyle:
              TextStyle(fontSize: Get.height * 0.018, color: Colors.black38),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.grey.shade300,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    ],
  );
}
