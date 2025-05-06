import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/favorite_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavoriteController controller = Get.put(FavoriteController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Tutorial"),
      ),
      body: ListView.builder(
        itemCount: controller.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                if (controller.tempFruitList
                    .contains(controller.fruitList[index].toString())) {
                  controller
                      .removeToFavorite(controller.fruitList[index].toString());
                } else {
                  controller.tempFruitList
                      .add(controller.fruitList[index].toString());
                  controller
                      .addToFavorite(controller.fruitList[index].toString());
                }
              },
              title: Text(controller.fruitList[index].toString()),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: controller.tempFruitList
                          .contains(controller.fruitList[index].toString())
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
