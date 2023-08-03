import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/splash_screen/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
