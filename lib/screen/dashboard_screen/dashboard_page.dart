import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_controller.dart';
import 'package:instagram/screen/dashboard_screen/dashboard_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      body: dashboardBody,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
