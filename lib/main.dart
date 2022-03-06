import 'package:appinion_hrm/routes.dart';
import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/common/Routs.dart';
import 'package:appinion_hrm/theme/constants.dart';
import 'package:appinion_hrm/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin =prefs.getBool(IS_LOGIN);
  runApp(MyApp(isLogin:isLogin!));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'appinion hrm',
      theme: theme(),
      initialRoute: isLogin==false?"/":"/home",
      getPages: Routes.routes,
    );
  }
}

/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogin = prefs.getBool(IS_LOGIN);
  runApp(MaterialApp(home: isLogin == false ? LoginScreen() : HomeScreen()));
}*/
