import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.date, 
      this.clockIn, 
      this.clockOut, 
      this.status, 
      this.userId, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? date;
  String? clockIn;
  dynamic clockOut;
  int? status;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['clock_in'] = clockIn;
    map['clock_out'] = clockOut;
    map['status'] = status;
    map['user_id'] = userId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}