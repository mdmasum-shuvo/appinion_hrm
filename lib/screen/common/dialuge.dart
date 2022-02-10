
import 'package:flutter/material.dart';

Widget showLoaderDialog(){
  return AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
      ],),
  );

}