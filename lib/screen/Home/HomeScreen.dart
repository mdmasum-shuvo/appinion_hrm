import 'package:appinion_hrm/screen/common/AppbarDrawer.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:flutter/material.dart';

import '../common/CustomAppbar.dart';
import 'component/ClockCard.dart';
import 'component/DashBoardProgressItem.dart';
import 'data/DashboardData.dart';

class HomeScreen extends StatelessWidget {
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
            const SizedBox(
              height: 44,
            ),
            const Text(
              "Good Morning 🌅 Mr. Masum",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 44,
            ),
            topClockCard(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    children:
                        List.generate(loadDashboardDataList.length, (index) {
                      return Center(
                        child: DashBoardProgressItem(
                            data: loadDashboardDataList[index]),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
