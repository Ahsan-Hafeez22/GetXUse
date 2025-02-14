import 'dart:developer';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  RxString path = "".obs;
  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final imagePath = await picker.pickImage(source: ImageSource.gallery);
    if (imagePath != null) {
      path.value = imagePath.path.toString();
      log('Path: ${imagePath.toString()}');
    } else {
      log('failed');
    }
  }
}
