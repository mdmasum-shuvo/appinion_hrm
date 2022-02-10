import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  WillPopScope(
        onWillPop: () async => false,
        child: Platform.isIOS
            ?  const CupertinoAlertDialog(
          title:  Text(
            "Loading...",
            style: TextStyle(fontSize: 20),
          ),
          content:  CupertinoActivityIndicator(radius: 13.0),
        )
            : AlertDialog(
          title: const Center(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 20),
            ),
          ),
          content:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}