import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    } else {
      return false;
    }
  }

  dynamic getData({required String key}) {
    sharedPreferences.get(key);
  }
}
