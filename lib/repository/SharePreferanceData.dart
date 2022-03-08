import 'package:appinion_hrm/theme/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefData {
  static String token = "";

  static sharedFunc() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString(PREF_TOKEN) ?? "";
  }

  static clearPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(PREF_TOKEN, "");
    pref.setBool(IS_LOGIN, false);
  }
}
