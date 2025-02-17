import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/res/color/color.dart';
import 'package:getxproject/res/component/round_button.dart';
import 'package:getxproject/res/component/text_field.dart';
import 'package:getxproject/view_model/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('login_now'.tr,
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          Form(
            key: _key,
            child: Column(
              children: [
                CustomTextField(
                  controller: _loginViewModel.emailController.value,
                  focusNode: _loginViewModel.emailFocusNode.value,
                  hintText: 'email_hint',
                  isPassword: false,
                ),
                CustomTextField(
                  controller: _loginViewModel.passwordController.value,
                  focusNode: _loginViewModel.passwordFocusNode.value,
                  hintText: 'password_hint',
                  isPassword: true,
                ),
              ],
            ),
          ),
          RoundButton(
              title: "Login",
              onPress: () {
                if (_key.currentState!.validate()) {}
              })
        ],
      ),
    );
  }
}
