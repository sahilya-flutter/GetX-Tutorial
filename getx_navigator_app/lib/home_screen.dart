import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Languages"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(children: [
        ListTile(
          title: Text("message".tr),
          subtitle: Text("name".tr),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  Get.updateLocale(const Locale('en', 'US'));
                },
                child: const Text("English")),
            OutlinedButton(
                onPressed: () {
                  Get.updateLocale(const Locale('en', 'IN'));
                },
                child: const Text("Hindi")),
          ],
        )
      ]),
    );
  }
}
