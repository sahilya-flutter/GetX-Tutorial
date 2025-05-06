import 'package:flutter/material.dart';

import 'package:getx_tutorial/homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}
