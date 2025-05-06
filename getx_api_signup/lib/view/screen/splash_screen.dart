import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_signup/contoller/login_contoller.dart';
import 'package:getx_api_signup/view/profile/dashbored.dart';
import 'package:getx_api_signup/view/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  _checkAuth() async {
    await Future.delayed(const Duration(seconds: 9));
    print("SplashScreen: Checking authentication status...");
    if (await controller.checkLoginStatus()) {
      print("User is authenticated, redirecting to Dashboard");
      Get.off(() => const DashboardScreen());
    } else {
      print("No existing authentication, redirecting to Login");
      Get.off(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_calibort.png',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
