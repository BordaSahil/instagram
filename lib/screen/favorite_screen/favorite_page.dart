import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/favorite_screen/favorite_controller.dart';
import 'package:instagram/screen/favorite_screen/favorite_page_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
      body: favoriteBody(),
    );
  }
}
