import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeAndUtilsProvider extends ChangeNotifier {
  bool isDark = false;
  bool isDemo = false;
  bool isShow = true;
  SharedPreferences? pref;

// initialize preference
  Future<void> initPref() async {
    pref = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> changeThemeMode(bool mode) async {
    initPref().whenComplete(() => pref!.setBool(themeKey, mode));
    isDark = mode;
    notifyListeners();
  }

//change the theme
  Future<void> changeAccountMode(bool isLive) async {
    initPref().whenComplete(() => pref!.setBool(accountModeKey, isLive));
    isDemo = isLive;
    notifyListeners();
  }

  // show notification provider value

  Future<void> showNotification(bool shown) async {
    initPref().whenComplete(() => pref!.setBool(showNotifyKey, shown));
    isShow = shown;
    notifyListeners();
  }
}
