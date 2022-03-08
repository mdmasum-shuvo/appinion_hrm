import 'dart:convert';

import 'package:appinion_hrm/controller/AuthController.dart';
import 'package:appinion_hrm/model/clock/clock_response.dart';
import 'package:appinion_hrm/model/clock/info/ClockInformation.dart';
import 'package:appinion_hrm/repository/NetworkConstant.dart';
import 'package:appinion_hrm/repository/SharePreferanceData.dart';
import 'package:appinion_hrm/theme/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ClockInRepository {
  static var client = http.Client();

  static Future<ClockResponse?> clockInRequest() async {
    var url = BASE_URL + CLOCK_IN;
    var response = await client.post(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer '+SharePrefData.token
      // 'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var clockInResponse = ClockResponse.fromJson(json);
      return clockInResponse;
    } else
      return null;
  }

  static Future<ClockResponse?> clockOutRequest() async {
    var url = BASE_URL + CLOCK_OUT;
    //final pref = await SharedPreferences.getInstance();
    //final String token = pref.getString(PREF_TOKEN) ?? "";
    var response = await client.post(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer '+SharePrefData.token
      // 'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var clockInResponse = ClockResponse.fromJson(json);
      return clockInResponse;
    } else
      return null;
  }

  static Future<ClockInformation?> clockInfo() async {
    var url = BASE_URL + CLOCK_INFO;
    await SharePrefData.sharedFunc();

    var response = await client.get(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer '+SharePrefData.token
      // 'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var clockInResponse = ClockInformation.fromJson(json);
      return clockInResponse;
    } else {
      return null;
    }
  }
}
