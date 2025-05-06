import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<String> fruitList = ['Orange', 'Apple', 'Mango', 'Banana'].obs;
  RxList tempFruitList = [].obs;

  addToFavorite(String value) {
    tempFruitList.add(value);
  }
  removeToFavorite(String value) {
    tempFruitList.remove(value);
  }
}
