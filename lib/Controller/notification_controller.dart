import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool switchValue = false.obs;

  void changeSwitchValue() {
    switchValue.value = !switchValue.value;
  }
}
