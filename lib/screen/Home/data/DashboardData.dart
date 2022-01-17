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

List<DashBoardData> loadDashboardDataList = [
  DashBoardData(id: 0, title: "Present", subTitle: "Absent", progress: .90,color: Colors.green),
  DashBoardData(id: 0, title: "late/Leave Early", subTitle: "Ontime", progress: 0.25,color: Colors.red),
  DashBoardData(id: 0, title: "Total Working Hour", subTitle: "Short Working Hour", progress: 0.70,color: Colors.lightBlue),
  DashBoardData(id: 0, title: "Overtime", subTitle: "Total Working Hour", progress: 0.5,color: Colors.orange),

];
