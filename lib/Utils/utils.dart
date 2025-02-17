import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxproject/res/color/color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: AppColor.blackColor,
        // gravity: ToastGravity.BOTTOM,
        textColor: AppColor.whiteColor);
  }

  static snackbarMessage(String title, String msg) {
    Get.snackbar(title, msg, snackPosition: SnackPosition.BOTTOM);
  }
}
