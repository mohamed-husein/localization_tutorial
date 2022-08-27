import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {


  Future<bool> cacheLang(String langCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('LOCALE', langCode);
  }

  Future<String> getCache() async {

    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey('LOCALE')
      ? sharedPreferences.getString('LOCALE')!
      : 'en';
}}
