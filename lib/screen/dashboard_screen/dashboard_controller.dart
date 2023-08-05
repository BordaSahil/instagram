import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/add_screen/add_page.dart';
import 'package:instagram/screen/add_screen/add_page_widget.dart';
import 'package:instagram/screen/favorite_screen/favorite_page.dart';
import 'package:instagram/screen/home_screen/home_page.dart';
import 'package:instagram/screen/profile_screen/profile_page.dart';
import 'package:instagram/screen/search_screen/search_page.dart';

class DashboardController extends GetxController {
  int currentIndex = 0;

  List<Widget> screenList = [
    const HomeScreen(),
    const SearchScreen(),
    const AddScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  final Shader linearGradient = const RadialGradient(
    colors: <Color>[
      Color(0xff8a3ab9),
      Color(0xffe95950),
      Color(0xffbc2a8d),
      Color(0xfffccc63),
      Color(0xfffbad50),
      Color(0xffcd486b),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

  void onTapNavigation(int index) {
    currentIndex = index;
    update(["bottomNavigation"]);
  }

  void addNewPhoto(){
    addNewPostGallery();
    addNewPostCamera();
    update(['bottomNavigation']);
  }

}
