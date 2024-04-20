// ignore_for_file: camel_case_types, unused_field, file_names

import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool>  saveData({
    required String key,
    required dynamic value
  }) async{
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } 
    return await _sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    required String key
  })  {
    return _sharedPreferences.get(key);
  }

  static Future<bool> deleteData({
    required String key
  }) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }

}