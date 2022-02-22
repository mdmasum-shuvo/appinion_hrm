import 'dart:convert';

LeavePost leavePostFromJson(String str) => LeavePost.fromJson(json.decode(str));
String leavePostToJson(LeavePost data) => json.encode(data.toJson());
class LeavePost {
  LeavePost({
      this.leaveTypeId, 
      this.leaveSlotId, 
      this.fromDate, 
      this.toDate, 
      this.reason,});

  LeavePost.fromJson(dynamic json) {
    leaveTypeId = json['leave_type_id'];
    leaveSlotId = json['leave_slot_id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    reason = json['reason'];
  }
  String? leaveTypeId;
  String? leaveSlotId;
  String? fromDate;
  String? toDate;
  String? reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_type_id'] = leaveTypeId;
    map['leave_slot_id'] = leaveSlotId;
    map['from_date'] = fromDate;
    map['to_date'] = toDate;
    map['reason'] = reason;
    return map;
  }

}