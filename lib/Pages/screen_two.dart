import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/SharedPref/shared_pref.dart';
import 'package:getxproject/Controller/slider_controller.dart';

class ScreenTwo extends StatelessWidget {
  final String name;

  const ScreenTwo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sliderController = Get.put(SliderController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two $name'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              List<String> locale = value.split('_');
              Get.updateLocale(Locale(locale[0], locale[1]));
              saveLang(locale[0], locale[1]);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'en_US', child: Text('English')),
              PopupMenuItem(value: 'es_ES', child: Text('Spanish')),
              PopupMenuItem(value: 'ur_PK', child: Text('Urdu')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * .2,
            // height: Get.height * .2,
            height: screenHeight * .2,
            color: Colors.red,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/screen_one');
              },
              child: Text('Go back to Screen One'),
            ),
          ),
          ListTile(
            tileColor: Colors.grey[300],
            title: Text('name'.tr),
            subtitle: Text('message'.tr),
          ),
          SizedBox(height: 20),
          Obx(() {
            return Container(
              height: 200,
              width: 200,
              color:
                  // ignore: deprecated_member_use
                  Colors.blue.withOpacity(sliderController.sliderValue.value),
            );
          }),
          Obx(() {
            return Slider(
                value: sliderController.sliderValue.value,
                onChanged: (value) {
                  sliderController.updateSliderValue(value);
                });
          }),
          Center(
            child: TextButton(
                onPressed: () {
                  Get.toNamed('/screen_three');
                },
                child: Text('Screen 3')),
          )
        ],
      ),
    );
  }
}
