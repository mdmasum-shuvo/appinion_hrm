
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topClockCard(){
  return   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Clock-In",
                      style: TextStyle(
                          color: deepBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "you haven't clock in yet",
                      style: TextStyle(
                          color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 48,
              child: Center(child: Image.asset(clockIcon)),
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