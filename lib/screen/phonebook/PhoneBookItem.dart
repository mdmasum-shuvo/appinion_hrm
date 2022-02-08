
import 'package:appinion_hrm/screen/phonebook/PhoneBookScreen.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneBookItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return GestureDetector(child: SizedBox(
       height: getProportionateScreenHeight(96),
     width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:
          Padding(
            padding:  EdgeInsets.all(getProportionateScreenWidth(8.0)),
            child: Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(64),
                  width: getProportionateScreenWidth(64),
                  child: CircleAvatar(
                  backgroundImage: AssetImage(personIcon,),
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8.0)),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text("Md Masum Talukder",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),
                      Expanded(child: Text("Software engineer",style: TextStyle(color: Colors.black,fontSize: 12),),),
                      Expanded(child: Text("Phone : 01680021468",style: TextStyle(color: Colors.black,fontSize: 12),)),
                      Expanded(child: Text("Email : masum.talukder@appinionbd.com",style: TextStyle(color: Colors.black,fontSize: 12),)),
                    ],),
                  )
                ],
                ),
          ),
            ),
          ));
  }

}