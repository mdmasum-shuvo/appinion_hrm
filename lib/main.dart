import 'package:appinion_hrm/routes.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/common/Routs.dart';
import 'package:appinion_hrm/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'appinion hrm',
      theme: theme(),
      initialRoute: "/",
      getPages: Routes.routes,
    );
  }
}
