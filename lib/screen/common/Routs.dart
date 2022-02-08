
import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/leave/LeaveDashboardScreen.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookScreen.dart';

import 'package:get/get.dart';

class Routes{

  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/leave', page: () => LeaveDashBoardScreen()),
    GetPage(name: '/phone_book', page: () => PhoneBookScreen())
  ];
}