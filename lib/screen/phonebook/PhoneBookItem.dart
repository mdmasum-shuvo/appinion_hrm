import 'package:appinion_hrm/model/phone_book.dart';
import 'package:appinion_hrm/repository/NetworkConstant.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookScreen.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneBookItem extends StatelessWidget {
  const PhoneBookItem({Key? key, required this.data}) : super(key: key);
  final PhoneBook data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
      height: getProportionateScreenHeight(100),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left:getProportionateScreenWidth(8.0),top:getProportionateScreenHeight(8) ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: getProportionateScreenHeight(64),
                  width: getProportionateScreenWidth(64),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(IMAGE_URL + data.photo!),
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        data.name! + " (" + data.bloodGroup! + ")",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                        child: Text(
                          data.designations!,
                          style:
                              const TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        data.phone!,
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      )),
                      Expanded(
                          child: Text(
                        data.email!,
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      )),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  launch("tel://"+data.phone!);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: getProportionateScreenHeight(36),
                        width: getProportionateScreenWidth(36),
                        child: Image.asset(callPhone)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }


}
