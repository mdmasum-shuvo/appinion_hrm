import 'supervisor.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.name, 
      this.userid, 
      this.email, 
      this.gender, 
      this.dob, 
      this.address, 
      this.phone, 
      this.joiningDate, 
      this.photo, 
      this.designation, 
      this.supervisor,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userid = json['userid'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    phone = json['phone'];
    joiningDate = json['joining_date'];
    photo = json['photo'];
    designation = json['designation'];
    supervisor = json['supervisor'] != null ? Supervisor.fromJson(json['supervisor']) : null;
  }
  int? id;
  String? name;
  String? userid;
  String? email;
  String? gender;
  String? dob;
  String? address;
  String? phone;
  String? joiningDate;
  String? photo;
  String? designation;
  Supervisor? supervisor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['userid'] = userid;
    map['email'] = email;
    map['gender'] = gender;
    map['dob'] = dob;
    map['address'] = address;
    map['phone'] = phone;
    map['joining_date'] = joiningDate;
    map['photo'] = photo;
    map['designation'] = designation;
    if (supervisor != null) {
      map['supervisor'] = supervisor?.toJson();
    }
    return map;
  }

}