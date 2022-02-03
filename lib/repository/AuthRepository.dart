import 'dart:convert';

import 'package:appinion_hrm/model/login_response.dart';
import 'package:appinion_hrm/repository/NetoworkConstant.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static var client = http.Client();

  static Future<LoginResponse?> loginPost(String userName, String pass) async {
    var url = BASE_URL + SIGN_IN;
    Map data = {'userid': userName, 'password': pass};
    String body = json.encode(data);

    var response =
        await client.post(Uri.parse(url), body: body,
            headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      var json =jsonDecode(response.body);
      var loginResponse = LoginResponse.fromJson(json);
      return loginResponse;
    } else {
      return null;
    }
  }
}
