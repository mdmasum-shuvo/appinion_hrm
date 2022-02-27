import 'package:appinion_hrm/controller/ClockController.dart';
import 'package:appinion_hrm/screen/common/AppbarDrawer.dart';
import 'package:appinion_hrm/screen/common/Loader.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/CustomAppbar.dart';
import 'component/ClockCard.dart';
import 'component/DashBoardProgressItem.dart';
import 'data/DashboardData.dart';

class HomeScreen extends GetWidget {
  static const routeName = '/home_screen';
  final clockController = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarWidgetHome(),
      drawer: AppbarDrawer(),
      body: Stack(
        children: [
          Container(
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
                GestureDetector(onTap: () {
                  _popupDialog(context, clockController);
                }, child: GetX<ClockController>(builder: (controllerClock) {
                  return topClockCard(true, clockController.clockText.value,
                      controllerClock.clockInTime.value);
                })),
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
          GetX<ClockController>(builder: (controllerClock) {
            if (controllerClock.isLoading.value) {
              return Center(
                child: CircularLoading(),
              );
            } else {
              return const Text("");
            }
          }),
        ],
      ),
    );
  }
}

void _popupDialog(BuildContext context, ClockController clockController) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Clock in/out'),
          content: const Text('Are you sure to clock in/out right now ?'),
          actions: <Widget>[
            TextButton(
                onPressed: () => {
                      if (clockController.clockText.value == "Clock Out")
                        {clockController.clockOut()}
                      else
                        {clockController.clockIn()}
                    },
                child: const Text('YES')),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('NO')),
          ],
        );
      });
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
