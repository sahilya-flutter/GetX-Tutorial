import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_getx/image_picker_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker in Getx"),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Center(
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.toString()))
                        : null),
              ),
              TextButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  child: Text("Pick Image"))
            ],
          );
        },
      ),
    );
  }
}
