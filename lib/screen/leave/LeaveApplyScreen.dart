
import 'package:appinion_hrm/controller/LeaveController.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../common/CustomAppbar.dart';

class LeaveScreenState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LeaveApplyScreen();
  TimeOfDay selectedTime =TimeOfDay.now();
}

class LeaveApplyScreen extends State<LeaveScreenState>{
  String leavCeat = 'Sick Leave';
  String leavType = 'Half day Leave';
  DateTime _selectedDate=new DateTime.now();
  DateTime _selectedDateEnd=new DateTime.now();
  final applyController=Get.put(LeaveController());
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
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
        child:Stack(
          children: [
            Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0.0),
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
                                padding: const EdgeInsets.fromLTRB(16.0,16,0,0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text("Leave Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                      Expanded(
                                        child:  DropdownButton<String>(
                                        value: leavCeat,
                                        style: const TextStyle(color: gray),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            leavCeat = newValue!;
                                          });
                                        },
                                        items: <String>['Sick Leave', 'Casual Leave']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )

                              ),
                                ],),
                              ),),
                          ),
                          Spacer(), // use Spacer
                          SizedBox(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(170),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16.0,16,0,0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Leave Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    Expanded(
                                        child:  DropdownButton<String>(
                                          value: leavType,
                                          style: const TextStyle(color: gray),
                                          onChanged: (String? newValue1) {
                                            setState(() {
                                              leavType = newValue1!;
                                            });
                                          },
                                          items: <String>['Half day Leave', 'Full day Leave']
                                              .map<DropdownMenuItem<String>>((String value1) {
                                            return DropdownMenuItem<String>(
                                              value: value1,
                                              child: Text(value1),
                                            );
                                          }).toList(),
                                        )

                                    ),
                                  ],),
                              ),),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(170),
                            child: GestureDetector(
                              onTap: (){
                                _pickDateDialog(true);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16.0,16,0,0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Start Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                      Expanded(
                                          child:  Text(_selectedDate.toString(),style: TextStyle(color: gray,fontSize: 14),maxLines: 1,)
                                      ),
                                    ],),
                                ),),
                            ),
                          ),
                          Spacer(), // use Spacer
                          SizedBox(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(170),
                            child: GestureDetector(
                              onTap: (){
                                _pickDateDialog(false);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16.0,16,0,0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                    Text("End Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                      Expanded(
                                      child:  Text(_selectedDateEnd.toString(),style: TextStyle(color: gray),maxLines: 1,)
                                  ),


                                    ],),
                                ),),
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
                              padding: const EdgeInsets.fromLTRB(16.0,16,0,8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("No of Days",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  Expanded(
                                      child:  Text("2",style: TextStyle(color: gray),)
                                  ),
                                ],),
                            ),),

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
                              padding: const EdgeInsets.fromLTRB(16.0,16,0,8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Reason for leave",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            // use Spacer
                                  TextField(
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                      hintText: 'reason of leave',
                                    ),
                                    autofocus: false,
                                   // focusNode: _focusnode,
                                    //controller: _newreplycontroller,
                                    keyboardType: TextInputType.text,
                                  ),

                                ],),
                            ),),

                      ),
                   ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(80),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0,16,0,8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Attachment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                Spacer(), // use Spacer
                                Expanded(
                                    child:  Text("Add files",style: TextStyle(color: gray),)
                                ),
                              ],),
                          ),),

                      ),
                    ),
                  ],
    ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 36),
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
                      LeavePost post=LeavePost();
                      post.fromDate="15-03-2022";
                      post.toDate="16-03-2022";
                      post.leaveSlotId=1;
                      post.leaveTypeId=3;
                      post.reason="vacation";
                      applyController.requestApplyLeave(post);
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

          ],
        )
    )
    );
  }

  //Method for showing the date picker
  void _pickDateDialog(bool isDate) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(2022),
        //what will be the previous supported year in picker
        lastDate:DateTime(2030)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        if(isDate){
          _selectedDate=pickedDate;
        }else{
          _selectedDateEnd=pickedDate;

        }
      });
    });
  }
}


