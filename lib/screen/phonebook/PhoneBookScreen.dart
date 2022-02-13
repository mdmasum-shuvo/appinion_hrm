
import 'package:appinion_hrm/controller/PhoneBookController.dart';
import 'package:appinion_hrm/screen/common/CustomAppbar.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import '../common/CustomAppbar.dart';

class PhoneBookScreen extends GetWidget{

  final phoneBookController=Get.put(PhoneBookController());

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

          child:Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (phoneBookController.isLoading.value) {
                    return const  Center(child:  CircularProgressIndicator(color: Colors.white,));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.builder(
                        itemCount: phoneBookController.list.length,
                        itemBuilder: (BuildContext context,int index){
                          return PhoneBookItem( data: phoneBookController.list[index],);

                        },
                      ),
                    );
                  }
                }),
              ),
            ],
          )


          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(children: [
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
              PhoneBookItem(),
            ],

            ),
          ),*/
    )

    );
  }

}

