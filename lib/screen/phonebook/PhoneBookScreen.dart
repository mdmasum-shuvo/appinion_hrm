
import 'package:appinion_hrm/screen/common/CustomAppbar.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookItem.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import '../common/CustomAppbar.dart';

class PhoneBookScreen extends GetWidget{
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

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(children: [
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
            ],

            ),
          ),
    )

    );
  }
  
}

