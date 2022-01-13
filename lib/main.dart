import 'package:appinion_hrm/routes.dart';
import 'package:appinion_hrm/theme.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Communication',
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,

    );
  }
}