import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Utils/utils.dart';
import 'package:getxproject/data/repository/login_repository.dart';
import 'package:getxproject/model/login/user_model.dart';
import 'package:getxproject/res/route/routes_name.dart';
import 'package:getxproject/view_model/controller/user_preference/user_pref.dart';

class LoginViewModel extends GetxController {
  final loginRepo = LoginRepository();
  UserPref userPref = UserPref();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  loginApi() {
    loading.value = true;
    var data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    loginRepo.loginApi(data).then((value) {
      loading.value = false;
      userPref.saveUser(UserModel.fromJson(value)).then(
        (value) {
          Get.toNamed(RoutesName.homeView);
        },
      );
      Utils.snackbarMessage("Login Success", "You can login features now.");
    }).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snackbarMessage("Login Failed", error.toString());

        log(error.toString());
      },
    );
  }
}
