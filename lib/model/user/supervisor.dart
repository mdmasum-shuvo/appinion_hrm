import 'dart:convert';

Supervisor supervisorFromJson(String str) => Supervisor.fromJson(json.decode(str));
String supervisorToJson(Supervisor data) => json.encode(data.toJson());
class Supervisor {
  Supervisor({
      this.id, 
      this.name, 
      this.userid,});

  Supervisor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userid = json['userid'];
  }
  int? id;
  String? name;
  String? userid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['userid'] = userid;
    return map;
  }

}