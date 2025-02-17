import 'package:flutter/material.dart';
// import 'package:getxproject/res/component/round_button.dart';
import 'package:get/get.dart';
import 'package:getxproject/res/asset/images.dart';
import 'package:getxproject/res/color/color.dart';
import 'package:getxproject/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GetX Tutorial App',
              style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Image(
              image: AssetImage(ImageAssets.splashScreenImage),
              height: Get.height * .5,
              width: Get.width * .8,
            ),
          ],
        ),
      ),
    );
  }
}
