import 'package:appinion_hrm/controller/ClockController.dart';
import 'package:appinion_hrm/screen/common/AppbarDrawer.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../common/CustomAppbar.dart';
import 'component/ClockCard.dart';
import 'component/DashBoardProgressItem.dart';
import 'data/DashboardData.dart';

class HomeScreen extends GetWidget<ClockController> {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarWidget(),
      drawer: AppbarDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              purple,
              lightBlue,
            ])),
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Text(
              "Good Morning 🌅 Mr. Masum",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            GestureDetector(
                onTap: () {
                  controller.clockIn();
                },
                child:
                    topClockCard(true, "Clock In", "you haven't clock in yet")),
            Expanded(
              flex: 30,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: loadDashboardDataList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: getProportionateScreenHeight(200),
                    ),
                    itemBuilder: (_, index) => DashBoardProgressItem(
                        data: loadDashboardDataList[index]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/*GridView.count(
crossAxisCount: 2,
children:
List.generate(loadDashboardDataList.length, (index) {
return Center(
child: DashBoardProgressItem(
data: loadDashboardDataList[index]),
);
})),*/
