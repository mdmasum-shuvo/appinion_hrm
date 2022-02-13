import 'dart:convert';

LeaveData leaveDataFromJson(String str) => LeaveData.fromJson(json.decode(str));
String leaveDataToJson(LeaveData data) => json.encode(data.toJson());
class LeaveData {
  LeaveData({
      this.status, 
      this.casualLeave, 
      this.casualLeaveUse, 
      this.sickLeaveAssign, 
      this.sickLeaveUse,});

  LeaveData.fromJson(dynamic json) {
    status = json['status'];
    casualLeave = json['casual_leave'];
    casualLeaveUse = json['casual_leave_use'];
    sickLeaveAssign = json['sick_leave_assign'];
    sickLeaveUse = json['sick_leave_use'];
  }
  String? status;
  String? casualLeave;
  int? casualLeaveUse;
  String? sickLeaveAssign;
  int? sickLeaveUse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['casual_leave'] = casualLeave;
    map['casual_leave_use'] = casualLeaveUse;
    map['sick_leave_assign'] = sickLeaveAssign;
    map['sick_leave_use'] = sickLeaveUse;
    return map;
  }

}