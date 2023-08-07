import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
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
}
