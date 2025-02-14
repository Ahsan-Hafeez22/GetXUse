import 'package:get/get.dart';

class SliderController extends GetxController {
  RxDouble sliderValue = 0.0.obs;
  void updateSliderValue(double value) {
    sliderValue.value = value;
  }
}
