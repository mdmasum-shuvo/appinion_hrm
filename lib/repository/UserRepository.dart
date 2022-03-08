import 'dart:convert';

import 'package:appinion_hrm/model/user/UserResponse.dart';
import 'package:http/http.dart' as http;

import 'NetworkConstant.dart';
import 'SharePreferanceData.dart';

class UserRepository {
  static var client = http.Client();

  static Future<UserResponse?>? userData() async {
    var url = BASE_URL + USER;
    await SharePrefData.sharedFunc();

    var response = await client.get(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer '+SharePrefData.token
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var userResponse = UserResponse.fromJson(json);
      return userResponse;
    } else {
      return null;
    }
  }
}
