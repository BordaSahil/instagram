import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/splash_screen/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
