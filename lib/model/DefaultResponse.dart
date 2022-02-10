import 'dart:convert';

DefaultResponse defaultResponseFromJson(String str) => DefaultResponse.fromJson(json.decode(str));
String defaultResponseToJson(DefaultResponse data) => json.encode(data.toJson());
class DefaultResponse {
  DefaultResponse({
      this.status, 
      this.message,});

  DefaultResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}