import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen One"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(ScreenTwo());
                  },
                  child: Text('Go to Next Screen'))),
        ],
      ),
    );
  }
}
