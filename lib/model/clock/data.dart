import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.date, 
      this.clockIn,
      this.userId, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    date = json['date'];
    clockIn = json['clock_in'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? date;
  String? clockIn;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['clock_in'] = clockIn;
    map['user_id'] = userId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}