
import 'package:appinion_hrm/model/leave/leaveList/data.dart';
import 'package:appinion_hrm/screen/common/imoji.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';

class LeaveItem extends StatelessWidget{
  const LeaveItem({Key? key, required this.data}) : super(key: key);
  final Data data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: SizedBox(
      height: getProportionateScreenHeight(66),
      width: double.infinity,
      child:
        Padding(
          padding:  EdgeInsets.all(getProportionateScreenWidth(8.0)),
          child: Row(
            children: [
              SizedBox(
                child: sickEmoji()
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(data.leaveType!+" ("+data.leaveSlot!+")",style: const TextStyle(color:yellow,fontSize: 14,fontWeight: FontWeight.bold),)),
                    Expanded(child: Text(data.fromDate!+"-"+data.toDate!,style: const TextStyle(color:Colors.grey,fontSize: 12),),),
                    Expanded(child: Text(data.leaveStatus!,style: const TextStyle(color:Colors.grey,fontSize: 10),),),
                  ],),
              )
            ],
          ),
        ),

    ));
  }

}