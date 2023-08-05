import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/screen/add_screen/add_page_widget.dart';

class AddController extends GetxController {

  @override
  void onInit() {
    bottomSheetOpen();
    super.onInit();
  }

  File? image;

  imagePickerGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    image = File(images!.path);
    update(['Gallery']);
  }

  imagePickerCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    image = File(images!.path);
    update(['Camera']);
  }

  void bottomSheetOpen(){
    Get.bottomSheet(
      Container(
          height: 150,
          color: Colors.greenAccent,
          child: Column(
            children: [

            ],
          )
      ),
      barrierColor: Colors.red[50],
      isDismissible: false,
    );
  }

}
