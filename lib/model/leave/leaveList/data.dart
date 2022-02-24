import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.fromDate, 
      this.toDate, 
      this.noOfDays, 
      this.status, 
      this.leaveStatus, 
      this.leaveSlot, 
      this.leaveType, 
      this.reason, 
      this.isSupervisorApproved,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    noOfDays = checkDouble(json['no_of_days']);
    status = json['status'];
    leaveStatus = json['leave_status'];
    leaveSlot = json['leave_slot'];
    leaveType = json['leave_type'];
    reason = json['reason'];
    isSupervisorApproved = json['is_supervisor_approved'];
  }
  int? id;
  String? fromDate;
  String? toDate;
  double? noOfDays;
  String? status;
  String? leaveStatus;
  String? leaveSlot;
  String? leaveType;
  String? reason;
  int? isSupervisorApproved;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['from_date'] = fromDate;
    map['to_date'] = toDate;
    map['no_of_days'] = noOfDays;
    map['status'] = status;
    map['leave_status'] = leaveStatus;
    map['leave_slot'] = leaveSlot;
    map['leave_type'] = leaveType;
    map['reason'] = reason;
    map['is_supervisor_approved'] = isSupervisorApproved;
    return map;
  }

}

double? checkDouble(dynamic value) {
  if(value is double) return value;
  if(value is int) return value.toDouble();
  if(value is String) return double.tryParse(value);
  return null;
}