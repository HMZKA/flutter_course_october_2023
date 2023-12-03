import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? storage;
  static init() async {
    storage = await SharedPreferences.getInstance();
  }

  static setString({required String key, required String value}) async {
    await storage?.setString(key, value);
  }

  static getData({required String key}) {
    return storage?.get(key);
  }
}
