import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_controller.dart';
import 'package:instagram/utils/color_res.dart';

Widget dashboardBody = GetBuilder<DashboardController>(
  id: "bottomNavigationBar",
  builder: (controller) => controller.screenList[controller.currentIndex],
);

Widget bottomNavigationBar = GetBuilder<DashboardController>(
  id: "bottomNavigation",
  builder: (controller) {
    return FlashyTabBar(
      selectedIndex: controller.currentIndex,
      showElevation: false,
      onItemSelected: (index) => controller.onTapNavigation(index),
      items: [
        FlashyTabBarItem(
          icon: iconBottom(icon: Icons.home),
          title: Text(
            'Home',
            style: TextStyle(
              foreground: Paint()..shader = controller.linearGradient,
              fontSize: 15,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: iconBottom(icon: Icons.search),
          title: Text(
            'Search',
            style: TextStyle(
              foreground: Paint()..shader = controller.linearGradient,
              fontSize: 15,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: iconBottom(
            icon: Icons.add_box_outlined,
          ),
          title: Text(
            'Add',
            style: TextStyle(
              foreground: Paint()..shader = controller.linearGradient,
              fontSize: 15,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: iconBottom(icon: Icons.favorite_border_rounded),
          title: Text(
            'Favorite',
            style: TextStyle(
              foreground: Paint()..shader = controller.linearGradient,
              fontSize: 15,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: iconBottom(icon: Icons.person),
          title: Text(
            'Profile',
            style: TextStyle(
              foreground: Paint()..shader = controller.linearGradient,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  },
);

Widget iconBottom({IconData? icon}) {
  return ShaderMask(
    blendMode: BlendMode.srcIn,
    shaderCallback: (Rect bounds) =>
        const RadialGradient(colors: ColorsRes.colorList).createShader(bounds),
    child: Icon(icon),
  );
}
