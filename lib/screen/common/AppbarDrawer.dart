import 'package:appinion_hrm/controller/UserController.dart';
import 'package:appinion_hrm/repository/SharePreferanceData.dart';
import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/screen/auth/LoginScreen.dart';
import 'package:appinion_hrm/screen/leave/LeaveDashboardScreen.dart';
import 'package:appinion_hrm/screen/phonebook/PhoneBookScreen.dart';
import 'package:appinion_hrm/screen/tada/TaDaScreen.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarDrawer extends GetWidget {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GetX<UserController>(builder: (controllerClock) {
            return UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage( userController.photo.value),
              ),
              accountName: Text(
                userController.name.value,
                style: const TextStyle(fontSize: 24.0),
              ),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        purple,
                        lightBlue,
                      ])),
              accountEmail: null,
            );

          }),
          const SizedBox(
            height: 32,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(homeIcon),
            ),
            title: const Text('Home',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () {
              Get.to(HomeScreen());

              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(calenderIcon),
            ),
            title: const Text('Leave',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () {
              Get.to(LeaveDashBoardScreen());

              //Navigator.of(context).pushReplacementNamed(LeaveDashBoardScreen.routeName);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(phoneBookIcon),
            ),
            title: const Text("Phonebook",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () {
              Get.to(PhoneBookScreen());
              //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),

          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(phoneBookIcon),
            ),
            title: const Text("Expense Bill",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () {
              Get.to(TadaState());
              //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundImage: AssetImage(adminSettings),
              ),
            ),
            title: const Text('Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(logoutIcon),
            ),
            title: const Text('Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            onTap: () async {
              await SharePrefData.clearPref();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

methhod() {}

itemSelected() {}
