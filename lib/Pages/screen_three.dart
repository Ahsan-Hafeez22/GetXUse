import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controller/image_contorller.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(title: Text("Image")),
      body: Column(
        children: [
          Obx(
            () => ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: imageController.path.value.isNotEmpty
                    ? FileImage(File(imageController.path.value))
                    : null,
              ),
              tileColor: Colors.grey[200],
              title: Text("Image"),
              onTap: () {
                // Get.to(ImageView(imagePath: imageController.path.value));
              },
            ),
          ),
          TextButton(
              onPressed: () {
                imageController.getImage();
              },
              child: Text('Select Image')),
        ],
      ),
    );
  }
}

// class ImageView extends StatelessWidget {
//   final String imagePath;
//   const ImageView({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//       height: Get.height * 0.5,
//       child: Image.file(File(imagePath)),
//     ));
//   }
// }
