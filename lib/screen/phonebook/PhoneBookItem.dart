
import 'package:appinion_hrm/model/phone_book.dart';
import 'package:appinion_hrm/repository/NetoworkConstant.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookScreen.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneBookItem extends StatelessWidget{
  const PhoneBookItem({Key? key, required this.data}) : super(key: key);
  final PhoneBook data;
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
                  backgroundImage: NetworkImage(IMAGE_URL+data.photo!),
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8.0)),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text(data.name!+" ("+data.bloodGroup!+")",style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),
                      Expanded(child: Text(data.designations!,style: const TextStyle(color: Colors.black,fontSize: 12),),),
                      Expanded(child: Text("Phone : "+data.phone!,style: const TextStyle(color: Colors.black,fontSize: 12),)),
                      Expanded(child: Text("Email : "+data.email!,style: const TextStyle(color: Colors.black,fontSize: 12),)),
                    ],),
                  )
                ],
                ),
          ),
            ),
          ));
  }

}