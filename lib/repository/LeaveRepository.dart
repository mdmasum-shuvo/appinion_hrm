import 'dart:convert';

import 'package:appinion_hrm/controller/AuthController.dart';
import 'package:appinion_hrm/model/DefaultResponse.dart';
import 'package:appinion_hrm/model/leave/LeaveData.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/model/leave/leaveList/all_leave_response.dart';
import 'package:http/http.dart' as http;

import 'NetoworkConstant.dart';

class LeaveRepository{
  static var client = http.Client();
  static String token=AuthController.token;

  static Future<DefaultResponse?> applyLeave(LeavePost post) async{
    var url = BASE_URL + APPLY_LEAVE;

    Map data=post.toJson();
    String body = json.encode(data);

    var response = await client.post(Uri.parse(url), body: body,
        headers: <String, String>{
          'Accept': 'application/json',
          'content-type': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if(response.statusCode==200){
      var responseData=DefaultResponse.fromJson(response);
      return responseData;
    }
    return null;
  }


  static Future<LeaveData?> leaveInfo() async{
    var url = BASE_URL + LEAVE_INFO;


    var response = await client.get(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if(response.statusCode==200){
      var responseData=LeaveData.fromJson(response.body);
      return responseData;
    }
    return null;
  }


  static Future<AllLeaveResponse?> allLeaveRequest(String page) async{
    var url = BASE_URL + LEAVE_LIST;


    var response = await client.get(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if(response.statusCode==200){
      var responseData=AllLeaveResponse.fromJson(response.body.toString());
      return responseData;
    }
    return null;
  }

}