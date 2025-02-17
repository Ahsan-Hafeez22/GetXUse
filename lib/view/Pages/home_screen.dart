import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controller/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Tutorial'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.yellow,
        ),
        body:
            // body: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     title: Text('Hello, GetX!'),
            //     subtitle: Text('Welcome to GetX Tutorial'),
            //     tileColor: Colors.grey[200],
            //     onTap: () {
            //       // Get.snackbar(
            //       //   'GetX Tutorial',
            //       //   'Hello, GetX!',
            //       //   snackPosition: SnackPosition.BOTTOM,
            //       //   backgroundColor: Colors.yellow,
            //       //   colorText: Colors.black,
            //       // );
            //       // Get.defaultDialog(
            //       //     title: 'GetX Tutorial',
            //       //     middleText: 'Hello, GetX!',
            //       //     titleStyle: TextStyle(
            //       //       color: Colors.black,
            //       //       fontSize: 20,
            //       //       fontWeight: FontWeight.bold,
            //       //     ),
            //       //     middleTextStyle: TextStyle(
            //       //       color: Colors.black,
            //       //       fontSize: 16,
            //       //     ),
            //       //     confirm: TextButton(
            //       //       onPressed: () {
            //       //         Get.back();
            //       //       },
            //       //       child: Text('OK'),
            //       //     ),
            //       //     cancel: TextButton(
            //       //         onPressed: () {
            //       //           Get.back();
            //       //         },
            //       //         child: Text('Cancel')));
            //       Get.bottomSheet(
            //         Container(
            //           padding: EdgeInsets.all(16),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black26,
            //                 blurRadius: 10,
            //                 spreadRadius: 2,
            //               ),
            //             ],
            //           ),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Container(
            //                 height: 5,
            //                 width: 50,
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade400,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //               SizedBox(height: 16),
            //               ListTile(
            //                 leading: Icon(Icons.light_mode, color: Colors.black54),
            //                 title: Text(
            //                   'Light Mode',
            //                   style: TextStyle(
            //                       fontSize: 16, fontWeight: FontWeight.bold),
            //                 ),
            //                 onTap: () {
            //                   Get.changeThemeMode(ThemeMode.dark);
            //                   Get.back();
            //                 },
            //               ),
            //               SizedBox(height: 16),
            //               ListTile(
            //                 leading: Icon(Icons.dark_mode, color: Colors.black54),
            //                 title: Text(
            //                   'Dark Mode',
            //                   // style: TextStyle(
            //                   //     fontSize: 16, fontWeight: FontWeight.bold),
            //                 ),
            //                 onTap: () {
            //                   Get.changeThemeMode(ThemeMode.light);
            //                   Get.back();
            //                 },
            //               ),
            //               SizedBox(height: 10),
            //               ListTile(
            //                 leading: Icon(Icons.logout, color: Colors.redAccent),
            //                 title: Text(
            //                   'Logout',
            //                   // style: TextStyle(
            //                   //     fontSize: 16, fontWeight: FontWeight.bold),
            //                 ),
            //                 onTap: () {
            //                   Get.back(); // Close the bottom sheet
            //                 },
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(15),
            //                 ),
            //                 tileColor: Colors.grey.shade100,
            //               ),
            //             ],
            //           ),
            //         ),
            //         isScrollControlled: true, // Makes it draggable
            //         barrierColor: Colors.black54, // Dims background
            //       );
            //     },
            //   ),
            // ),

            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                controller: loginController.emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                controller: loginController.passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                loginController.loginApi();
              },
              child: Obx(() => loginController.loading.value
                  ? CircularProgressIndicator()
                  : Text('Login')),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/screen_one',
                  );
                },
                child: Text('Go to Screen One'),
              ),
            ),
          ],
        ));
  }
}
