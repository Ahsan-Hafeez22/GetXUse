import 'dart:developer';
import 'package:get/get.dart';

class FavListController extends GetxController {
  var listOfFruits =
      <String>['Orange', 'Apple', 'Banana', 'Strawberry', 'Mango'].obs;

  var tempListFruits = <String>[].obs;

  void addFruitsinTemp(String fruit) {
    tempListFruits.add(fruit);
    log('Added: $fruit');
  }

  void removeFruitsinTemp(String fruit) {
    tempListFruits.remove(fruit);
    log('Removed: $fruit');
  }

  bool isFruitAvailable(String fruit) {
    return tempListFruits.contains(fruit);
  }
}
