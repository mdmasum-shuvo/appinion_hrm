import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class LeaveDashboardItem extends StatelessWidget {
  const LeaveDashboardItem({Key? key, required this.data}) : super(key: key);
  final LeaveDashBoardData data;

  @override
  Widget build(BuildContext context) {
   // int progressText = (data.progress * 100).toInt();
    final double parcent=data.remainData/data.actualData;

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
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
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
                    percent: parcent.toPrecision(2),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              data.remainData.toString()+"/"+data.actualData.toString(),
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w500),
                            ),

                          ],
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
      ),
    );
  }
}

