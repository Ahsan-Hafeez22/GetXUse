import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controller/counter_controller.dart';
import 'package:getxproject/Controller/favorite_list_controller.dart';
import 'package:getxproject/Controller/notification_controller.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final favListController = Get.put(FavListController());
  List<String> listOfFruits = [
    'Orange',
    'Apple',
    'Banana',
    'Strawberry',
    'Mango'
  ];
  Set<String> tempSet = {};
  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    final notificationController = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCounter();
        },
        child: Icon(Icons.plus_one),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return ListTile(
              title: Text(
                "Notification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              tileColor: Colors.grey[300],
              trailing: Switch(
                  value: notificationController.switchValue.value,
                  onChanged: (value) {
                    notificationController.changeSwitchValue();
                  }),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/screen_two', arguments: {'name': 'John Doe'});
            },
            child: Text('Go to Screen Two'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Go Back to Home Screen'),
          ),
          Center(
            child: Obx(
              () {
                return Text(counterController.counter.value.toString());
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: favListController.listOfFruits.length,
                itemBuilder: (context, index) {
                  String fruit = favListController.listOfFruits[index];
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            if (favListController.tempListFruits
                                .contains(fruit)) {
                              favListController.removeFruitsinTemp(fruit);
                              log('Remove');
                            } else {
                              favListController.addFruitsinTemp(fruit);
                              log('Added');
                            }
                            // setState(() {

                            //   if (tempSet.contains(fruit)) {
                            //     tempSet.remove(fruit);
                            //   } else {
                            //     tempSet.add(fruit);
                            //   }
                            // });
                          },
                          tileColor: Colors.grey[200],
                          title: Text(fruit),
                          trailing: Obx(
                            () => Icon(
                              Icons.favorite,
                              color: favListController.isFruitAvailable(fruit)
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          )),
                      SizedBox(height: 5)
                    ],
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
