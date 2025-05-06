import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetThemeScreen extends StatefulWidget {
  const GetThemeScreen({super.key});

  @override
  State<GetThemeScreen> createState() => _GetThemeScreenState();
}

class _GetThemeScreenState extends State<GetThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Dialog Alert",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text("Getx Dialog Alert"),
              subtitle: const Text("How can Help you?"),
              onTap: () {
                Get.defaultDialog(
                  title: "Delete chat",
                  titlePadding: const EdgeInsets.only(top: 20),
                  contentPadding: const EdgeInsets.all(10),
                  middleText:
                      "are you sure you want delete this chat?hrer only 3 line chat ",
                  confirm: TextButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Get.back();
                      },
                      child: const Text("ok")),
                  cancel: TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Get.back();
                    },
                    child: const Text("cancle"),
                  ),
                  // content: Column(
                  //   children: [
                  //     Text("Multiline chat"),
                  //   ],
                  // ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Getx Dialog Alert"),
              subtitle: const Text("How can Help you?"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Get.changeThemeMode(ThemeMode.light);
                          },
                          leading: const Icon(Icons.light_mode),
                          title: const Text("Light Theme"),
                        ),
                        ListTile(
                          onTap: () {
                            Get.changeThemeMode(ThemeMode.dark);
                          },
                          leading: const Icon(Icons.dark_mode),
                          title: const Text("Dark Theme"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
