import 'package:appinion_hrm/controller/AuthController.dart';
import 'package:appinion_hrm/model/home/DashBoardResponse.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/theme/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'NetoworkConstant.dart';


class DashboardRepository {
  static var client = http.Client();
  static String token = "";

  static sharedFunc() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString(PREF_TOKEN) ?? "";
  }

  static Future<DashBoardResponse?> dashboardRequest() async {
    var url = BASE_URL + DASHBOARD;
    await sharedFunc();

    var response = await client.get(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var responseData = DashBoardResponse.fromJson(response.body);
      return responseData;
    }
    return null;
  }
}