import 'package:appinion_hrm/screen/Home/component/ClockCard.dart';
import 'package:appinion_hrm/screen/Home/component/DashBoardProgressItem.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/screen/common/AppbarDrawer.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../common/CustomAppbar.dart';


class LeaveDashBoardScreen extends StatelessWidget{
  static const routeName = '/leave_screen';

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
              flex:1,
              child: SizedBox(),
            ),
            topClockCard(true,"Apply for Leave","Take leave if you really need"),
            Expanded(
              flex: 30,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: loadDashboardDataList.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
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