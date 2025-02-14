import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  void incrementCounter() {
    counter.value += 1;
  }
}
