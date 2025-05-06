import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_statemanagment_app/counter_controler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final CounterController controller = Get.put(CounterController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx StateManagment"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Obx(() => Text(
                  controller.counter.toString(),
                  style: const TextStyle(fontSize: 60),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.incrementCounter();
                  },
                  child: const Icon(Icons.add)),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.decrementCounter();
                  },
                  child: const Icon(Icons.minimize)),
            ],
          )
        ],
      ),
    );
  }
}
