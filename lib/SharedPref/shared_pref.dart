import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLang(String lang, String country) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('lang', lang);
  pref.setString('country', country);
  log(lang);
  log(country);
}
