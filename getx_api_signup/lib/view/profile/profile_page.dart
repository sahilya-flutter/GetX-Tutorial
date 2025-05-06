import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_signup/contoller/image_picker_controller.dart';
import 'package:getx_api_signup/view/screen/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getx_api_signup/contoller/login_contoller.dart';

class ProfilePage extends StatefulWidget {
  final Map userProfile;

  const ProfilePage({super.key, required this.userProfile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LoginController controller = Get.find();
  ImagePickerController imageController = Get.put(ImagePickerController());
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    final profile = widget.userProfile;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _pickedImage != null
                      ? FileImage(_pickedImage!)
                      : (profile.isNotEmpty
                              ? NetworkImage(profile['avatar'])
                              : const AssetImage('assets/default_avatar.png'))
                          as ImageProvider,
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: InkWell(
                    onTap: imageController.getImage,
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 18,
                      child: Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              profile.isNotEmpty
                  ? "${profile['first_name']} ${profile['last_name']}"
                  : "Welcome Back!",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              profile.isNotEmpty
                  ? profile['email']
                  : controller.userEmail.value,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                controller.token.value = '';
                controller.userEmail.value = '';
                Get.offAll(() => LoginScreen());

              },
              icon: const Icon(Icons.logout),
              label: const Text("Sign Out"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
