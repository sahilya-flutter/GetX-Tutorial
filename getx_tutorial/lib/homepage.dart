import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_one.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Tutorial",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Card(
          //   child: ListTile(
          //     title: const Text("Hey Sahil This is GetX Dialoug Tutorial"),
          //     subtitle: const Text("You want Delete a Box "),
          //     onTap: () {
          //       Get.defaultDialog(
          //           title: 'Delete',
          //           titlePadding: const EdgeInsets.only(top: 10),
          //           middleText: 'Are you sure Detele this chat?',
          //           contentPadding: const EdgeInsets.all(20),
          //           confirm: TextButton(
          //             onPressed: () {
          //               // Navigator.pop(context);
          //               Get.back();
          //             },
          //             child: const Text("Ok"),
          //           ),
          //           cancel: TextButton(
          //             onPressed: () {
          //               // Navigator.pop(context);
          //               Get.back();
          //             },
          //             child: const Text("Cancle"),
          //           ));
          //     },
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: const Text("Hey Sahil This is GetX BotoomSheet Tutorial"),
          //     subtitle: const Text("You want Delete a Box "),
          //     onTap: () {
          //       Get.bottomSheet(Container(
          //         decoration: const BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(30),
          //                 topRight: Radius.circular(100)),
          //             color: Colors.red),
          //         child: Column(
          //           children: [
          //             ListTile(
          //               leading: const Icon(Icons.light_mode),
          //               title: const Text("Light Theme"),
          //               onTap: () {
          //                 Get.changeTheme(ThemeData.light());
          //               },
          //             ),
          //             ListTile(
          //               leading: const Icon(Icons.dark_mode),
          //               title: const Text("Dark Theme"),
          //               onTap: () {
          //                 Get.changeTheme(ThemeData.dark());
          //               },
          //             ),
          //           ],
          //         ),
          //       ));
          //     },
          //   ),
          // ),

          Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(ScreenOne());
                  },
                  child: const Text("Go To Nexxt Screen"))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Hey Sahil',
            'Welcome to Snackbar',
            borderRadius: 25,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.insert_emoticon),
          );
        },
      ),
    );
  }
}
