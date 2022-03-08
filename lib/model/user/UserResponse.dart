import 'user.dart';
import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));
String userResponseToJson(UserResponse data) => json.encode(data.toJson());
class UserResponse {
  UserResponse({
      this.status, 
      this.remainingLeave, 
      this.user,});

  UserResponse.fromJson(dynamic json) {
    status = json['status'];
    remainingLeave = json['remaining_leave'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? status;
  int? remainingLeave;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['remaining_leave'] = remainingLeave;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}