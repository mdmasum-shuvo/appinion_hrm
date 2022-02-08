import 'Data.dart';
import 'dart:convert';

ClockInformation clockInformationFromJson(String str) => ClockInformation.fromJson(json.decode(str));
String clockInformationToJson(ClockInformation data) => json.encode(data.toJson());
class ClockInformation {
  ClockInformation({
      this.status, 
      this.data,});

  ClockInformation.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}