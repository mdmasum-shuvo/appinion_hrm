import 'dart:convert';

DashBoardResponse dashBoardResponseFromJson(String str) => DashBoardResponse.fromJson(json.decode(str));
String dashBoardResponseToJson(DashBoardResponse data) => json.encode(data.toJson());
class DashBoardResponse {
  DashBoardResponse({
      this.status, 
      this.totalAttend, 
      this.totalOntime, 
      this.totalLate, 
      this.totalWorkingHour, 
      this.workingHourCoveragePercentage, 
      this.shortWorkingHourPercentage, 
      this.overtimePercentage,});

  DashBoardResponse.fromJson(dynamic json) {
    status = json['status'];
    totalAttend = json['total_attend'];
    totalOntime = json['total_ontime'];
    totalLate = json['total_late'];
    totalWorkingHour = json['total_working_hour'];
    workingHourCoveragePercentage = json['working_hour_coverage_percentage'];
    shortWorkingHourPercentage = json['short_working_hour_percentage'];
    overtimePercentage = json['overtime_percentage'];
  }
  String? status;
  int? totalAttend;
  int? totalOntime;
  int? totalLate;
  int? totalWorkingHour;
  int? workingHourCoveragePercentage;
  int? shortWorkingHourPercentage;
  int? overtimePercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['total_attend'] = totalAttend;
    map['total_ontime'] = totalOntime;
    map['total_late'] = totalLate;
    map['total_working_hour'] = totalWorkingHour;
    map['working_hour_coverage_percentage'] = workingHourCoveragePercentage;
    map['short_working_hour_percentage'] = shortWorkingHourPercentage;
    map['overtime_percentage'] = overtimePercentage;
    return map;
  }

}