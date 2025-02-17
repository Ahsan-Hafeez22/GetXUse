import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/res/color/color.dart';
import 'package:getxproject/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: isPassword, // Hides text for password fields
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return Utils.snackbarMessage("Caution", 'empty'.tr);
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: AppColor.textFieldColor,
          hintText: hintText.tr,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.blackColor),
          ),
        ),
      ),
    );
  }
}
