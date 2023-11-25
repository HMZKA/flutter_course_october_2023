import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? storage;
  static init() async {
    storage = await SharedPreferences.getInstance();
  }

  static setBool({required String key, required bool value}) {
    storage?.setBool(key, value);
  }

  static getStorage({required String key}) {
    return storage?.get(key);
  }
}
