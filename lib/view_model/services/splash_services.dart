import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getxproject/res/route/routes_name.dart';
import 'package:getxproject/view_model/controller/user_preference/user_pref.dart';

class SplashServices {
  void isLogin() {
    UserPref userPref = UserPref();
    userPref.getUser().then(
      (value) {
        log("Splash: ${value.token.toString()}");
        if (value.token == 'null' || value.token!.isEmpty) {
          Timer(Duration(seconds: 3), () => Get.toNamed(RoutesName.loginView));
        } else {
          Timer(Duration(seconds: 3), () => Get.toNamed(RoutesName.homeView));
        }
      },
    );

    Timer(Duration(seconds: 3), () => Get.toNamed(RoutesName.loginView));
  }
}
