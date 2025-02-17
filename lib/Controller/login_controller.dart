import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController(); // No need for .obs
  final passwordController = TextEditingController();
  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      // log("Email: ${emailController.text}");
      // log("Password: ${passwordController.text}");

      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': emailController.text, // Use .text to get the value
          'password': passwordController.text,
        },
      );

      var data = jsonDecode(response.body);
      log("Response: $data");
      // log("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar("Login", "Successfully Logged in");
      } else {
        Get.snackbar("Caution", "Failed to Log in");
      }
    } catch (e) {
      Get.snackbar("Exception", "Failed to Log in",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      loading.value = false; // Ensure loading stops even if an error occurs
    }
  }
}
