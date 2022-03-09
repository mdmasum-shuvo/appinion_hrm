import 'package:appinion_hrm/controller/LeaveController.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/common/Loader.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl/intl.dart';
import '../common/CustomAppbar.dart';

class LeaveScreenState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LeaveApplyScreen();
  TimeOfDay selectedTime = TimeOfDay.now();
}

class LeaveApplyScreen extends State<LeaveScreenState> {
  String leaveCat = 'Sick Leave';
  String leaveType = 'Half day Leave';
  String leaveTypeId = '';
  String leaveSlotId = '';
  String days='0';
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDateEnd = DateTime.now();
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
                      child: Row(
                        children: [
                          SizedBox(
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
                                      "Leave Category",
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
                          const Spacer(), // use Spacer
                          SizedBox(
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
                                      "Leave Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Expanded(
                                        child: DropdownButton<String>(
                                      value: leaveType,
                                      style: const TextStyle(color: gray),
                                      onChanged: (String? newValue1) {
                                        setState(() {
                                          leaveType = newValue1!;
                                          if (newValue1 == "Half day Leave") {
                                            leaveSlotId = "2";
                                          } else if (newValue1 ==
                                              "Full day Leave") {
                                            leaveSlotId = "1";
                                          }
                                        });
                                      },
                                      items: <String>[
                                        'Half day Leave',
                                        'Full day Leave'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value1) {
                                        return DropdownMenuItem<String>(
                                          value: value1,
                                          child: Text(value1),
                                        );
                                      }).toList(),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(170),
                            child: GestureDetector(
                              onTap: () {
                                _pickDateDialog(true);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16.0, 16, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Start Date",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Expanded(
                                          child: Text(
                                        _selectedDate.toString(),
                                        style: const TextStyle(
                                            color: gray, fontSize: 14),
                                        maxLines: 1,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(), // use Spacer
                          SizedBox(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(170),
                            child: GestureDetector(
                              onTap: () {
                                _pickDateDialog(false);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16, 0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "End Date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Expanded(
                                          child: Text(
                                        _selectedDateEnd.toString(),
                                        style: const TextStyle(color: gray),
                                        maxLines: 1,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(90),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  "No of Days",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Expanded(
                                    child: Text(
                                      days,
                                  style: TextStyle(color: gray),
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
                                  "Reason for leave",
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
                                        hintText: "reason",
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
                          LeavePost post = LeavePost();
                          post.fromDate = DateFormat("dd-MM-yyyy")
                              .format(DateTime.parse(_selectedDate.toString()));
                          post.toDate = DateFormat("dd-MM-yyyy").format(
                              DateTime.parse(_selectedDateEnd.toString()));
                          post.leaveSlotId = leaveSlotId;
                          post.leaveTypeId = leaveTypeId;
                          post.reason = reasonController.text.toString();
                          if (isValid(post, context)) {
                            applyController.requestApplyLeave(post);
                          }

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

  //Method for showing the date picker
  void _pickDateDialog(bool isDate) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(2022),
            //what will be the previous supported year in picker
            lastDate: DateTime(
                2030)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
       // final birthdayDate = DateTime(_selectedDate);
        //final toDayDate = DateTime.now();

        if (isDate) {
          _selectedDate = pickedDate;
          var different = _selectedDateEnd.difference(_selectedDate).inDays;
          days= different.toString();
        } else {
          _selectedDateEnd = pickedDate;
          var different = _selectedDateEnd.difference(_selectedDate).inDays+1;
          days= different.toString();
        }
      });
    });
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
