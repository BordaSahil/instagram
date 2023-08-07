import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:instagram/common/common_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:instagram/screen/add_screen/add_controller.dart';

AppBar addPostAppBar = AppBar(
  backgroundColor: Colors.white,
  leading: IconButton(
    onPressed: () {
      Get.back();
    },
    icon: const Icon(
      EvaIcons.close,
      color: Colors.black,
      size: 30,
    ),
  ),
  title: const Text(
    StringRes.newPost,
    style: TextStyle(color: Colors.black),
  ),
  actions: [
    TextButton(
      onPressed: () {},
      child: const Text(
        StringRes.post,
        style: TextStyle(color: Colors.blueAccent, fontSize: 20),
      ),
    ),
  ],
);

/*
Widget imagePick() {
  return GetBuilder<AddController>(
    id: "imageGallery",
    builder: (controller) => Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: InkWell(
        onTap: () => controller.imagePickerGallery(),
        child: CircleAvatar(
          radius: 60,
          child: controller.image != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(controller.image!),
                )
              : null,
        ),
      ),
    ),
  );
}
*/

Widget addNewPostGallery() {
  return GetBuilder<AddController>(
    id: 'Gallery',
    builder: (controller) => ButtonWidget(
      minHeight: 45,
      minWidth: 150,
      text: 'Gallery',
      color: Colors.white,
      onPressed: () => controller.imagePickerGallery(),
    ),
  );
}

Widget addNewPostCamera() {
  return GetBuilder<AddController>(
    id: 'Camera',
    builder: (controller) => ButtonWidget(
      minHeight: 45,
      minWidth: 150,
      text: 'Camera',
      color: Colors.white,
      onPressed: () => controller.imagePickerCamera(),
    ),
  );
}
