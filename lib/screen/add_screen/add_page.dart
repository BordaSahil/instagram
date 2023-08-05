import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/add_screen/add_controller.dart';
import 'package:instagram/screen/add_screen/add_page_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    return Scaffold(
      appBar: addPostAppBar,
    );
  }
}
