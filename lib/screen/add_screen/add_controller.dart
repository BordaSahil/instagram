import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  File? fileImage;
  File? camera;

  List? imageList;
  void imagePost() {
    if (fileImage != null) {
      imageList!.add(fileImage);
      Get.back();
    }
    update(["postDone", "Gallery", "postList"]);
  }

  File? image;

  imagePickerGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(images!.path);
    update(['Gallery']);
  }

  imagePickerCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    camera = File(images!.path);
    update(['Camera']);
  }

  void dialogBox() {
    Get.dialog(
      SimpleDialog(
        children: [
          const Center(
              child: Text(
            "Pik Image",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => imagePickerGallery(),
                child: const Text("File"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => imagePickerCamera(),
                  child: const Text("Camera")),
            ],
          )
        ],
      ),
    );
    update(["dialogBox"]);
  }
}
