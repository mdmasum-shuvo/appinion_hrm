import 'dart:convert';

import 'package:appinion_hrm/model/login_response.dart';
import 'package:appinion_hrm/repository/NetoworkConstant.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static var client = http.Client();
  static var apiKey = "a92f28e11a27e8e5938a2020be68ba9c";

  static Future<LoginResponse?> loginPost(String userName, String pass) async {
    var url = BASE_URL + SIGN_IN;
    Map data = {'userid': userName, 'password': pass};
    String body = json.encode(data);

    var response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var loginResponse = LoginResponse.fromJson(json);
      return loginResponse;
    } else {
      return null;
    }
  }
}
