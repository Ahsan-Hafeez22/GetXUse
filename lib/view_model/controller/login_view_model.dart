import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/data/repository/login_repository.dart';

class LoginViewModel extends GetxController {
  final loginRepo = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  loginApi() {
    var data = {
      'email': emailController.value,
      'password': passwordController.value
    };
    loginRepo.loginApi(data).then((value) {}).onError(
          (error, stackTrace) {},
        );
  }
}
