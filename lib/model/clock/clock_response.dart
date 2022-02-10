import 'data.dart';
import 'dart:convert';

ClockResponse clockResponseFromJson(String str) => ClockResponse.fromJson(json.decode(str));
String clockResponseToJson(ClockResponse data) => json.encode(data.toJson());
class ClockResponse {
  ClockResponse({
      this.status, 
      this.message, 
      this.clockIn, 
      this.lateClockin, 
      this.data,});

  ClockResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    clockIn = json['clock_in'];
    lateClockin = json['late_clockin'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  String? clockIn;
  bool? lateClockin;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['clock_in'] = clockIn;
    map['late_clockin'] = lateClockin;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}