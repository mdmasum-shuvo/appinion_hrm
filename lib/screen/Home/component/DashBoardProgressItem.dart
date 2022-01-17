import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

const colors = [
  Colors.red,
  Colors.blue,
  Colors.cyan,
  Colors.green,
];

class DashBoardProgressItem extends StatelessWidget {
  const DashBoardProgressItem({Key? key, required this.data}) : super(key: key);
  final DashBoardData data;

  @override
  Widget build(BuildContext context) {
    int progressText = (data.progress * 100).toInt();
    final Color color = data.color;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      },
      child: SizedBox(
        child: Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 10, bottom: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: data.color),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(data.title,
                              style: TextStyle(
                                color: data.color,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: offWhite),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          data.subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 10.0,
                      percent: data.progress,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                progressText.toString(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "%",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width:80,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                data.title,
                                style: const TextStyle(fontSize: 10),
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                      progressColor: data.color,
                      animationDuration: 1000,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final progressbar = CircularPercentIndicator(
  radius: 45.0,
  lineWidth: 10.0,
  percent: 0.60,
  center: const Text("60%"),
  progressColor: green,
);
