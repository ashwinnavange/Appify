import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;

class PrefHelper {
  static const String USER_NAME = 'user-name';
  static const String TOKEN = 'token';

  static SharedPreferences? _pref;
  static final PrefHelper _instance = PrefHelper._privateConstructor();

  // Add a static flag to ensure initialization only happens once
  static bool _initialized = false;

  PrefHelper._privateConstructor() {
    if (!_initialized) {
      throw Exception('Call initSharedPref() before using PrefHelper');
    }
  }

  factory PrefHelper() {
    return _instance;
  }

  static Future<void> initSharedPref() async {
    if (!_initialized) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
      _pref = await SharedPreferences.getInstance();
      _initialized = true;
    }
  }

  Future<void> removeCache() async {
    html.window.localStorage.remove(PrefHelper.USER_NAME);
    await _pref!.remove(PrefHelper.USER_NAME);
    html.window.localStorage.remove(PrefHelper.TOKEN);
    await _pref!.remove(PrefHelper.TOKEN);
  }

  Future<bool> setString(String key, String value) async {
    html.window.localStorage[key] = value;
    return await _pref!.setString(key, value);
  }

  String getString(String key) {
    if(html.window.localStorage.containsKey(key)){
      return html.window.localStorage[key]!;
    }
    else if (_pref!.containsKey(key)) {
      return _pref!.getString(key)!;
    } else {
      return '';
    }
  }

  Future<bool> setBool(String key, bool value) async {
    return _pref!.setBool(key, value);
  }

  bool getBool(String key) {
    return _pref!.getBool(key) ?? false;
  }
}