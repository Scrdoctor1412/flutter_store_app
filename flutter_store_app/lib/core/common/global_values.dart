import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_store_app/core/configs/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

String uri = dotenv.env['API_URI'] ?? "";

class GlobalValues {
  static const String isLoggedInKey = "isLoggedInKey";

  static final SharedPreferences _prefs = sl<SharedPreferences>();

  static bool get isLoggedIn =>
      sl<SharedPreferences>().getBool(isLoggedInKey) ?? false;

  static set isLoggedIn(bool value) =>
      sl<SharedPreferences>().setBool(isLoggedInKey, value);

  // static Future<void> setLoggedIn(bool value) async {
  //   await _prefs.setBool(isLoggedInKey, value);
  // }
}
