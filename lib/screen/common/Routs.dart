
import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';

import 'package:get/get.dart';

class Routes{

  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/home', page: () => HomeScreen())
  ];
}