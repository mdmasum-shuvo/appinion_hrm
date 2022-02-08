import 'dart:ffi';

import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topClockCard(bool isDashboard, String title, String subTitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(80),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:getProportionateScreenWidth( 16.0)),
              child: Align(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: deepBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        
                        Text(
                          subTitle,
                          style: const TextStyle(color: Colors.black, fontSize: 14),maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 48,
              child: Center(child: Image.asset(_setImage(isDashboard))),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    ),
  );
}

String _setImage(bool isDashboard) {
  if (isDashboard) {
    clockIcon;
  } else  {
    calenderIcon;
  }
  return clockIcon;
}
