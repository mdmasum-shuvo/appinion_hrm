import 'dart:convert';

import 'package:appinion_hrm/model/clock/clock_response.dart';
import 'package:appinion_hrm/repository/NetoworkConstant.dart';
import 'package:appinion_hrm/theme/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClockInRepository {
  static var client = http.Client();

  static Future<ClockResponse?> clockInRequest() async {
    var url = BASE_URL + CLOCK_IN;
    final pref = await SharedPreferences.getInstance();
    final String token = pref.getString(PREF_TOKEN) ?? "";
    var response = await client.post(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var clockInResponse = ClockResponse.fromJson(json);
      return clockInResponse;
    } else
      return null;
  }
}
