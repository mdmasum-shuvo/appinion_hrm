import 'package:appinion_hrm/controller/LeaveController.dart';
import 'package:appinion_hrm/screen/Home/component/ClockCard.dart';
import 'package:appinion_hrm/screen/Home/component/DashBoardProgressItem.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/screen/common/AppbarDrawer.dart';
import 'package:appinion_hrm/screen/leave/LeaveApplyScreen.dart';
import 'package:appinion_hrm/screen/leave/component/LeaveItem.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/CustomAppbar.dart';
import 'component/LeaveDashboardItem.dart';

class LeaveDashBoardScreen extends GetWidget {
  static const routeName = '/leave_screen';
  final applyController = Get.put(LeaveController());

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
            GestureDetector(
                onTap: () {
                  Get.to(LeaveScreenState());
                },
                child: topClockCard(
                    false, "Apply for Leave", "Take leave if you really need")),
            Expanded(
              flex: 29,
              child: Obx(() {
                if (applyController.isLoading.value) {
                  return  const Center(child:  CircularProgressIndicator(color: Colors.white));
                } else {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: loadLeavedDataList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: getProportionateScreenHeight(200),
                        ),
                        itemBuilder: (_, index) =>
                            LeaveDashboardItem(data: loadLeavedDataList[index]),
                      ));
                }
              }),
            ) ,

/*
            Expanded(
              flex: 30,
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child:  ListView.builder(
                    itemCount: applyController.leaveList.length,
                    itemBuilder: (BuildContext context,int index){
                      return LeaveItem( data: applyController.leaveList[index],);
                    },
                  ),
                );
              }),
            ),*/

            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Obx(() {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:  ListView.builder(
                            itemCount: applyController.pendingLeaveList.length,
                            itemBuilder: (BuildContext context,int index){
                              return LeaveItem( data: applyController.pendingLeaveList[index],);
                            },
                          ),
                      );

                  }),
                ),
              ),
            ) ,

            Expanded(
              flex: 13,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Obx(() {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:  ListView.builder(
                            itemCount: applyController.leaveList.length,
                            itemBuilder: (BuildContext context,int index){
                              return LeaveItem( data: applyController.leaveList[index],);
                            },
                          ),
                      );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
