import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Two"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: Text('Go Back'))),
        ],
      ),
    );
  }
}
