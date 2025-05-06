import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_signup/contoller/login_contoller.dart';
import 'package:getx_api_signup/view/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bakgroundimage.png"),
                  fit: BoxFit.fitHeight)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 250),
                    const Text(
                      "Login to your Account",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                          controller: controller.passwordController.value,
                          obscureText: !controller.isPasswordVisible.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () =>
                                  controller.togglePasswordVisibility(),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Show test credentials info
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Test Credentials'),
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('This app uses reqres.in test API.'),
                                  SizedBox(height: 10),
                                  Text('For login use:'),
                                  Text('Email: eve.holt@reqres.in'),
                                  Text('Password: cityslicka'),
                                  SizedBox(height: 10),
                                  Text('For registration use:'),
                                  Text('Email: eve.holt@reqres.in'),
                                  Text('Password: pistol'),
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
                        },
                        child: const Text('Need Help?'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => ElevatedButton(
                          onPressed: controller.loading.value
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.loginApi();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.blue,
                            disabledBackgroundColor:
                                const Color.fromRGBO(34, 181, 254, 1),
                          ),
                          child: controller.loading.value
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            // Navigate to sign up screen
                            Get.to(() => const SignUpScreen());
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
