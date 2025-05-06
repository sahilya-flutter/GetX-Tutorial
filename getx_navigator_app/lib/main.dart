import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigator_app/home_screen.dart';
import 'package:getx_navigator_app/language.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(),
      locale: Locale('en', 'IN'),
      fallbackLocale: Locale("en", "IN"),
      home: HomeScreen(),
    );
  }
}
