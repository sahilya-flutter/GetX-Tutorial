import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;

  incrementCounter() {
    counter.value++;
    print(counter.value);
  }

  decrementCounter() {
    if (counter > 0) {
      counter--;
    }
    print(counter.value);
  }
}
