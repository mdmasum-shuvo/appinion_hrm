import 'package:appinion_hrm/theme/Colors.dart';
import 'package:flutter/material.dart';
class DashBoardData {
  late int id;

  late String title;
  late String subTitle;
  late double progress;
  late Color  color;

  DashBoardData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.progress,
      required this.color});
}


class LeaveDashBoardData {
  late int id;

  late String title;
  late String subTitle;
  late int actualData;
  late int remainData;
  late Color  color;

  LeaveDashBoardData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.actualData,
      required this.remainData,
      required this.color});
}

List<DashBoardData> loadDashboardDataList = [
  DashBoardData(id: 0, title: "Present", subTitle: "Absent", progress: 1,color: green),
  DashBoardData(id: 0, title: "Late/Leave Early", subTitle: "On time", progress: 0.25,color: red),
  DashBoardData(id: 0, title: "Total Working\nHour", subTitle: "Short Working Hour", progress: 0.70,color: lightGreen),
  DashBoardData(id: 0, title: "Overtime", subTitle: "Total Working Hour", progress: 0.5,color: orange),

];

List<LeaveDashBoardData> loadLeavedDataList = [
  LeaveDashBoardData(id: 0, title: "Casual Leave", subTitle: "Leave Remain", actualData: 12,remainData: 5,color: green),
  LeaveDashBoardData(id: 0, title: "Sick Leave", subTitle: "Leave Remain", actualData: 18,remainData:16,color: yellow),
  LeaveDashBoardData(id: 0, title: "Special Leave", subTitle: "Leave Remain", actualData: 5,remainData: 2,color: brown),
  LeaveDashBoardData(id: 0, title: "Unpaid Leave", subTitle: "Leave Remain", actualData: 5,remainData: 3,color: red),

];



