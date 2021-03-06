import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class DashBoardProgressItem extends StatelessWidget {
  const DashBoardProgressItem({Key? key, required this.data}) : super(key: key);
  final DashBoardData data;

  @override
  Widget build(BuildContext context) {
    int progressText = (data.progress * 100).toInt();
    final Color color = data.color;
    return SizedBox(
        child: Expanded(
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(10),
                        height: getProportionateScreenHeight(10),
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
                                fontSize: 12
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(10),
                        height: getProportionateScreenHeight(10),
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
                          style: const TextStyle(color: Colors.black,  fontSize: 12,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  CircularPercentIndicator(
                    radius: getProportionateScreenHeight(110.0),
                    lineWidth: 8.0,
                    percent: data.progress,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              progressText.toString(),
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "%",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),


                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Expanded(
                            child: Text(

                              data.title,
                              style: const TextStyle(fontSize: 10),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),

                          ),
                        ),
                      ],
                    ),
                    progressColor: data.color,
                    animationDuration: 1000,
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}

