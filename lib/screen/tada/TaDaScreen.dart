import 'package:appinion_hrm/controller/LeaveController.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/common/Loader.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common/CustomAppbar.dart';

class TadaState extends StatefulWidget {
  static const routeName = '/tada_screen';

  @override
  State<StatefulWidget> createState() => TaDaScreen();
  TimeOfDay selectedTime = TimeOfDay.now();
}

class TaDaScreen extends State<TadaState> {
  String leaveCat = 'Sick Leave';
  String leaveType = 'Half day Leave';
  String leaveTypeId = '';
  String leaveSlotId = '';
  String days='0';

  final applyController = Get.put(LeaveController());
  var reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppbarWidget(),
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
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0.0),
                      child:      SizedBox(
                        height: getProportionateScreenHeight(90),
                        width: getProportionateScreenWidth(170),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(16.0, 16, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Category",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Expanded(
                                    child: DropdownButton<String>(
                                      value: leaveCat,
                                      style: const TextStyle(color: gray),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          leaveCat = newValue!;
                                          if (newValue == "Sick Leave") {
                                            leaveTypeId = "4";
                                          } else if (newValue ==
                                              "Casual Leave") {
                                            leaveTypeId = "3";
                                          }
                                        });
                                      },
                                      items: <String>[
                                        'Sick Leave',
                                        'Casual Leave'
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(160),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Purpose",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                // use Spacer
                                Expanded(
                                  child: TextFormField(
                                    //  textAlign: TextAlign.center,
                                      controller: reasonController,
                                      decoration: const InputDecoration(
                                        hintText: "Momenta 4.0 meeting",
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(160),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bill Amount (tk)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                // use Spacer
                                Expanded(
                                  child: TextFormField(
                                    //  textAlign: TextAlign.center,
                                      controller: reasonController,
                                      decoration: const InputDecoration(
                                        hintText: "250",
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(160),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Note",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                // use Spacer
                                Expanded(
                                  child: TextFormField(
                                    //  textAlign: TextAlign.center,
                                      controller: reasonController,
                                      decoration: const InputDecoration(
                                        hintText: "Type",
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 36),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: deepBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          // Get.to(HomeScreen(),transition: Transition.rightToLeft,duration: Duration(seconds: 2));


                          // pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (applyController.isLoading.value) {
                    return Expanded(
                        child: Center(
                            child: Expanded(child: CircularLoading()))
                    );
                  } else {
                    return const Expanded(child: Text(""));
                  }
                }),
              ],
            )));
  }

}

bool isValid(LeavePost post, BuildContext context) {
  if (post.leaveTypeId == "" ||
      post.leaveSlotId == "" ||
      post.fromDate == "" ||
      post.toDate == "") {
    errorText = "please fill up all field";
    // final snackBar1 = SnackBar(content: Text(errorText));

    // ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    Get.snackbar(errorText, "",
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }
  return true;
}
