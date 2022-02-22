
import 'package:appinion_hrm/controller/AuthController.dart';
import 'package:appinion_hrm/model/home/DashBoardResponse.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:http/http.dart' as http;

import 'NetoworkConstant.dart';


class DashboardRepository {
  static var client = http.Client();
  static String token=AuthController.token;

  static Future<DashBoardResponse?> dashboardRequest() async{
    var url = BASE_URL + DASHBOARD;


    var response = await client.get(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if(response.statusCode==200){
      var responseData=DashBoardResponse.fromJson(response.body);
      return responseData;
    }
    return null;
  }
}