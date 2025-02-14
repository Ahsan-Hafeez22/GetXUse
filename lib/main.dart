import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Utils/home_screen.dart';
import 'package:getxproject/Utils/languages.dart';
import 'package:getxproject/Pages/screen_one.dart';
import 'package:getxproject/Pages/screen_three.dart';
import 'package:getxproject/Pages/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadLang();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Languages(),
      // locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/screen_one',
          page: () => const ScreenOne(),
        ),
        GetPage(
          name: '/screen_two',
          page: () => ScreenTwo(
            name: "",
          ),
        ),
        GetPage(
          name: '/screen_three',
          page: () => ScreenThree(),
        ),
      ],
    );
  }
}

Future<void> loadLang() async {
  final pref = await SharedPreferences.getInstance();
  final lang = pref.getString('lang') ?? "en";
  final country = pref.getString('country') ?? 'US';
  Get.updateLocale(Locale(lang, country));
}
