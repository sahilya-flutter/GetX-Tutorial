import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_signup/auth/api_service.dart';
import 'package:getx_api_signup/auth/storage_service.dart';
import 'package:getx_api_signup/view/profile/dashbored.dart';
import 'package:getx_api_signup/view/screen/login_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxString token = "".obs;
  RxBool isPasswordVisible = false.obs;
  RxString userEmail = "".obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void loginApi() async {
    print("Login attempt started for: ${emailController.value.text}");
    if (emailController.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }

    if (passwordController.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your password");
      return;
    }

    loading.value = true;
    print("Making API login request...");

    final result = await ApiService.login(
        emailController.value.text, passwordController.value.text);

    if (result['statusCode'] == 200) {
      print("Login successful! Token received: ${result['body']['token']}");
      print("Saving token to local storage");
      // Save the token received from the API
      token.value = result['body']['token'];
      userEmail.value = emailController.value.text;

      // Save to local storage
      await StorageService.saveToken(token.value);
      await StorageService.saveEmail(userEmail.value);

      loading.value = false;
      Get.snackbar("Login successful", 'Welcome back!',
          backgroundColor: Colors.green, colorText: Colors.white);

      // Navigate to dashboard
      Get.off(() => const DashboardScreen());
    } else {
      print(
          "Login failed. Status code: ${result['statusCode']}. Error: ${result['body']['error']}");
      loading.value = false;
      Get.snackbar("Login failed",
          result['body']['error'] ?? "Invalid Email or Password",
          backgroundColor: Colors.red, colorText: Colors.white);

      // Show test credentials hint
      Get.dialog(
        AlertDialog(
          title: const Text('Login Failed'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This app uses reqres.in test API.'),
              SizedBox(height: 10),
              Text('Please use the following test credentials:'),
              SizedBox(height: 5),
              Text('Email: eve.holt@reqres.in'),
              Text('Password: cityslicka'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<bool> checkLoginStatus() async {
    final savedToken = await StorageService.getToken();
    final savedEmail = await StorageService.getEmail();

    if (savedToken != null && savedToken.isNotEmpty) {
      token.value = savedToken;
      userEmail.value = savedEmail ?? "";
      return true;
    }
    return false;
  }

  void logout() async {
    await StorageService.clearAll();
    token.value = "";
    userEmail.value = "";
    Get.offAll(() => const LoginScreen());
  }
}
