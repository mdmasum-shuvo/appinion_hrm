import 'package:appinion_hrm/screen/HomeScreen.dart';
import 'package:appinion_hrm/screen/LoginScreen.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),

};
