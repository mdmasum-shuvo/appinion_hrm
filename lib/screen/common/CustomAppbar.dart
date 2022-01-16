import 'package:appinion_hrm/theme/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar customAppbarWidget() {
  return AppBar(
    // Set this height
    elevation: 0,
    backgroundColor: transparent,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [purple, purpleLight],
      )),
      child: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Appinion HRM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(children: const [
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              )
            ]),
          )
        ]),
      ),
    ),
  );
}
